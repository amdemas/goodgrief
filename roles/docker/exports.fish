set -g DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -g MACHINE_STORAGE_PATH "$XDG_DATA_HOME/docker-machine"
set -g DOCKER_HOST unix:///run/user/1000/docker.sock
