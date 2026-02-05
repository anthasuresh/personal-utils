#!/bin/bash

# Define variables
SWAP_PATH="/mnt/16GB.swap"
SWAP_SIZE="16G"

echo "--- Starting Jetson Orin Nano Optimization ---"

# 1. Remove any old swap files to prevent conflicts
echo "[1/6] Disabling existing swap files..."
sudo swapoff -a

# 2. Create the 16GB Swap file on NVMe
echo "[2/6] Creating $SWAP_SIZE swap file at $SWAP_PATH..."
sudo fallocate -l $SWAP_SIZE $SWAP_PATH
sudo chmod 600 $SWAP_PATH
sudo mkswap $SWAP_PATH
sudo swapon $SWAP_PATH

# 3. Make Swap permanent in /etc/fstab
echo "[3/6] Configuring permanent mount..."
# Remove old swap entries first to prevent duplicates
sudo sed -i '/.swap/d' /etc/fstab
echo "$SWAP_PATH none swap sw 0 0" | sudo tee -a /etc/fstab

# 4. Set Swappiness to 10 (Prioritize physical RAM)
echo "[4/6] Optimizing swappiness..."
sudo sysctl vm.swappiness=10
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

# 5. Disable ZRAM (Better performance when using fast NVMe SSD)
echo "[5/6] Disabling ZRAM to free up CPU cycles..."
sudo systemctl disable nvzramconfig

# 6. Set Jetson to Maximum Performance Mode (MAXN)
echo "[6/6] Setting Jetson to MAXN Power Mode..."
sudo nvpmodel -m 0
sudo jetson_clocks

echo "--- Optimization Complete! ---"
echo "Note: A reboot is required to fully apply ZRAM changes."
echo "You can check your new memory status by running: jtop"
