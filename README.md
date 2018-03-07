# singularity-docker-centos7-google-chrome
google-chrome singularity container on CentOS-7

```
Running without installation:
```
singularity run shub://truatpasteurdotfr/singularity-docker-centos7-google-chrome
```
Building:
```
sudo singularity build google-chrome.simg Singularity
```
Download and rename:
```
singularity pull --name "google-chrome.simg" shub://truatpasteurdotfr/singularity-docker-centos7-google-chrome
```
Running with a separate $HOME and access to /run
```
mkdir -p  ~/singularity.d/home/google-chrome
singularity run -B /run -H  ~/singularity.d/home/google-chrome ./google-chrome.simg
```

Caveat:
- you need to rebuild the container for each update of chrome/base os if you are using the squashfs image format.
- possible workaround: convert the squash file system to a directory with the `--sandbox`
```
mkdir -p ~/singularity.d/sandbox/google-chrome
sudo singularity build --sandbox ~/singularity.d/sandbox/google-chrome ./google-chrome.simg
sudo singularity exec --writable ~/singularity.d/sandbox/google-chrome 'yum -y update'
```

