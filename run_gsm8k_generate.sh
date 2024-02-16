#!/bin/zsh

echo "Running GSM8K generation for mpt-7b-chat-gsm8k-ft"
composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/mpt-7b-chat-gsm8k-ft-hf \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 0 \
    --max_batch_size 4 # 16

composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/mpt-7b-chat-gsm8k-ft-hf \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16

sleep 2

echo "Running GSM8K generation for mpt-7b-base-gsm8k-ft"
composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/mpt-7b-base-gsm8k-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 0 \
    --max_batch_size 4 # 16

composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/mpt-7b-base-gsm8k-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16

sleep 2

echo "Running GSM8K generation for mpt-7b-base-metamathqa-ft"
composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/mpt-7b-base-metamathqa-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 0 \
    --max_batch_size 4 # 16

composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/mpt-7b-base-metamathqa-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16

# debug eos issue
composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/debug-mpt-7b-base-gsm8k-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16

composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/debug-mpt-7b-base-metamathqa-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16

composer scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/debug-mpt-7b-base-metamathqa-bs48-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16


python scripts/inference/hf_generate_gsm8k.py \
    --max_new_tokens 500 \
    --name_or_path /mnt/workdisk/kartik/saved_ckpts/debug-mpt-7b-base-metamathqa-fixed-packing-ratio-ft \
    --temperature 0.7 \
    --model_dtype bf16 \
    --num-few-shot 8 \
    --max_batch_size 4 # 16