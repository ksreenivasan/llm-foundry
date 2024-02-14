import pandas as pd
import numpy as np

model_list = [
    'mpt-7b-base-gsm8k-ft.csv',
    'mpt-7b-chat-gsm8k-ft-hf',
    'mpt-7b-base-metamathqa-ft',
]

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

num_few_shot = 0

filename = f'{model_list[0]}_{num_few_shot}_shot_gsm8k_generations.csv'
df = pd.read_csv('mpt-7b-chat-gsm8k-ft-hf_0_shot_gsm8k_generations.csv')

def pretty_print(df, split='train', idx=None):
    if idx == None:
        print("Index not passed, picking a random row.")
        idx = np.random.randint(0, len(df))
    print(f"Showing {split} example at index {idx}")
    row = df.iloc[idx]
    print(f"Prompt:\n{row['prompt']}\n\n")
    print(f"Correct Answer:\n{bcolors.OKGREEN}{row['answer']}{bcolors.ENDC}\n\n")
    actual_answer = row['answer'].split('####')[-1].strip()
    if actual_answer in row['model_generation']:
        pretty_generation = row['model_generation'].replace(actual_answer, f"{bcolors.UNDERLINE}{bcolors.OKGREEN}{actual_answer}{bcolors.ENDC}")
        print(f"Generated Answer:\n{pretty_generation}\n\n")
    else:
        # print generated answers in red
        print(f"Generated Answer:\n{bcolors.FAIL}{row['model_generation']}{bcolors.ENDC}\n\n")

