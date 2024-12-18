# FILE: api.py
from flask import Flask, request
import subprocess

app = Flask(__name__)
mapid = []
upserv = []
@app.route('/create_server', methods=['POST'])
def create_server():
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
    image: itzg/minecraft-server
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

    with open('pod.yaml', 'w') as f:
        f.write(pod_yaml)

    with open('storage.yaml', 'w') as f:
        f.write(storage_yaml)

    subprocess.run(["ssh", "vagrant@192.168.30.11", "kubectl apply -f storage.yaml"])
    subprocess.run(["ssh", "utilisateur@serveur_distant", "kubectl apply -f pod.yaml"])

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