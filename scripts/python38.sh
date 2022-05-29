#! /bin/bash

PYTHON_VERSION='3.8.2'

# Update && Install dependencies
echo 'Updating && Installing dependencies...'
sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

# Download python
echo 'Downloading python ${PYTHON_VERSION}...'
curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz

# Extract
echo 'Extracting...'
tar -xf Python-${PYTHON_VERSION}.tar.xz

# Configure
echo 'Starting python configuration...'
cd Python-${PYTHON_VERSION}
./configure --enable-optimizations

# Compile
#
# -j correspond to the number of cores in your processor
echo 'Starting python compilation...'
make -j 4

# Install python binaries
#
# Do not use the standard 'make install' as it will overwrite the default system 'python3'
echo 'Configuring python binaries...'
sudo make altinstall

# Finally, check the python version
python3.8 --version

# Delete the files
rm Python-${PYTHON_VERSION}.tar.xz
sudo rm -frd Python-${PYTHON_VERSION}

