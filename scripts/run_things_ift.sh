for model in 'mpt-7b-instruct-no-mask-hf' 'mpt-7b-instruct-regular-hf' 'mpt-7b-instruct-no-packing-regular-hf'
do
  model_name=${model:0:-3}
  echo "Running arithmetic eval for $model_name"
  echo "Without spaces"
  python inference/hf_generate.py \
    --name_or_path $model \
    --max_new_tokens 10 \
    --temperature 0 \
    --model_dtype bf16 \
    --max_batch_size 64 \
    --prompts file::addition_prompt_files/3_digit_prompts_without_spaces.txt > addition_prompt_files/ift_analysis/$model_name-results-0-temp-without-spaces.txt
  sleep 2
  echo "Without spaces 5-shot"
  python inference/hf_generate.py \
    --name_or_path $model \
    --max_new_tokens 10 \
    --temperature 0 \
    --model_dtype bf16 \
    --max_batch_size 64 \
    --prompts file::addition_prompt_files/3_digit_fewshot_prompts_without_spaces.txt > addition_prompt_files/ift_analysis/$model_name-5-fewshot-results-0-temp-without-spaces.txt
  sleep 2
  echo "Without spaces ift-style"
  python inference/hf_generate.py \
    --name_or_path $model \
    --max_new_tokens 10 \
    --temperature 0 \
    --model_dtype bf16 \
    --max_batch_size 64 \
    --ift_style \
    --prompts file::addition_prompt_files/3_digit_ift_style_prompts_without_spaces.txt > addition_prompt_files/ift_analysis/$model_name-ift-style-results-0-temp-without-spaces.txt
  sleep 2
  echo "Without spaces ift-style 5-shot"
  python inference/hf_generate.py \
    --name_or_path $model \
    --max_new_tokens 10 \
    --temperature 0 \
    --model_dtype bf16 \
    --max_batch_size 64 \
    --ift_style \
    --prompts file::addition_prompt_files/3_digit_5_fewshot_ift_style_prompts_without_spaces.txt > addition_prompt_files/ift_analysis/$model_name-5-fewshot-ift-style-results-0-temp-without-spaces.txt
  sleep 2
  echo "Without spaces ift-style 10-shot"
  python inference/hf_generate.py \
    --name_or_path $model \
    --max_new_tokens 10 \
    --temperature 0 \
    --model_dtype bf16 \
    --max_batch_size 16 \
    --ift_style \
    --prompts file::addition_prompt_files/3_digit_10_fewshot_ift_style_prompts_without_spaces.txt > addition_prompt_files/ift_analysis/$model_name-10-fewshot-ift-style-results-0-temp-without-spaces.txt
done
