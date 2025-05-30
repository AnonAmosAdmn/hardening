# 🔒 Linux Hardening Script
A comprehensive Bash script designed to harden Debian-based Linux systems by automating essential security configurations, installing key security tools, enabling intrusion prevention, and performing system audits.

# 📦 Features
This script performs the following tasks:

# 🔧 System Setup
Updates and upgrades system packages.

Enables the UFW firewall and allows SSH on port 2222.

Disables unnecessary services: cups, bluetooth.

# 🛡️ Security Tools Installation
Installs and configures the following security utilities:

Fail2ban – Brute-force protection.

SSHGuard – Blocks malicious SSH login attempts.

RKHunter – Rootkit scanner.

Lynis – System security audit tool.

Auditd – Linux auditing daemon.

AIDE – File integrity checker.

ClamAV – Antivirus engine.

Unattended Upgrades – Enables automatic security updates.

# ⚙️ Configurations
Configures fail2ban for SSH protection on port 2222.

Initializes aide to begin file integrity baseline checks.

Runs freshclam and enables automatic virus database updates.

# 🔍 Auditing
Executes rkhunter for rootkit scanning.

Executes lynis for a full system audit.

Enables and starts services for:

fail2ban

sshguard

auditd

clamav-freshclam

# 🚀 Usage
Prerequisites
A Debian-based Linux distribution (e.g., Ubuntu, Debian, Kali).

Sudo privileges.


# Run Script
chmod +x hardener.sh && ./hardener.sh
