CUDA_VISIBLE_DEVICES=1 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b-instruct \
  --max_new_tokens 10 \
  --temperature 0 \
  --prompts file::3_digit_prompts_without_spaces.txt > mpt-7b-instruct-results-0-temp-without-spaces.txt


CUDA_VISIBLE_DEVICES=1 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b-instruct \
  --max_new_tokens 10 \
  --temperature 0 \
  --prompts file::3_digit_prompts_without_spaces.txt > mpt-7b-instruct-results-0-temp-with-spaces.txt


CUDA_VISIBLE_DEVICES=1 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b-instruct \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 256 \
  --attn_impl triton \
  --prompts file::3_digit_fewshot_prompts_without_spaces.txt > mpt-7b-instruct-fewshot-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=1 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b-instruct \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 128 \
  --attn_impl triton \
  --prompts file::3_digit_10_fewshot_prompts_without_spaces.txt > mpt-7b-instruct-10-fewshot-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=1 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b-instruct \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 256 \
  --attn_impl triton \
  --prompts file::addition_prompt_files/3_digit_5_fewshot_ift_style_prompts_without_spaces.txt > addition_prompt_files/mpt-7b-instruct-5-fewshot-ift-style-results-0-temp-without-spaces.txt

CUDA_VISIBLE_DEVICES=1 python inference/hf_generate.py \
  --name_or_path mosaicml/mpt-7b-instruct \
  --max_new_tokens 10 \
  --temperature 0 \
  --model_dtype bf16 \
  --max_batch_size 256 \
  --attn_impl triton \
  --prompts file::addition_prompt_files/3_digit_ift_style_prompts_without_spaces.txt > addition_prompt_files/mpt-7b-instruct-ift-style-results-0-temp-without-spaces.txt