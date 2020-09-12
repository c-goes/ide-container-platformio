# ide-container-platformio

A Container image for microcontroller development.

A Containerfile that builds container with VS Code and PlatformIO IDE extension. Running it in a container should prevent potential interferences with your normal VS Code configuration.

# Usage

```
podman build --rm --force-rm -t localhost/ide-platformio .
```

Create the container and mount a microcontroller inside the container:

```
podman run --device /dev/ttyUSB0 -it --shm-size=1024m --name=platformio -v .:/projects -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY
```

Running user must be in the `dialout` group for this to work rootless.

Wait until platformIO is installed and close VS Code.

Container is now ready for use:


```
podman start -i platformio
```


# Result


![open platformio ide window](https://i.imgur.com/Xy7cSNq.png)

![show the recognized microcontroller on the IDE window](https://i.imgur.com/jtjdi6L.png)
