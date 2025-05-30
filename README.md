# Linux Hardening Script
This script performs basic but essential hardening steps on Debian-based Linux systems.
It automates system updates, firewall configuration, service disabling, and installs key security tools with configurations.


# Features
Updates and upgrades all system packages.

Enables UFW firewall and opens SSH on port 2222.

Disables unused services: cups and bluetooth.

Installs and configures:

rkhunter (rootkit detection)

lynis (system security auditing)

fail2ban (intrusion prevention for SSH)

sshguard (another intrusion prevention tool)

Configures fail2ban to protect SSH on port 2222 with a ban after 5 failed login attempts lasting 1 hour.

Runs rootkit checks and security audits automatically.

Starts and enables fail2ban and sshguard services.


# Run Script
chmod +x hardener.sh && ./hardener.sh
