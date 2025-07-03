# Use Ubuntu 22.04 as base
FROM ubuntu:22.04

# Set environment variables to ensure non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive


# Update and install required packages
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3.9 python3.9-venv python3.9-dev
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py

RUN python3.9 -m venv /venv
ENV PATH=/venv/bin:$PATH

RUN python3 -m pip install aalpy==1.3.2
RUN python3 -m pip install automata-lib==8.4.0
RUN python3 -m pip install z3-solver==4.13.0.0
RUN python3 -m pip install numpy==2.0.0
RUN python3 -m pip install pandas==2.2.2
RUN python3 -m pip install stopit==1.1.2

RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y git


# download repo
RUN git clone https://github.com/bThink-BGU/Papers-2025-MODELS-Automata-Bug-Description.git

# compile java files
RUN javac -d Papers-2025-MODELS-Automata-Bug-Description/rers2019/IndReachabilityRers2019 Papers-2025-MODELS-Automata-Bug-Description/rers2019/IndReachabilityRers2019/DelayWrapper.java

# compile "m24", "m45", "m54", "m55", "m76", "m95", "m135", "m158", "m159", "m164", "m172", "m181", "m183", "m185", "m201", "m22", "m27", "m41", "m106", "m131", "m132", "m167", "m173", "m182", "m189", "m196", "m199"

RUN cd Papers-2025-MODELS-Automata-Bug-Description

RUN cd rers2019/IndReachabilityRers2019/arithmetic/m24
RUN javac m24_Reach.java
RUN cd ../../../..

RUN cd rers2019/IndReachabilityRers2019/arithmetic/m45
RUN javac m45_Reach.java
RUN cd ../../../..

RUN cd rers2019/IndReachabilityRers2019/arithmetic/m54
RUN javac m54_Reach.java
RUN cd ../../../..

RUN cd ..

# Cleanup to reduce image size
RUN apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm get-pip.py

# Define a default command, for this case, we're just using a bash shell
WORKDIR "/Papers-2025-MODELS-Automata-Bug-Description"
#ENTRYPOINT git pull &> /dev/null && /bin/bash
CMD ["/bin/bash"]