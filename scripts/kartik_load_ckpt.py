# Copyright 2022 MosaicML LLM Foundry authors
# SPDX-License-Identifier: Apache-2.0

import ast
import importlib
import json
import os
import tempfile
from argparse import ArgumentParser, Namespace
from pathlib import Path
from typing import Any, Dict, List, Optional, Union

import sentencepiece as spm
import torch
import transformers
from composer.utils import (get_file, maybe_create_object_store_from_uri,
                            parse_uri, safe_torch_load)


checkpoint_path = "oci://mosaicml-internal-checkpoints/kartik/ift-masking-ablation/kartik-mpt-7b-dolly-ift-no-mask-80g/checkpoints/ep2-ba196-rank0.pt"
local_save_location = "/mnt/workdisk/kartik/llm-foundry/scripts/composer_checkpoints/kartik-mpt-7b-dolly-ift-no-mask-80g-composer-checkpoint.pt"
get_file(checkpoint_path, local_save_location, overwrite=True)


# try writing something stupid to oci and then reading it back

dummy_checkpoint_path = "oci://mosaicml-internal-checkpoints/kartik/ift-masking-ablation/dummy_dir/checkpoints/dummy_ckpt.pt"

object_store = maybe_create_object_store_from_uri(dummy_checkpoint_path)
local_file_path = "/mnt/workdisk/kartik/llm-foundry/scripts/composer_checkpoints/dummy_ckpt.pt"

with open(local_file_path, 'w', encoding='utf-8') as f:
    for i in range(1000):
        f.write("hello, world\n")
    f.write("bye, world.")

if object_store is not None:
    # remove bucket name and upper part of oci path
    _, _, prefix = parse_uri(dummy_checkpoint_path)
    print(prefix)
    object_store.upload_object(prefix, local_file_path)

get_file(dummy_checkpoint_path, local_save_location, overwrite=True)