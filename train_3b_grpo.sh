#!/bin/bash


export N_GPUS=2
export CUDA_VISIBLE_DEVICES=2,3
ray stop --force && ray start --head --include-dashboard=True
export BASE_MODEL="model/Qwen2.5-3B"
export DATA_DIR="data/countdown"
export ROLLOUT_TP_SIZE=2
export EXPERIMENT_NAME=countdown-qwen2.5-3b-grpo
export VLLM_ATTENTION_BACKEND=XFORMERS

bash ./scripts/train_tiny_zero_a100_grpo.sh
