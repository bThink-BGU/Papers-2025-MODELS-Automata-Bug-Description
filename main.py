import argparse
from main_single import main_single
import pandas as pd
from stopit import SignalTimeout as Timeout
import random
import warnings

parser = argparse.ArgumentParser()
parser.add_argument('--benchmark', '-B', type=str, default="m164")
parser.add_argument('--method', '-M', type=str, default="rpni")
# parser.add_argument('--description_type', '-D', type=str, default="FE")
parser.add_argument('--t_type', '-T', type=str, default="1")
# parser.add_argument('--early_detection', '-E', action='store_true')
args = parser.parse_args()

random.seed(0)

if args.benchmark == "all":
    benchmarks = ["m24", "m45", "m54", "m55", "m76", "m95", "m135", "m158", "m159", "m164", "m172", "m181", "m183",
                  "m185", "m201", "m22", "m27", "m41", "m106", "m131", "m132", "m167", "m173", "m182", "m189", "m196",
                  "m199"]
else:
    benchmarks = [args.benchmark]

with warnings.catch_warnings():
    warnings.simplefilter("ignore")
    results_list = []
    for benchmark in benchmarks:
        # print("*****************", benchmark, "*****************")
        with Timeout(60.0*60*10) as timeout_ctx:
            if args.t_type == "2" and benchmark == "m185":
                # results in out of memory
                results = {"benchmark": benchmark, "L* time": -1}
            else:
                results = main_single(benchmark, args.t_type, args.method, None, None)
        if timeout_ctx.state == timeout_ctx.TIMED_OUT:
            results = {"benchmark": benchmark, "L* time": 0}
        results_list.append(results)

df = pd.DataFrame(results_list)
import os
if not os.path.exists("output"):
    os.makedirs("output")
df.to_csv(f'output/results_{args.benchmark}_T{args.t_type}_{args.method}.csv', index=False)




