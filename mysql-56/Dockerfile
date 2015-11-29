FROM mysql:5.6
#TODO: look at https://hub.docker.com/r/mysql/mysql-server/
MAINTAINER Florian Bender <fb+dockerhub@quantumedia.de>

RUN mkdir /envars.d
COPY docker-env-vars.d/* /envars.d/
COPY docker-entrypoint-initdb.d/*.{sh,sql} /docker-entrypoint-initdb.d/

# patch the entrypoint file to source (insert after shebang line)
RUN awk '/^#!/ { \
        print; \
        print ""; \
        print "for f in /envars.d/*; do . $f; done"; \
        print ""; \
        next \
    }1' /entrypoint.sh > docker-entrypoint.sh \
    && mv docker-entrypoint.sh /entrypoint.sh

# for images building upon this image, auto-copy config, env files, and entrypoint scripts
ONBUILD COPY mysql-conf.d/* /etc/mysql/conf.d/
ONBUILD COPY docker-env-vars.d/* /envars.d/
ONBUILD COPY docker-entrypoint-initdb.d/*.{sh,sql} /docker-entrypoint-initdb.d/

#EOF
