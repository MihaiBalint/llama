#!/bin/bash
sudo docker run --rm --gpus all -i -t \
   -v `pwd`/LLaMa-distrib:/llama \
   --env 'TZ="Asia/Jakarta"' --env 'NVIDIA_VISIBLE_DEVICES=all' --env 'COMMANDLINE_ARGS="--listen"' \
   --name llama-7b --ipc host llama-7b:latest \
   bash -c "nvidia-smi; NVIDIA_VISIBLE_DEVICES=all torchrun --nproc_per_node 1 example.py --ckpt_dir /llama/7B --tokenizer_path /llama/tokenizer.model"
