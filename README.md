# Red Hat System Reporting Scripts

Collection of scripts to report on Red Hat system subscriptions and repositories.

## Scripts

### 1. report-subscriptions.sh

Reports on Red Hat subscriptions associated with the system's product registration.

**What it does:**
- Shows system registration status
- Lists installed Red Hat products
- Shows available subscriptions
- Displays consumed subscriptions

**Requirements:**
- Red Hat Enterprise Linux system
- `subscription-manager` installed (usually pre-installed on RHEL)
- Root privileges recommended for complete information

**Usage:**
```bash
sudo ./report-subscriptions.sh
```

### 2. report-repositories.sh

Reports on software repositories available on the system and their status.

**What it does:**
- Lists all enabled repositories
- Lists all disabled repositories
- Shows complete repository list with details
- Lists repository configuration files
- Automatically detects and uses dnf (RHEL 8+) or yum (RHEL 7 and earlier)

**Requirements:**
- Red Hat based system (RHEL, CentOS, Fedora, etc.)
- `dnf` or `yum` package manager installed
- Root privileges recommended for complete information

**Usage:**
```bash
sudo ./report-repositories.sh
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/ccaabrw/red-hat-subs.git
cd red-hat-subs
```

2. Make scripts executable (if not already):
```bash
chmod +x report-subscriptions.sh report-repositories.sh
```

3. Run the scripts:
```bash
sudo ./report-subscriptions.sh
sudo ./report-repositories.sh
```

## Notes

- Both scripts provide detailed information about different aspects of your Red Hat system
- Running without root privileges may result in incomplete information
- The scripts include error checking for missing dependencies
- Output includes timestamps for audit purposes