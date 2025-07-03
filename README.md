# Automata Models for Effective Bug Description

The artifact contains all experiments presented in the paper.

When preparing the artifact we used:
    * macOS 11.7.5 
    * Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
    * memory: 16 GB
    * disk: 256 GB

Running a complete experiment in each of the evaluation takes multiple days and requires huge resources. 
We included instructions for a scaled-down evaluation for each experiment table, which takes several minutes

## Installation and Usage

To run all experiments, the first step is to pull the docker image from dockerhub:
```shell
docker pull tomyaacov/automata-bug-description-docker
```

or download it from the artifact url and load it:

```shell
docker load -i <path to image>/automata-bug-description-docker.docker
```

and then run it:

```shell
docker run -it tomyaacov/automata-bug-description-docker
```

When running the container, the current directory will be ``Papers-2025-MODELS-Automata-Bug-Description``.


To run the evaluation, run the `main.py` file with the following arguments:

* `-B` is the benchmark name (one of `m24, m45, m54, m55, m76, m95, m135, m158, m159, m164, m172, m181, m183, m185, m201, m22, m27, m41, m106, m131, m132, m167, m173, m182, m189, m196, m199, all`)
* `-T` is the number of system configuration with the following options: 
  * `1` for the UNR setup (Table 1 in the paper)
  * `2` for the FDR setup (Table 2 in the paper)
  * `3` for the ADR setup (Table 3 in the paper)

For example, to run the evaluation for the benchmark `m164` with the UNR setup, run **warning - this can take few seconds**:

```shell
python main.py -B m164 -T 1
```
**warning - this can take few seconds**

The results will be saved in a csv file in the `output` folder. For example the above run results will be saved in `output/results_m164_T1_rpni.csv`.

More examples:
 
to run the evaluation for the benchmark `m164` with the FDR setup, run:

```shell
python main.py -B m164 -T 2
```
**warning - this can take few seconds**

results will be saved in `output/results_m164_T2_rpni.csv`.

to run the evaluation for the benchmark `m164` with the ADR setup, run:

```shell
python main.py -B m164 -T 3
```
**warning - this can take few seconds**

results will be saved in `output/results_m164_T3_rpni.csv`.

To run all benchmarks, set `-B all`. 

**warning - this my take more than a day to run**

for example, to run all benchmarks with the UNR setup, run:

```shell
python main.py -B all -T 1
```
The results will be saved in the `output` folder with the prefix `results_all_T1_rpni.csv`.


