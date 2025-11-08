#!/bin/bash
# MySQL Package Fix Script

set -e

echo "========================================="
echo "Fixing MySQL Package Installation"
echo "========================================="
echo ""

echo "[1/5] Stopping existing MySQL service and killing all mysqld processes..."
sudo systemctl stop mysql || true
sudo killall -9 mysqld 2>/dev/null || true
sudo pkill -9 mysqld 2>/dev/null || true
sleep 3

# Verify port 3306 is free
if sudo lsof -i :3306 2>/dev/null; then
    echo "WARNING: Port 3306 is still in use. Killing processes..."
    sudo lsof -ti :3306 | xargs -r sudo kill -9
    sleep 2
fi

echo "Port 3306 status:"
sudo lsof -i :3306 2>/dev/null || echo "Port 3306 is now free"

echo ""
echo "[2/5] Removing partial package configuration..."
sudo dpkg --configure -a

echo ""
echo "[3/5] Attempting to fix broken packages..."
sudo apt --fix-broken install -y

echo ""
echo "[4/5] Verifying MySQL configuration..."
sudo systemctl enable mysql

echo ""
echo "[5/5] Starting MySQL service..."
sudo systemctl start mysql
sudo systemctl status mysql --no-pager -l

echo ""
echo "========================================="
echo "MySQL Fix Complete!"
echo "========================================="
