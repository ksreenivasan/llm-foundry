python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-mask-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_non_ift_style.txt > simple_ift_prompts/results_no_mask_0_shot_non_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-mask-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_ift_style.txt > simple_ift_prompts/results_no_mask_0_shot_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-mask-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_3_shot_non_ift_style.txt > simple_ift_prompts/results_no_mask_3_shot_non_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-mask-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_3_shot_ift_style.txt > simple_ift_prompts/results_no_mask_3_shot_ift_style.txt


python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_non_ift_style.txt > simple_ift_prompts/results_regular_0_shot_non_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_ift_style.txt > simple_ift_prompts/results_regular_0_shot_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_3_shot_non_ift_style.txt > simple_ift_prompts/results_regular_3_shot_non_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_3_shot_ift_style.txt > simple_ift_prompts/results_regular_3_shot_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-packing-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_non_ift_style.txt > simple_ift_prompts/results_no_packing_regular_0_shot_non_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-packing-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_ift_style.txt > simple_ift_prompts/results_no_packing_regular_0_shot_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-packing-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_3_shot_non_ift_style.txt > simple_ift_prompts/results_no_packing_regular_3_shot_non_ift_style.txt

python inference/hf_generate.py \
    --name_or_path mpt-7b-instruct-no-packing-regular-hf \
    --max_new_tokens 100 \
    --temperature 0 \
    --prompts file::simple_ift_prompts/simple_ift_prompt_3_shot_ift_style.txt > simple_ift_prompts/results_no_packing_regular_3_shot_ift_style.txt
