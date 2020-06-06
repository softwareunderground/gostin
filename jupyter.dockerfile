FROM softwareunderground/gostin

RUN conda install -n gostin -c conda-forge jupyterlab nb_conda_kernels

WORKDIR /root/

ENTRYPOINT ["tini", "-g", "--", "start_xvfb.sh"]

COPY start_jupyter.sh /sbin/start_jupyter.sh
RUN chmod a+x /sbin/start_jupyter.sh

CMD source /root/.bashrc && /sbin/start_jupyter.sh
