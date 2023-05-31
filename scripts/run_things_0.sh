CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b \
  --max_new_tokens 10 \
  --temperature 0 \
  --prompts file::3_digit_prompts_without_spaces.txt > mpt-7b-results-0-temp-with-spaces.txt


CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path huggyllama/llama-7b \
  --max_new_tokens 10 \
  --temperature 0 \
  --prompts file::3_digit_prompts_with_spaces.txt > llama-7b-results-0-temp-with-spaces.txt
  
CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path huggyllama/llama-7b \
  --max_new_tokens 10 \
  --temperature 0 \
  --prompts file::3_digit_prompts_without_spaces.txt > llama-7b-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 128 \
  --attn_impl triton \
  --prompts file::3_digit_fewshot_prompts_without_spaces.txt > mpt-7b-fewshot-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path huggyllama/llama-7b \
  --max_new_tokens 10 \
  --model_dtype bf16 \
  --max_batch_size 128 \
  --prompts file::3_digit_fewshot_prompts_without_spaces.txt > llama-7b-fewshot-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 128 \
  --attn_impl triton \
  --prompts file::3_digit_10_fewshot_prompts_without_spaces.txt > mpt-7b-10-fewshot-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=0 python inference/hf_generate.py \
  --name_or_path huggyllama/llama-7b \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 64 \
  --prompts file::3_digit_10_fewshot_prompts_without_spaces.txt > llama-7b-10-fewshot-results-0-temp-without-spaces.txt