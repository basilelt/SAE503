Sure! Below is a comprehensive guide to creating Ansible roles and a playbook to automatically deploy a Kubernetes cluster on your master and three slave nodes. This setup is based on the provided codebase snippets and follows the steps outlined in the [LinuxTechi Kubernetes Installation Tutorial](https://www.linuxtechi.com/install-kubernetes-cluster-on-debian/).

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Directory Structure](#directory-structure)
- [Ansible Inventory](#ansible-inventory)
- [Group Variables](#group-variables)
  - [All Group Variables](#all-group-variables)
  - [Master Group Variables](#master-group-variables)
  - [Slave Group Variables](#slave-group-variables)
  - [Variables File](#variables-file)
- [Roles Overview](#roles-overview)
- [Role: system](#role-system)
  - [Tasks](#tasks)
- [Role: container-runtime](#role-container-runtime)
  - [Tasks](#tasks-1)
- [Role: kubernetes](#role-kubernetes)
  - [Tasks](#tasks-2)
- [Role: flannel](#role-flannel)
  - [Tasks](#tasks-3)
- [Role: networking](#role-networking)
  - [Tasks](#tasks-4)
- [Main Playbook](#main-playbook)
- [Requirements](#requirements)
- [Running the Playbook](#running-the-playbook)
  - [Explanation of the Command:](#explanation-of-the-command)
- [Additional Notes](#additional-notes)

---

## Directory Structure

Organize your Ansible project with the following directory structure:

```
kubernetes-playbook/
├── deploy_kubernetes.yml
├── inventory.yml
├── group_vars/
│   ├── all.yml
│   ├── master.yml
│   ├── slave1.yml
│   ├── slave2.yml
│   └── slave3.yml
├── roles/
│   ├── system/
│   │   └── tasks/
│   │       └── main.yml
│   ├── container-runtime/
│   │   └── tasks/
│   │       └── main.yml
│   ├── kubernetes/
│   │   └── tasks/
│   │       └── main.yml
│   ├── flannel/
│   │   └── tasks/
│   │       └── main.yml
│   └── networking/
│       └── tasks/
│           └── main.yml
├── vars/
│   └── main.yml
└── requirements.yml
```

---

## Ansible Inventory

Your `inventory.yml` defines the master and slave nodes along with their respective SSH ports.

```yaml
# kubernetes-playbook/inventory.yml
---
all:
  children:
    vm:
      children:
        masters:
          hosts:
            master:
              ansible_host: 192.168.56.10
              ansible_port: 2300

        slaves:
          hosts:
            slave1:
              ansible_host: 192.168.56.11
              ansible_port: 2301
            slave2:
              ansible_host: 192.168.56.12
              ansible_port: 2302
            slave3:
              ansible_host: 192.168.56.13
              ansible_port: 2303
```

---

## Group Variables

Define common variables for all nodes and specific variables for the master and slaves.

### All Group Variables

```yaml
# kubernetes-playbook/group_vars/all.yml
---
ansible_become_method: sudo
ansible_ssh_common_args: '-o StrictHostKeyChecking=no'
```

### Master Group Variables

```yaml
# kubernetes-playbook/group_vars/master.yml
---
ip: "{{ master_ip }}"
```

### Slave Group Variables

```yaml
# kubernetes-playbook/group_vars/slave1.yml
---
ip: "{{ slave1_ip }}"
```

```yaml
# kubernetes-playbook/group_vars/slave2.yml
---
ip: "{{ slave2_ip }}"
```

```yaml
# kubernetes-playbook/group_vars/slave3.yml
---
ip: "{{ slave3_ip }}"
```

### Variables File

```yaml
# kubernetes-playbook/vars/main.yml
---
kubeadm_token: "jjyon1.bfztgwfuxavldki2"
kubeadm_hash: "29b6281be8bd08fd2d993e322f8037491f32006d925a4cd96cd1568563d12e5f"
```

---

## Roles Overview

Ansible roles are reusable units of configuration. The following roles are required for deploying Kubernetes:

1. **system**: Updates the system and installs necessary packages.
2. **container-runtime**: Installs and configures Docker as the container runtime.
3. **kubernetes**: Installs Kubernetes components (`kubeadm`, `kubelet`, `kubectl`).
4. **flannel**: Deploys the Flannel CNI plugin for networking.
5. **networking**: Configures network settings required by Kubernetes.

---

## Role: system

This role updates the system packages and installs essential utilities.

### Tasks

```yaml
# kubernetes-playbook/roles/system/tasks/main.yml
---
- name: Update and upgrade apt packages
  apt:
    update_cache: yes
    upgrade: dist
  become: yes

- name: Install required packages
  apt:
    name:
      - curl
      - apt-transport-https
      - ca-certificates
      - software-properties-common
      - gnupg
    state: present
  become: yes
```

---

## Role: container-runtime

This role installs Docker and configures it as the container runtime.

### Tasks

```yaml
# kubernetes-playbook/roles/container-runtime/tasks/main.yml
---
- name: Add Docker’s official GPG key
  apt_key:
    url: https://download.docker.com/linux/debian/gpg
    state: present
  become: yes

- name: Add Docker APT repository
  apt_repository:
    repo: deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable
    state: present
  become: yes

- name: Update apt package index
  apt:
    update_cache: yes
  become: yes

- name: Install Docker Engine
  apt:
    name:
      - docker-ce
      - docker-ce-cli
      - containerd.io
    state: present
    update_cache: yes
  become: yes

- name: Add Kubernetes APT key
  apt_key:
    url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    state: present
  become: yes

- name: Add Kubernetes APT repository
  apt_repository:
    repo: deb https://apt.kubernetes.io/ kubernetes-xenial main
    state: present
  become: yes

- name: Update apt package index
  apt:
    update_cache: yes
  become: yes

- name: Install Docker dependencies
  apt:
    name:
      - cgroupfs-mount
    state: present
  become: yes

- name: Create Docker daemon config directory
  file:
    path: /etc/docker
    state: directory
    mode: '0755'
  become: yes

- name: Configure Docker daemon
  copy:
    dest: /etc/docker/daemon.json
    content: |
      {
        "exec-opts": ["native.cgroupdriver=systemd"],
        "log-driver": "json-file",
        "log-opts": {
          "max-size": "100m"
        },
        "storage-driver": "overlay2"
      }
  become: yes

- name: Restart Docker
  systemd:
    name: docker
    state: restarted
    enabled: yes
  become: yes

- name: Add user to Docker group
  user:
    name: "{{ ansible_user }}"
    groups: docker
    append: yes
  become: yes
```

---

## Role: kubernetes

This role installs Kubernetes components and initializes the cluster on the master node.

### Tasks

```yaml
# kubernetes-playbook/roles/kubernetes/tasks/main.yml
---
- name: Install Kubernetes packages
  apt:
    name:
      - kubelet
      - kubeadm
      - kubectl
    state: present
    update_cache: yes
  become: yes

- name: Hold Kubernetes packages
  apt:
    name:
      - kubelet
      - kubeadm
      - kubectl
    state: held
  become: yes

- name: Disable swap
  command: swapoff -a
  become: yes

- name: Ensure swap is disabled in fstab
  replace:
    path: /etc/fstab
    regexp: '^(.*\s+)?swap\s+.*$'
    replace: '#\0'
  become: yes

- name: Initialize Kubernetes Cluster (Master Only)
  when: inventory_hostname in groups['masters']
  shell: |
    kubeadm init --token {{ kubeadm_token }} --discovery-token-ca-cert-hash sha256:{{ kubeadm_hash }} --pod-network-cidr=10.244.0.0/16
  become: yes
  register: kubeadm_init

- name: Create .kube directory for user
  when: inventory_hostname in groups['masters']
  file:
    path: /home/{{ ansible_user }}/.kube
    state: directory
    mode: '0755'
    owner: "{{ ansible_user }}"
  become: yes

- name: Copy admin.conf to user's kube config
  when: inventory_hostname in groups['masters']
  copy:
    src: /etc/kubernetes/admin.conf
    dest: /home/{{ ansible_user }}/.kube/config
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"
    mode: '0644'
  become: yes

- name: Install kubectl completion for bash (optional)
  when: inventory_hostname in groups['masters']
  shell: echo 'source <(kubectl completion bash)' >> /home/{{ ansible_user }}/.bashrc
  become: yes

- name: Save kubeadm join command
  when: inventory_hostname in groups['masters']
  shell: kubeadm token create --print-join-command
  become: yes
  register: join_command

- name: Set fact with join command
  when: inventory_hostname in groups['masters']
  set_fact:
    kube_join_command: "{{ join_command.stdout }}"
```

---

## Role: flannel

This role deploys the Flannel CNI plugin for Kubernetes networking.

### Tasks

```yaml
# kubernetes-playbook/roles/flannel/tasks/main.yml
---
- name: Download Flannel manifest
  when: inventory_hostname in groups['masters']
  get_url:
    url: https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    dest: /tmp/kube-flannel.yml

- name: Apply Flannel manifest
  when: inventory_hostname in groups['masters']
  command: kubectl apply -f /tmp/kube-flannel.yml creates=/var/lib/kubelet/kubeconfig
  become: yes
  environment:
    KUBECONFIG: /home/{{ ansible_user }}/.kube/config
    HOME: /home/{{ ansible_user }}
```

---

## Role: networking

This role configures network settings required by Kubernetes.

### Tasks

```yaml
# kubernetes-playbook/roles/networking/tasks/main.yml
---
- name: Allow iptables to see bridged traffic
  sysctl:
    name: net.bridge.bridge-nf-call-iptables
    value: '1'
    state: present
    reload: yes
  become: yes
```

---

## Main Playbook

The `deploy_kubernetes.yml` playbook ties all the roles together and applies them to the appropriate hosts.

```yaml
# kubernetes-playbook/deploy_kubernetes.yml
---
- name: Deploy Kubernetes Cluster
  hosts: all
  become: yes
  vars_files:
    - vars/main.yml
  roles:
    - system
    - container-runtime
    - kubernetes
    - networking
    - flannel
```

---

## Requirements

Ensure that all necessary Ansible roles and dependencies are listed in the `requirements.yml` file. For this setup, since we are using custom roles, you might not need to list external roles unless you plan to incorporate them.

```yaml
# kubernetes-playbook/requirements.yml
---
# Example: List of external roles
# - src: geerlingguy.docker
#   version: 2.7.0
#   name: geerlingguy.docker
```

If you have external roles, you can install them using:

```bash
ansible-galaxy install -r requirements.yml
```

---

## Running the Playbook

Execute the playbook using the following command:

```bash
ansible-playbook -i inventory.yml deploy_kubernetes.yml -vvv
```

### Explanation of the Command:

- `ansible-playbook`: The Ansible command to run a playbook.
- `-i inventory.yml`: Specifies the inventory file.
- `deploy_kubernetes.yml`: The main playbook file.
- `-vvv`: Increases verbosity for detailed output, useful for debugging.

---

## Additional Notes

1. **Vagrant Setup**: Ensure your `Vagrantfile` is correctly configured to set up the master and slave nodes with the specified IP addresses and forwarded ports as per your codebase snippets.

2. **SSH Configuration**: Make sure SSH keys are properly set up and deployed to all nodes to allow Ansible to connect without password prompts.

3. **Join Command for Slaves**: The join command generated on the master node must be communicated to the slave nodes. This setup assumes that the role handles the join process. Ensure that the `kube_join_command` fact is utilized to join the slave nodes to the cluster.

4. **SELinux and Firewalls**: Depending on your environment, you might need to configure SELinux or firewall settings to allow Kubernetes components to communicate properly.

5. **Testing**: After deployment, verify the cluster status using:

   ```bash
   kubectl get nodes
   ```

   This command should list the master and all slave nodes in the `Ready` state.

---

By following this structure and utilizing the provided Ansible roles and playbook, you can automate the deployment of a Kubernetes cluster on your master and slave nodes efficiently.