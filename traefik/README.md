# Generating certificates
Use mkcert to generate locally-trusted certificates.

## mkcert

https://github.com/FiloSottile/mkcert

mkcert is a simple tool for making locally-trusted development certificates. It requires no configuration.

To regenerate default certificates use the following commands:

```bash
mkcert \
  -cert-file dev-cert.pem \
  -key-file dev-key.pem \
  "dev.loc" "*.dev.loc"
```

```bash
mkcert \
-cert-file docker-cert.pem \
-key-file docker-key.pem \
"docker.loc" "*.docker.loc"
```

```bash
mkcert \
-cert-file localhost-cert.pem \
-key-file localhost-key.pem \
"localhost"
```

You need to set a CA_STORE environment variable according to your distribution :

For Ubuntu / Debian:
```bash
docker-compose up -d --build
sudo update-ca-certificates
```

For Arch / Manjaro:
```bash
echo 'CA_STORE=/etc/ca-certificates/trust-source/anchors' >> .env
docker-compose up -d --build
sudo trust extract-compat
```

For Fedora / RHEL / CentOS:
```bash
echo 'CA_STORE=/etc/pki/ca-trust/source/anchors' >> .env
docker-compose up -d --build
sudo update-ca-trust extract
```

For Gentoo:
```bash
echo 'CA_STORE=/etc/ssl/certs' >> .env
docker-compose up -d --build
sudo update-ca-certificates
```
