#!/bin/bash
cd /workspace
sudo apt-get install unzip
mkdir -p .mujoco
cd .mujoco
wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz
tar -xvf mujoco210-linux-x86_64.tar.gz
"${SHELL}" <(curl -L micro.mamba.pm/install.sh)
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/.mujoco/mujoco210/bin' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia' >> ~/.bashrc
sudo apt-get update
sudo apt-get install libglew-dev
sudo apt install patchelf
sudo apt-get install libegl1-mesa
sudo apt-get install libgl1-mesa-glx
sudo apt install libopengl0
source ~/.bashrc
export PATH="$PATH:$HOME/bin"
micromamba config set channel_priority flexible
cd /workspace/cs224r-hw/hw2/ac
micromamba env create --file=conda_env.yml
micromamba activate AC
pip install metaworld@git+https://github.com/Farama-Foundation/Metaworld.git@a98086ababc81560772e27e7f63fe5d120c4cc50
pip install "cython<3"