#!/bin/bash

python create_addition_prompts.py --num-digits 3 --num-samples 1000 --out-filename 3_digit_prompts_without_spaces.txt --num-few-shot 0
python create_addition_prompts.py --num-digits 3 --num-samples 1000 --out-filename 3_digit_5_fewshot_prompts_without_spaces.txt --num-few-shot 5
python create_addition_prompts.py --num-digits 3 --num-samples 1000 --out-filename 3_digit_10_fewshot_prompts_without_spaces.txt --num-few-shot 10

python create_addition_prompts.py --num-digits 3 --num-samples 1000 --out-filename 3_digit_ift_style_prompts_without_spaces.txt --num-few-shot 0 --ift-style
python create_addition_prompts.py --num-digits 3 --num-samples 1000 --out-filename 3_digit_5_fewshot_ift_style_prompts_without_spaces.txt --num-few-shot 5 --ift-style
python create_addition_prompts.py --num-digits 3 --num-samples 1000 --out-filename 3_digit_10_fewshot_ift_style_prompts_without_spaces.txt --num-few-shot 10 --ift-style