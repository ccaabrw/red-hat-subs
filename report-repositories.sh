#!/bin/bash

# Repository Reporter
# This script reports on repositories available on the system

echo "=========================================="
echo "Repository Report"
echo "=========================================="
echo ""

# Detect which package manager is available
PKG_MGR=""
if command -v dnf &> /dev/null; then
    PKG_MGR="dnf"
elif command -v yum &> /dev/null; then
    PKG_MGR="yum"
else
    echo "ERROR: Neither dnf nor yum command found."
    echo "This script requires dnf or yum package manager to be installed."
    exit 1
fi

echo "Using package manager: $PKG_MGR"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "WARNING: This script may require root privileges for complete information."
    echo ""
fi

echo "Enabled Repositories:"
echo "----------------------------"
$PKG_MGR repolist enabled
echo ""

echo "Disabled Repositories:"
echo "----------------------------"
$PKG_MGR repolist disabled
echo ""

echo "All Repositories (Enabled and Disabled):"
echo "----------------------------"
$PKG_MGR repolist all
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
