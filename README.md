# ide-container-platformio

A Containerfile that builds container with VS Code and PlatformIO IDE extension.

# Usage

```
podman build --rm --force-rm -t localhost/ide-platformio .

podman run -it --name=platformio -v .:/projects -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY localhost/ide-platformio
```

Wait for installer to run

```
podman start -i platformio
``` 

# Result


![open platformio ide window](https://i.imgur.com/EerdnAY.png)


