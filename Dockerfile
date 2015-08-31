FROM ubuntu:trusty

RUN apt-get -y update
RUN apt-get install -y nano

RUN add-apt-repository ppa:transmissionbt/ppa
RUN apt-get update
RUN apt-get install -y transmission-cli transmission-common transmission-daemon

RUN sudo service transmission-daemon stop
RUN sudo mv /var/lib/transmission-daemon/info/settings.json /var/lib/transmission-daemon/info/settings.json.backup
ADD settings.json /var/lib/transmission-daemon/info/settings.json