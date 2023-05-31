import random
import argparse

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

def make_arithmetic_dataset(out_file, num_digits=3, num_samples=1000, with_spaces=False, num_few_shot=0):
    if num_few_shot > 0:
        few_shot_prompt = "Here are some examples of addition problems separated by a semicolon: "
        for idx in range(num_few_shot):
            row, c = get_addition_sample(num_digits, with_spaces)
            row += c
            few_shot_prompt += row + "; "

    with open(out_file, "w", encoding='utf8') as f:
        for idx in range(num_samples):
            row, c = get_addition_sample(num_digits, with_spaces)
            if num_few_shot > 0:
                final_row = few_shot_prompt + row + "\n"
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

    parser_args = parser.parse_args()
    make_arithmetic_dataset(out_file=parser_args.out_filename, num_digits=parser_args.num_digits,
                            num_samples=parser_args.num_samples, with_spaces=parser_args.with_spaces,
                            num_few_shot=parser_args.num_few_shot)
