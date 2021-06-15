# KTH Traefik  ![Continous Integration](https://github.com/KTH/kth-traefik/actions/workflows/main.yml/badge.svg)

This is the proxy that answers to incomming public trafic to a Docker Swarm Mode cluster. The HTTP requests passes a Azure Load Balancer that listens on the clusters public IP and port 443.

The image that is build by :whale: Dockerfile [Traefik image](https://traefik.io/), but when the container starts it reads the environment variables `TRAEFIK_CERT_PEM` and `TRAEFIK_CERT_KEY` and writes these to file in the container instance. These two envs contains the TLS certiificate that are defined as host names for the public IPv4 addresses we use.

Source: [Permanent IP:s and host names](https://confluence.sys.kth.se/confluence/pages/viewpage.action?pageId=32967814)