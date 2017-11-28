# singularity-docker-centos7-google-chrome
google-chrome singularity container on CentOS-7

```
Running without installation:
singularity run shub://truatpasteurdotfr/singularity-docker-centos7-google-chrome
Building:
singularity build google-chrome Singularity
Download and rename:
singularity pull --name "google-chrome" shub://truatpasteurdotfr/singularity-docker-centos7-google-chrome

Running with a separate $HOME and access to /run
mkdir -p  ~/singularity.d/home/google-chrome
singularity run -B /run -H  ~/singularity.d/home/google-chrome ./google-chrome
```
