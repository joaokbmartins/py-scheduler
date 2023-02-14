FROM nginx:1.23.3-alpine

COPY [ ".", "/scheduler" ]

WORKDIR "/scheduler/python-installer"
RUN [ "tar", "-xf", "Python-3.10.10.tar.xz" ]
RUN [ "mv", "Python-3.10.10", "/scheduler/python" ]

WORKDIR "/scheduler"
RUN [ "rm", "-rf", "python-installer" ]

WORKDIR "/scheduler/python"
USER "root"
RUN [ "./configure" ]
RUN [ "make", "install" ]

WORKDIR "/etc"
RUN echo 'export PATH="$PATH:/scheduler/python"' >> profile
RUN source /etc/profile

# RUN  tar -xf /scheduler/python/Python-3.10.10.tar.xz  \
#   && rm -r /scheduler/python/Python-3.10.10.tar.xz \
#   && \
#   && \
#   && \
#   && \
#   && \
#   && apk add python3 \
#   && apk add py3-pip \
#   && pip install schedule \
#   && pip install apscheduler

# ENTRYPOINT python3 /scheduler/scheduler.py