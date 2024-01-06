#!/bin/bash
set -e

LOG_FILE="nginx_setup.log"

# Logging
log() {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Custom exit function
custom_exit() {
    local exit_code=$?
    log "Script exited with status code $exit_code"
    exit $exit_code
}

trap custom_exit EXIT
# config nginx part ---------------------------
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo rm /etc/nginx/sites-enabled/default
sudo cp your_config_file /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/your_config_file /etc/nginx/sites-enabled/
sudo systemctl restart nginx
# end -----------------------------------------
