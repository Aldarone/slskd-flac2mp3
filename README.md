# What is it ?

This is a small webhook container you can use to configure slskd to convert your downloaded files in 320k MP3s.

# How to ?

Assuming you use the `docker.io/slskd/slskd` and you have `SLSKD_DOWNLOADS_DIR` set as `/downloads` inside the slskd container.

Run with :

```
podman run -d \
  --name=slskd-flac2mp3 \
  -e PUID=0 \
  -e PGID=0 \
  -e TZ=Etc/UTC \
  -e CONVERSION_EXT_LIST=flac;wav;m4a # Default is "flac;wav"
  -p 9000:9000 \ # I recommend you use a network instead
  -v /path_to_soulseek_downloads:/downloads:z \
  --restart unless-stopped \
  ghcr.io/Aldarone/slskd-flac2mp3:latest
```

and then add this to your `slskd.yml` :

```
integration:
  webhooks:
    my_webhook:
      on:
        - DownloadFileComplete
      call:
        url: http://slskd-flac2mp3.dns.podman:9000/hooks/convert-to-mp3
      timeout: 5000 # in milliseconds
      retry:
        attempts: 3
```
