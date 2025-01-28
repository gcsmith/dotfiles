
export CONDA_HOME=~/anaconda3

alias run-tensorflow-server='docker run -u $(id -u):$(id -g) -p 8888:8888 -p 6006:6006 --runtime=nvidia -it tensorflow/tensorflow:latest-gpu-py3-jupyter'
alias run-pytorch='nvidia-docker run --ipc=host -it --rm -v /home/garrett:/home/garrett nvcr.io/nvidia/pytorch:19.06-py3'
alias run-conda='eval "$($CONDA_HOME/bin/conda shell.zsh hook)"'

