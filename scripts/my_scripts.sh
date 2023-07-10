#!/bin/bash
# bunch of scripts

composer train/train.py train/yamls/finetune/kartik_finetune_firstmodel.yaml

# need to convert things to HF first

python inference/convert_composer_to_hf.py \
  --composer_path oci://mosaicml-internal-checkpoints/kartik/onboarding/kartik-first-model-v2/checkpoints/ep0-ba10-rank0.pt \
  --hf_output_path mpt-1b-hf \
  --output_precision bf16

RUN_NAME=mosaic-gpt-1b-gpus-8-rsxJKU
python inference/hf_generate.py \
  --name_or_path oci://mosaicml-internal-checkpoints/kartik/onboarding/${RUN_NAME}/checkpoints\
  --max_new_tokens 256 \
  --prompts \
    "The answer to life, the universe, and happiness is" \
    "Here's a quick recipe for baking chocolate chip cookies: Start by"

python inference/hf_generate.py \
  --name_or_path oci://mosaicml-internal-checkpoints/kartik/onboarding/mosaic-gpt-1b-gpus-8-rsxJKU/checkpoints\
  --max_new_tokens 256 \
  --prompts \
    "The answer to life, the universe, and happiness is" \
    "Here's a quick recipe for baking chocolate chip cookies: Start by"


mcli run -f kartik-first-model.yaml --cluster r7z2 --priority low --follow


python inference/hf_generate.py \
  --name_or_path oci://mosaicml-internal-checkpoints/kartik/onboarding/${RUN_NAME}/checkpoints\
  --max_new_tokens 256 \
  --prompts \
    "The answer to life, the universe, and happiness is" \
    "Here's a quick recipe for baking chocolate chip cookies: Start by"