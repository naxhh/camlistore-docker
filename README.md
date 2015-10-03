# Camlistore

Another camlistore image.
https://hub.docker.com/r/naxhh/camlistored/

## Main goals

- Easier way to set a config file
- Allow data to be in another volume
- Give access to the ohet tools, not just camilestored

## Running the image

```
# Create data container
docker run -v /data --name camlistore-data busybox

# Run your camlistored instance
docker run --rm -it -p 8080:80 --volumes-from camlistore-data -v /Users/nax/.config/camlistore:/config naxhh/camlistored
```

## Server config example

```
{
    "auth": "userpass:user:pass:vivify=mobile-pass",
    "listen": ":80",
    "identity": "27FF2844",
    "identitySecretRing": "/config/identity-secring.gpg",
    "blobPath": "/data/blobs",
    "packBlobs": true,
    "kvIndexFile": "/data/camli-index.kvdb",
    "dbNames": null,
    "shareHandler": true
}

```

Notice the blobPath is /data and the identity ring is /config


## Build docker image

```
docker run --rm -it -v $(pwd)/bin:/app golang:1.5 sh -c "git clone https://camlistore.googlesource.com/camlistore && cd camlistore && go run make.go && cp ./bin/* /app"
docker build -t naxhh/camlistored .
docker push naxhh/camlistored
```
