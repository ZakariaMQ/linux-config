#!/bin/bash

# script to add ssl to nginx server

# add SSL
sudo apt install -y certbot python3-certbot-nginx
sudo apt install -y ufw
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo certbot --nginx -d your_domain.com -d www.your_domain.com
sudo systemctl status certbot.timer
sudo certbot renew --dry-run
sudo systemctl restart nginx
# end

