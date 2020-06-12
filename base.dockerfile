FROM continuumio/miniconda3
LABEL Description="gostin base container"

SHELL ["/bin/bash", "-c"]

USER root

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

RUN apt-get update && \
    apt-get install -y --no-install-recommends libgl1-mesa-dev xvfb tini g++ && \
    rm -rf /var/lib/apt/lists/*

# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 /tmp/environment.yml | cut -d' ' -f2)" > ~/.bashrc
# ENV PATH /opt/conda/envs/$(head -1 /tmp/environment.yml | cut -d' ' -f2)/bin:$PATH

# Headless display configuration for PyVista
COPY start_xvfb.sh /sbin/start_xvfb.sh
RUN chmod a+x /sbin/start_xvfb.sh

ENTRYPOINT ["tini", "-g", "--", "start_xvfb.sh", "/bin/bash"]
