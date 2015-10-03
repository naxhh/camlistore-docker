# Camlistore

Another camlistore image.

## Main goals

- Easier way to set a config file
- Allow data to be in another volume
- Give access to the ohet tools, not just camilestored


## Build binaries

```
docker run --rm -it -v $(pwd)/bin:/app golang:1.5 sh -c "git clone https://camlistore.googlesource.com/camlistore && cd camlistore && go run make.go && cp ./bin/* /app"
```