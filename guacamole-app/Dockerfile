FROM guacamole/guacamole:1.1.0
LABEL MAINTAINER thomas@tuxpeople.org
COPY branding.jar /opt/guacamole/skel/extensions/

WORKDIR /opt/guacamole
EXPOSE 8080
CMD ["/opt/guacamole/bin/start.sh" ]