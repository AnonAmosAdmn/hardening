#!/bin/bash
echo "[*] Hardening Linux..."

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Enable firewall and allow SSH port 2222
sudo ufw enable
sudo ufw allow 2222/tcp

# Disable unused services
sudo systemctl disable --now cups bluetooth

# Install security tools including fail2ban and sshguard
sudo apt install rkhunter lynis fail2ban sshguard auditd aide -y
sudo apt install libpam-tmpdir apt-listbugs apt-listchanges cryptsetup cryptmount -y

# Configure fail2ban for SSH on port 2222
sudo bash -c 'cat > /etc/fail2ban/jail.local << EOF
[sshd]
enabled = true
port = 2222
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
bantime = 3600
EOF'

# Restart fail2ban to apply config
sudo systemctl restart fail2ban

# Update and run rootkit check
sudo rkhunter --update && sudo rkhunter --check

# Enable and start fail2ban service
sudo systemctl enable --now fail2ban

# Enable and start sshguard service
sudo systemctl enable --now sshguard

# Enable and start auditd service
sudo systemctl enable --now auditd

# Enable and start freshclam service
sudo freshclam
sudo systemctl enable --now clamav-freshclam

# Enable and start aide service
sudo aideinit

# Enable automatic updates
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

# Run Lynis security audit
sudo lynis audit system

echo "[*] Linux hardening complete."
