function create_bash_alias(){
  echo -e "alias l='ls -trla'" >> ~/.bash_aliases
  echo -e "alias c=clear" >> ~/.bash_aliases
  echo -e "cd ~/vtrash/" >> ~/.bash_aliases
  echo -e "source ~/venvs/ai/bin/activate" >> ~/.bash_aliases
}

function do_pip_installs(){
  sudo apt install python3-pip -y
  sudo apt install python3.10-venv -y
  sudo pip3 install jetson-stats
}

function create_directories(){
  mkdir ~/venvs ~/vtrash
  touch ~/.hushlogin
}

function setup_venv(){
  python3 -m venv ai
  [ -f ~/venvs/ai/bin/activate ] && source ~/venvs/ai/bin/activate || { echo "Error: venv missing" ; exit 1 ; }
  pip install --upgrade setuptools wheel pip
  pip install strands-agents strands-agents-tools
}

function install_ollama() {
   curl -fsSL https://ollama.com/install.sh | sh
    
   echo "Waiting for Ollama service to start..."
   until curl -s http://localhost:11434/api/tags > /dev/null; do
     sleep 1
   done
    
   ollama pull qwen3:4b-instruct
}


do_pip_installs
create_directories
create_bash_alias
install_ollama
setup_venv
