FROM python:3.7.3-stretch

ENV CURL_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt
ENV CAPATH /etc/ssl/certs/
ENV CACERT /etc/ssl/certs/ca-certificates.crt

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install ca-certificates=20161130+nmu1+deb9u1 curl=7.52.1-5+deb9u10 bzip2=1.0.6-8.1 \
  && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
  && bash /tmp/miniconda.sh -bfp /usr/local \
  && rm -rf /tmp/miniconda.sh \
  && conda install -y python=3 \
  && conda update conda \
  && apt-get -qq -y --no-install-recommends install make=4.1-9.1 \
  && apt-get -qq -y remove curl bzip2 \
  && apt-get -qq -y autoremove \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
  && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH

## Step 1:
RUN mkdir capstone

## Step 2:
COPY . /capstone

## Step 3:
# Install packages from requirements.txt
WORKDIR /capstone

# Make RUN commands use the new environment:

RUN make setup

SHELL ["conda", "run", "-n", "capstone", "/bin/bash", "-c"]

## Step 4:
# Expose port 80
EXPOSE 5000/tcp

## Step 5:
# Run run_flask.sh at container launch
ENTRYPOINT ["conda", "run", "-n", "capstone", "python3", "hello.py"]
