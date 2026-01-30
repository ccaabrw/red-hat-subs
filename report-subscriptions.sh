#!/bin/bash

# Red Hat Subscription Reporter
# This script reports on Red Hat subscriptions associated with the system

echo "=========================================="
echo "Red Hat Subscription Report"
echo "=========================================="
echo ""

# Check if subscription-manager is available
if ! command -v subscription-manager &> /dev/null; then
    echo "ERROR: subscription-manager command not found."
    echo "This script requires Red Hat subscription-manager to be installed."
    echo "Please install it using: yum install subscription-manager"
    exit 1
fi

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "WARNING: This script should be run as root for full access to subscription information."
    echo ""
fi

echo "System Registration Status:"
echo "----------------------------"
subscription-manager status
echo ""

echo "Installed Products:"
echo "----------------------------"
subscription-manager list --installed
echo ""

echo "Available Subscriptions:"
echo "----------------------------"
subscription-manager list --available
echo ""

echo "Consumed Subscriptions:"
echo "----------------------------"
subscription-manager list --consumed
echo ""

echo "=========================================="
echo "Report completed at: $(date)"
echo "=========================================="
