#!/usr/bin/env bash

# SHOULD BE IN /cli when execute
if [ $# != 1 ]; then
    echo "Error param : Cli name is missing"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Error param : \$1 is not defined"
    exit 1
fi

name="$1"
projet_name="sae"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo -e ""
echo -e ""

pwd=$(pwd)
cd cli || exit 1

cli_name="$name"
extension=""

cli_name="${name}${extension}"
echo "Install CLI : project: [$projet_name] cli-name: [$cli_name] for [$machine]"

if [ "${machine}" == "Mac" ]
then
    # JQ
    if which jq >/dev/null; then
        echo "[OK] jq"
    else
        echo "brew install jq"
        brew install jq
    fi
    target=".bash_profile"
fi

if [ "${machine}" == "Linux" ]
then
    # JQ
    if which jq >/dev/null; then
        echo "[OK] jq"
    else
        echo "jq is not installed!"
        sudo apt-get install jq
    fi
    target=".bashrc"
fi

# Detect if zsh is installed
if command -v zsh >/dev/null 2>&1; then
    zsh_installed=true
    zsh_target="${HOME}/.zshrc"
else
    zsh_installed=false
fi

## INIT
echo "$cli_name" > app/.name
echo "sae" > app/.project
echo "$name" > app/.config

sudo ./cli zoptions install "$cli_name"
sudo ./cli zoptions dependencies "$cli_name"

cd ..

$cli_name zoptions rc init "$projet_name" "$name"

cd ~ || exit 1

cmd1="source ${pwd}/cli/complete"
cmd2="complete -F _bash_cli $name-api"

# Function to add commands to shell configuration files
add_to_shell_config() {
    local config_file="$1"
    local cmd="$2"
    if grep -Fxq "$cmd" "$config_file"; then
        echo "[$cmd] already installed in $config_file"
    else
        echo "$cmd" >> "$config_file"
        echo "Added [$cmd] to $config_file"
    fi
}

# Add commands to bash configuration
add_to_shell_config "$target" "$cmd1"
add_to_shell_config "$target" "$cmd2"

# Add commands to zsh configuration if zsh is installed
if [ "$zsh_installed" = true ]; then
    add_to_shell_config "$zsh_target" "$cmd1"
    add_to_shell_config "$zsh_target" "autoload -U compinit && compinit"
    add_to_shell_config "$zsh_target" "autoload -U bashcompinit && bashcompinit"
    add_to_shell_config "$zsh_target" "$cmd2"
fi

# Source the appropriate configuration file
if [ -n "$BASH_VERSION" ]; then
    # shellcheck source=/dev/null
    source "$target"
elif [ -n "$ZSH_VERSION" ]; then
    # shellcheck source=/dev/null
    source "$zsh_target"
fi
