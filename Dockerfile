FROM debian:stretch

RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install curl=7.47.0 bzip2=1.0.6 \
  && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
  && bash /tmp/miniconda.sh -bfp /usr/local \
  && rm -rf /tmp/miniconda.sh \
  && conda install -y python=3 \
  && conda update conda \
  && apt-get -qq -y --no-install-recommends install make=4.1 \
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
EXPOSE 80/tcp

## Step 5:
# Run run_flask.sh at container launch
ENTRYPOINT ["conda", "run", "-n", "capstone", "python", "hello.py"]
