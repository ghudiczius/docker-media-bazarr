# Bazarr

Simple docker image for Bazarr without any bloat, built on the official python3 image. Radarr runs as user `bazarr` with `uid` and `gid` 6767.

## Usage

```sh
docker run --rm ghudiczius/bazarr:<VERSION> \
  -p 6767:6767 \
  -v path/to/data:/data \
  -v path/to/movies:/movies \
  -v path/to/series:/series
```
