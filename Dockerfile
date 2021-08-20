FROM traefik:v2.5.0

RUN mkdir /kth-certs

COPY write-certs-to-file.sh /write-certs-to-file.sh
RUN chmod a+x /write-certs-to-file.sh
COPY traefik.yml /etc/traefik/traefik.yml

ENTRYPOINT ["/write-certs-to-file.sh"]