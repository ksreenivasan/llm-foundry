import random
import argparse


# copied the IFT stuff straight from https://huggingface.co/spaces/mosaicml/mpt-7b-instruct/blob/main/quick_pipeline.py

INSTRUCTION_KEY = "### Instruction:"
RESPONSE_KEY = "### Response:"
END_KEY = "### End"
INTRO_BLURB = "Below is an instruction that describes a task. Write a response that appropriately completes the request."
PROMPT_FOR_GENERATION_FORMAT = """{intro}
{instruction_key}
{instruction}
{response_key}
""".format(
    intro=INTRO_BLURB,
    instruction_key=INSTRUCTION_KEY,
    instruction="{instruction}",
    response_key=RESPONSE_KEY,
)

def format_instruction(instruction):
    return PROMPT_FOR_GENERATION_FORMAT.format(instruction=instruction)


def get_addition_sample(num_digits=3, with_spaces=False):
    max_int = 10 ** num_digits
    a = random.randint(0, max_int)
    b = random.randint(0, max_int)
    c = a + b
    # might want to work on aliases here to see if 1-digit off is still good.
    if with_spaces:
        sample_str = f"{a} + {b} ="
    else:
        sample_str = f"{a}+{b}="
    
    return sample_str, str(c)

def make_arithmetic_dataset(out_file, num_digits=3, num_samples=1000, with_spaces=False, num_few_shot=0, ift_style=False):
    if num_few_shot > 0:
        if ift_style:
            few_shot_prompt = ""
            for idx in range(num_few_shot):
                row, c = get_addition_sample(num_digits, with_spaces)
                row = format_instruction(row)
                row += c + f"\n{END_KEY}"
                few_shot_prompt += row + "\n"
        else:
            few_shot_prompt = "Here are some examples of addition problems separated by a semicolon: "
            for idx in range(num_few_shot):
                row, c = get_addition_sample(num_digits, with_spaces)
                row += c
                few_shot_prompt += row + "; "

    with open(out_file, "w", encoding='utf8') as f:
        for idx in range(num_samples):
            row, c = get_addition_sample(num_digits, with_spaces)
            if num_few_shot > 0:
                if ift_style:
                    final_row = few_shot_prompt + format_instruction(row)
                else:
                    final_row = few_shot_prompt + row + "\n"
            else:
                if ift_style:
                    final_row = format_instruction(row)
                else:
                    final_row = row + "\n"
            f.write(final_row)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Script to generate addition prompts for generate'
    )
    parser.add_argument('--num-digits',
                        type=int,
                        default=3,
                        metavar='d',
                        help='max number of digits for operands (default: 3)')
    parser.add_argument('--num-samples',
                        type=int,
                        default=3,
                        help='number of samples')
    parser.add_argument('--with-spaces',
                        action='store_true',
                        default=False,
                        help='add spaces around operators')
    parser.add_argument('--out-filename',
                        type=str,
                        default='addition_prompts_without_spaces.txt',
                        help='name of output file (default: addition_prompts_without_spaces.txt)')
    parser.add_argument('--num-few-shot',
                        type=int,
                        default=0,
                        metavar='d',
                        help='number of few-shot examples (default: 0)')
    parser.add_argument('--ift-style',
                        action='store_true',
                        default=False,
                        help='add ift style tags around prompts (default: False)')

    parser_args = parser.parse_args()
    make_arithmetic_dataset(out_file=parser_args.out_filename, num_digits=parser_args.num_digits,
                            num_samples=parser_args.num_samples, with_spaces=parser_args.with_spaces,
                            num_few_shot=parser_args.num_few_shot, ift_style=parser_args.ift_style)
