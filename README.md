# Minecraft server on kubernetes

## CLI

## Overview

The **CLI** is a powerful command-line interface designed to streamline various local machine operations and facilitate the deployment of Kubernetes clusters using Ansible. This README provides instructions on how to install, use the CLI, and deploy Kubernetes with Ansible step by step.

## Table of Contents

- [Minecraft server on kubernetes](#minecraft-server-on-kubernetes)
  - [CLI](#cli)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Steps to Install the CLI](#steps-to-install-the-cli)
  - [Usage](#usage)
    - [Available Commands](#available-commands)
  - [Deploying Kubernetes with Ansible](#deploying-kubernetes-with-ansible)
    - [Prerequisites](#prerequisites-1)
    - [Step-by-Step Deployment](#step-by-step-deployment)
  - [Contributing](#contributing)
  - [License](#license)

## Installation

### Prerequisites

- **Bash**: The CLI is built using Bash scripting.
- **Python 3**: Required for creating virtual environments and running Ansible.
- **Ansible**: Automation tool for deploying Kubernetes.
- **Git**: For cloning the repository.
- **Homebrew** (macOS) or **apt-get** (Linux): For installing necessary packages.

### Steps to Install the CLI

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-repo/sae-cli.git
   cd sae-cli
   ```

2. **Install the CLI**

   Run the `install_cli.sh` script to install the CLI.

   ```bash
   ./install_cli.sh sae
   ```

   Replace `sae` with your desired CLI name. This script will:

   - Detect your operating system.
   - Install necessary dependencies like `jq`.
   - Create symlinks for easy access to the CLI commands.
   - Update your shell configuration files for command completion.

3. **Verify Installation**

   Close and reopen your terminal, then verify the installation by checking the CLI version or help.

   ```bash
   sae
   ```

## Usage

### Available Commands

The SAE CLI provides a variety of commands categorized under different operations. Below is an overview of the available commands:

- **Local Machine Operations**
  - `install ansible`: Installs Ansible locally.
  - `ssh create`: Creates an SSH key pair.
  - `ssh deploy`: Deploys SSH keys to remote hosts.
  
- **Kubernetes Deployment**
  - `ansible kube install`: Installs Kubernetes on specified hosts.
  
- **DNS Operations**
  - `dns host`: Modifies the hosts file to set up DNS entries.

## Deploying Kubernetes with Ansible

Deploying a Kubernetes cluster using Ansible through the SAE CLI involves several steps. Follow the guide below to perform the deployment seamlessly.

### Prerequisites

- **Remote Hosts**: Ensure you have access to the master and worker nodes where Kubernetes will be installed.
- **SSH Access**: Set up SSH access to all remote hosts.
- **Ansible Inventory**: Configure your `inventory.yml` with the correct hostnames and SSH credentials.

### Step-by-Step Deployment

1. **Set Up SSH Keys**

   Create an SSH key pair and deploy it to all your remote hosts.

   ```bash
   sae local ssh create
   sae local ssh deploy -u your_ssh_user -i master_ip
   sae local ssh deploy -u your_ssh_user -i worker1_ip
   sae local ssh deploy -u your_ssh_user -i worker2_ip
   sae local ssh deploy -u your_ssh_user -i worker3_ip
   ```

   Replace `your_ssh_user` with your SSH username and `master_ip`, `worker1_ip`, etc., with the respective IP addresses of your hosts.

2. **Install Kubernetes on Hosts**

   Use the CLI to run the Ansible playbook that installs Kubernetes.

   ```bash
   sae ansible kube install
   ```

   This command performs the following actions:

   - Loads utility methods.
   - Navigates to the directory specified in the runtime configuration.
   - Activates the virtual environment.
   - Executes the Ansible playbook `deploy_kubernetes.yml` using the inventory defined in `inventory.yml`.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss improvements or report bugs.

## License

This project is licensed under the [MIT License](LICENSE).
