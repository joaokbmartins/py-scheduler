FROM nginx:1.23.3-alpine

COPY ["./scheduler.py", "/"]

RUN [ "echo", "Instalando Python3..." ]
RUN [ "apk", "add", "python3" ]

RUN [ "echo", "Instalando PIP..." ]
RUN [ "apk", "add", "py3-pip" ]

RUN [ "echo", "Instalando Schedule..." ]
RUN [ "pip", "install", "schedule" ]

RUN [ "echo", "Iniciando o scheduler..." ]
ENTRYPOINT [ "python3", "/scheduler.py" ]