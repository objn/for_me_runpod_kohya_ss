#!/bin/bash

# Prepare work space
sudo mkdir "basemodel"
chmod +rwx basemodel
sudo mkdir "dataset"
chmod +rwx dataset

# Update the package repository
sudo apt update

# Add deadsnakes PPA for installing Python 3.10
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

# Install utility
sudo apt install p7zip-full

# Install required packages
sudo apt install -y python3.10 python3.10-tk python3.10-distutils python3.10-dev firefox git chromium-browser

# Set Python 3.10 as the default Python interpreter
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Update pip
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Add the pip script location to PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"

# Clone the repository
git clone https://github.com/bmaltais/kohya_ss.git

# Install kohya_ss
cd kohya_ss
chmod +x setup-runpod.sh
sudo ./setup-runpod.sh &
wait
echo "The setup-runpod.sh script has finished. Continue with the next steps."

# Start kohya_ss gui
cd kohya_ss
sudo ./gui.sh
# Exit the script
exit 0
