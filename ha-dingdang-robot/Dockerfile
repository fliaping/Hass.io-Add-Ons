FROM library/debian:latest

# 安装依赖
RUN  apt-get update && apt-get upgrade --yes && \
  apt-get install apt-utils wget vim git-core python-dev python-pip bison libasound2-dev portaudio19-dev \
  python-pyaudio libatlas-base-dev python-pymad cmake \ 
  uuid-dev fswebcam libav-tools subversion autoconf libtool automake gfortran g++ \
  sox libsox-fmt-mp3 --yes

# 安装叮当
RUN git clone https://github.com/dingdang-robot/dingdang-robot.git dingdang && \
  cd dingdang && \
  pip install --upgrade setuptools && \
  pip install -r client/requirements.txt && cd ..

#安装 Sphinxbase/Pocketsphinx
RUN apt-get install pocketsphinx --yes && \
  wget http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/0.8/sphinxbase-0.8.tar.gz && \
  tar -zxvf sphinxbase-0.8.tar.gz && \
  cd sphinxbase-0.8/ && \
  ./configure --enable-fixed && \
  make && make install && cd .. && \
  wget http://downloads.sourceforge.net/project/cmusphinx/pocketsphinx/0.8/pocketsphinx-0.8.tar.gz && \
  tar -zxvf pocketsphinx-0.8.tar.gz && \
  cd pocketsphinx-0.8/ && \
  ./configure && make && make install && cd ..

# 安装 CMUCLMTK
RUN svn co https://svn.code.sf.net/p/cmusphinx/code/trunk/cmuclmtk/ && \
  cd cmuclmtk/ && ./autogen.sh && make && sudo make install && cd ..

RUN wget http://distfiles.macports.org/openfst/openfst-1.4.1.tar.gz && \
  wget https://github.com/mitlm/mitlm/releases/download/v0.4.1/mitlm_0.4.1.tar.gz && \
  wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/m2m-aligner/m2m-aligner-1.2.tar.gz && \
  wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/phonetisaurus/is2013-conversion.tgz && \
  tar -xvf m2m-aligner-1.2.tar.gz && \
  tar -xvf openfst-1.4.1.tar.gz && \
  tar -xvf is2013-conversion.tgz && \
  tar -xvf mitlm_0.4.1.tar.gz && \
#   编译安装 OpenFST
  cd openfst-1.4.1/ && \
  ./configure --enable-compact-fsts --enable-const-fsts --enable-far --enable-lookahead-fsts --enable-pdt && \
  make install &&  cd .. && \
#   编译安装 M2M
  cd m2m-aligner-1.2/ && \
  make && cp m2m-aligner /usr/local/bin/m2m-aligner && cd .. && \
#   编译安装 MITLMT
  cd mitlm-0.4.1/ && ./configure && make install && cd .. && \
#   编译安装 Phonetisaurus
  cd is2013-conversion/phonetisaurus/src && make && \
  cp ../../bin/phonetisaurus-g2p /usr/local/bin/phonetisaurus-g2p && cd ../../../

