FROM nvidia/cuda:8.0-cudnn5-devel


RUN apt-get clean && apt-get update
RUN apt-get install -yqq python3 python3-pip python3-dev build-essential \
    python3-setuptools python3-numpy python3-scipy \
    libatlas-dev \
    git wget gfortran libatlas-base-dev libatlas3-base libhdf5-dev \
    libfreetype6-dev libpng12-dev pkg-config libxml2-dev libxslt-dev \
    libboost-program-options-dev zlib1g-dev libboost-python-dev

ADD scripts /scripts

RUN pip3 install -U pip cython numpy
RUN pip3 install -U -r requirements.txt

EXPOSE 8888
VOLUME ["/notebook", "/scripts"]
WORKDIR /scripts

ADD test_scripts /test_scripts
COPY .theanorc /root/.theanorc
ADD jupyter /jupyter
ENV JUPYTER_CONFIG_DIR="/jupyter"

CMD ["jupyter", "notebook", "--ip=localhost"]
