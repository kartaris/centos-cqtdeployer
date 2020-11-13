FROM kartaris/centos-qtinstallerframework

MAINTAINER "kartaris" <rust768@gmail.com>

# Installing base packages
RUN dnf -y install which ccache && dnf clean all

# Cloning and building and installing cqtdeployer
RUN cd /home && git clone https://github.com/kartaris/CQtDeployer.git && cd CQtDeployer && git checkout kartaris-ifw-via-makeinstall && git submodule update --init --recursive
RUN cd /home/CQtDeployer && qmake-qt5 -r && make && make install 

RUN rm -rf /home/CQtDeployer

