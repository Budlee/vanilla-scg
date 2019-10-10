# vanilla-scg
Used for Docker Test Container Demo

## Docker
To run the image

```dockerfile
docker run -v `pwd`/sample_properties:/etc/gateway/config -p 80:8080 jpgough/vanilla-scg
```

Arguments
   * -v mount the properties to `/etc/gateway/config`
   * -p map to port 8080 as that is the port the gateway is listening on
