FROM guacamole/guacamole:1.1.0
LABEL MAINTAINER thomas@tuxpeople.org
RUN apt-get update && apt-get full-upgrade -y  && rm -rf /var/lib/apt/lists/*
COPY branding.jar /opt/guacamole/skel/extensions/

WORKDIR /opt/guacamole
EXPOSE 8080
CMD ["/opt/guacamole/bin/start.sh" ]
