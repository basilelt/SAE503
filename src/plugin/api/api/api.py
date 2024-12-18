# FILE: api.py
from flask import Flask, request
import subprocess
import os

app = Flask(__name__)
mapid = []
upserv = []

def apply_kubernetes_configs(pod_yaml, storage_yaml):
    yaml_dir = "/app/tmp"
    os.makedirs(yaml_dir, exist_ok=True)
    
    pod_path = os.path.join(yaml_dir, "pod.yaml")
    storage_path = os.path.join(yaml_dir, "storage.yaml")
    
    with open(pod_path, 'w') as f:
        f.write(pod_yaml)
    
    with open(storage_path, 'w') as f:
        f.write(storage_yaml)

    host = os.getenv("KUBE_HOST")
    ssh_user = os.getenv("SSH_USER")
    
    # Add host key to known hosts
    subprocess.run([
        "ssh-keyscan", "-H", host, ">> /root/.ssh/known_hosts"
    ], check=True)
    
    # Apply configs
    for config in [storage_path, pod_path]:
        result = subprocess.run([
            "ssh",
            "-i", "/root/.ssh/id_vagrant_common_key",
            f"{ssh_user}@{host}",
            f"kubectl apply -f {os.path.basename(config)}"
        ], check=True)
        
        if result.returncode != 0:
            raise Exception(f"Failed to apply {config}")

@app.route('/create_server', methods=['POST'])
def create_server():
    registry = os.getenv("REGISTRY")

    # Récupérer l'UUID envoyé par le plugin
    uuid = request.args.get('uuid')
    for i in mapid:
        if i == uuid:
            #start_server
            return f"Serveur deja crée lancement du server"
    # Afficher l'UUID reçu
    print('UUID reçu :', uuid)

    # Créer le nom du volume en utilisant l'UUID
    volume_name = f'minecraft_data_{uuid}'

    storage_yaml = f"""apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {uuid}-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: longhorn
  resources:
    requests:
      storage: 500Mi"""

    pod_yaml = f"""apiVersion: v1
kind: Pod
metadata:
  name: {uuid}
spec:
  containers:
  - name: minecraft-server
    image: {registry}:5000/game-server
    ports:
    - containerPort: 25565
    env:
    - name: EULA
      value: "TRUE"
    - name: ONLINE_MODE
      value: "FALSE"
    volumeMounts:
    - mountPath: /data
      name: data-volume
  volumes:
  - name: data-volume
    persistentVolumeClaim:
      claimName: {uuid}-pvc"""

    apply_kubernetes_configs(pod_yaml, storage_yaml)

    mapid.append(uuid)
    upserv.append(uuid)
    return f"Serveur créé pour l'UUID : {uuid}"


@app.route('/stop_server', methods=['POST'])
def stop_server():
    # Récupérer l'UUID envoyé par le plugin
    uuid = request.args.get('uuid')
    if uuid in upserv:
        # Créer le nom du volume en utilisant l'UUID
        volume_name = f'minecraft_data_{uuid}'

        cmd = [
            "docker", "stop", f"{uuid}"
        ]
        subprocess.run(cmd, check=True)
        upserv.remove(uuid)
        mapid.remove(uuid)
        return f"Serveur {uuid} arrêté"
    return "UUID non trouvé"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

@app.route('/start_server', methods=['POST'])
def start_server():
    # Récupérer l'UUID envoyé par le plugin
    uuid = request.args.get('uuid')
    for i in upserv:
        if i == uuid:
            start_server
            return f"Serveur deja lancée"
    # Afficher l'UUID reçu
    print('UUID reçu :', uuid)

    # Créer le nom du volume en utilisant l'UUID
    volume_name = f'minecraft_data_{uuid}'

    cmd = [
        "docker", "start", f"{uuid}"
    ]

    subprocess.run(cmd, check=True)
    upserv.append(uuid)
    return f"Serveur créé pour l'UUID : {uuid}"