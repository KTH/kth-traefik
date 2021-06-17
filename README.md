# KTH Traefik

This is the proxy that answers to incomming public trafic to a Docker Swarm Mode cluster. The HTTP requests passes a Azure Load Balancer that listens on the clusters public IP and port 443.

The image that is build by [:whale: Dockerfile](https://gita.sys.kth.se/Infosys/kth-traefik/blob/master/Dockerfile) is a [Traefik image](https://traefik.io/), but when the container starts it reads the environment variables `TRAEFIK_CERT_PEM` and `TRAEFIK_CERT_KEY` and writes these to file in the container instance. These two envs contains the TLS certiificate that are defined as host names for the public IPv4 addresses we use.

_At time of writing these are:_

```text
everest.sys.kth.se
active.everest.sys.kth.se
stage.everest.sys.kth.se
integral.everest.sys.kth.se
migration.everest.sys.kth.se
test.everest.sys.kth.se
grey.everest.sys.kth.se
pink.everest.sys.kth.se
teal.everest.sys.kth.se
white.everest.sys.kth.se
yellow.everest.sys.kth.se
black.everest.sys.kth.se
blue.everest.sys.kth.se
red.everest.sys.kth.se
api.kth.se
app.kth.se
referens.sys.kth.se
api-r.referens.sys.kth.se
app-r.referens.sys.kth.se
```

Source: [Permanent IP:s and host names](https://confluence.sys.kth.se/confluence/pages/viewpage.action?pageId=32967814)


## Changing certificates
The `TRAEFIK_CERT_PEM` has two certificate in `secrets.env`, you only have update the first cert if you get a new certificate for the hosts (Traefik). In _secrets.env_ the certificate and key has to be oneliners with `\n` inserted as new lines.
