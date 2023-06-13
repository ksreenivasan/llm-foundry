# creating a simple script to just download a hf ckpt manually
# doing this because if the hf ckpt is in OCI, it won't read cleanly


import itertools
import os
import random
import time
import warnings
from argparse import ArgumentParser, ArgumentTypeError, Namespace
from composer.utils import get_file


def parse_args() -> Namespace:
    """Parse commandline arguments."""
    parser = ArgumentParser(
        description=
        'Simple hacky script to download HF ckpt to a directory.'
    )
    parser.add_argument('--source-dir', type=str, required=True)
    parser.add_argument('--hf_output_path', type=str, required=True)

    return parser.parse_args()


def main(args: Namespace) -> None:
    hf_filenames = ["adapt_tokenizer.py", "attention.py", "blocks.py",
                    "config.json", "configuration_mpt.py", "custom_embedding.py",
                    "flash_attn_triton.py", "generation_config.json",
                    "hf_prefixlm_converter.py", "meta_init_context.py",
                    "modeling_mpt.py", "norm.py", "param_init_fns.py",
                    "pytorch_model.bin", "pytorch_model-00001-of-00002.bin",
                    "pytorch_model-00002-of-00002.bin", "pytorch_model.bin",
                    "pytorch_model.bin.index.json", "special_tokens_map.json", "tokenizer.json",
                    "tokenizer_config.json"]
    print(f"Going to start copying {args.source_dir} to {args.hf_output_path}")
    for hf_filename in hf_filenames:
        filename = os.path.join(args.source_dir, hf_filename)
        try:
            output_filename = os.path.join(args.hf_output_path, hf_filename)
            get_file(filename, output_filename)
        except Exception as e:
            print(f"Failed to get file {filename} with exception {e}")
            print("Probably because it doesn't exist in the source directory.")
            print("Continuing...")
    print("Done!")

if __name__ == '__main__':
    main(parse_args())