FROM opensourcefoundries/minideb:stretch

RUN install_packages git gcc ca-certificates python3 python3-pip
RUN git clone https://github.com/akbennett/iexfinance.git \
 && cd iexfinance \
 && pip3 install --upgrade wheel setuptools pandas requests \
 && pip3 install -- flake8 pytest \
 && python3 setup.py install

RUN cd iexfinance \
 && pytest -x tests
