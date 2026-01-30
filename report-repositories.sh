#!/bin/bash

# Yum Repository Reporter
# This script reports on yum repositories available on the system

echo "=========================================="
echo "Yum Repository Report"
echo "=========================================="
echo ""

# Check if yum is available
if ! command -v yum &> /dev/null; then
    echo "ERROR: yum command not found."
    echo "This script requires yum package manager to be installed."
    exit 1
fi

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "WARNING: This script may require root privileges for complete information."
    echo ""
fi

echo "Enabled Repositories:"
echo "----------------------------"
yum repolist enabled
echo ""

echo "Disabled Repositories:"
echo "----------------------------"
yum repolist disabled
echo ""

echo "All Repositories (Enabled and Disabled):"
echo "----------------------------"
yum repolist all
echo ""

echo "Repository Details:"
echo "----------------------------"
echo "Listing repository configuration files in /etc/yum.repos.d/:"
if [ -d "/etc/yum.repos.d/" ]; then
    ls -lh /etc/yum.repos.d/*.repo 2>/dev/null || echo "No repository files found."
else
    echo "Directory /etc/yum.repos.d/ not found."
fi
echo ""

echo "=========================================="
echo "Report completed at: $(date)"
echo "=========================================="
