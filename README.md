Run with :

```
podman run -d \
  --name=slskd-flac2mp3 \
  -e PUID=0 \
  -e PGID=0 \
  -e TZ=Etc/UTC \
  -p 9000:9000 \ # I recommend you use a network instead
  -v /path_to_soulseek_downloads:/same_prefix_as_soulseek_download_volume:z \
  --restart unless-stopped \
  ghcr.io/Aldarone/slskd-flac2mp3:latest
```
