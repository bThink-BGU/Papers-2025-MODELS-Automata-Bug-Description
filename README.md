# Automata Models for Effective Bug Description

This repository contains all code for the following evaluations presented in the paper:

**Note: the project was implemented and tested on Python 3.9.16 and Java 11.0.8**

### Installation 

Set a virtual environment to run the code:
```shell
python -m venv env 
source env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

Compile the Java code for each benchmark. For example, for benchmark `m158`:
```shell
cd rers2019/IndReachabilityRers2019/arithmetic/m158
javac m158_Reach.java
```

To run the Assertion-driven setup (ADR), compile `DelayWrapper.java`
```shell
cd rers2019/IndReachabilityRers2019
javac DelayWrapper.java
```

### Usage

To run the evaluation, run the `main.py` file with the following command:
```shell
python main.py -B m158 -T 1
```
Where `-B` is the benchmark name and `-T` is the number of system configuration: `1` for the unrestricted setup (UNR), `2` for the failure-driven setup (FDR), and `3` for the assertion-driven setup (ADR). 

The results will be saved in a csv file in the `output` folder. For example the above run results will be saved in `output/results_m158_T1_rpni.csv`.
