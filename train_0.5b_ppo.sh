#!/bin/bash


export N_GPUS=1
export CUDA_VISIBLE_DEVICES=2
ray stop --force && ray start --head --include-dashboard=True
export BASE_MODEL="model/Qwen2.5-0.5B"
export DATA_DIR="data/countdown"
export ROLLOUT_TP_SIZE=1
export EXPERIMENT_NAME=countdown-qwen2.5-0.5b
export VLLM_ATTENTION_BACKEND=XFORMERS

bash ./scripts/train_tiny_zero_a100_ppo.sh
