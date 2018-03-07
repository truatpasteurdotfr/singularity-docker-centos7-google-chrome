#!/bin/sh
S=~/singularity.d/containers/chrome-c7.simg
H=`mktemp -d /dev/shm/chrome-private-XXXX`

trap '{ 
echo
echo "**************************************"
echo "press enter to continue and remove ${H}"
echo "press ctr-c to preserve ${H}"
echo "**************************************" 
read NNN 
[ -d ${H} ] && /bin/rm -rf ${H} && echo deleted 
}' EXIT

mkdir -p ${H} || :
if [ ! -f ${S} ]; then
echo "singularity container missing, downloading it"
singularity pull --name ${S} shub://truatpasteurdotfr/singularity-docker-centos7-google-chrome && echo ok
else
echo "starting the google-chrome from the container ${S} with a discardable HOME: ${H}"
#singularity run -B /run -H  ~/singularity.d/home/google-chrome ${S}
singularity exec -B /run -H ${H} ${S} \
/opt/google/chrome/google-chrome \
--bwsi \
--disable-metrics \
--no-first-run \
--no-sandbox \
--disable-translate \
'https://chrome.google.com/webstore/detail/scriptsafe/oiigbmnaadbkfbmpbfijlflahbdbdgdf?hl=en-US' \
"$@"
fi
