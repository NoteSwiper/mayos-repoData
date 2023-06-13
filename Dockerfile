FROM scratch

LABEL version="1.0.0"
LABEL description="mayos"

WORKDIR C:\Users\user\Documents\osc\mos1\
ENV VAR Non
RUN echo ${VAR}
