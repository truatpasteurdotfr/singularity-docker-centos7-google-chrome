BootStrap: docker
From: centos:centos7

%post
yum -y update && yum -y upgrade

# you need to create the top level directories since there is no overlay on CentOS-6
# specific to my setup
mkdir -p /local-storage /mnt/beegfs /baycells/home /baycells/scratch /c6/shared /c6/eb /local/gensoft2 /c6/shared/rpm /Bis/Scratch2 /mnt/beegfs /pasteur

# since version 66 needs yum -y install libappindicator from epel
yum -y install epel-release && yum -y install libappindicator

# https://www.google.com/chrome/
# 
# Note: Installing Google Chrome will add the Google repository so your system
# will automatically keep Google Chrome up to date. If you don’t want Google's
# repository, do “sudo touch /etc/default/google-chrome” before installing the
# package.
# 
# https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

#yum -y install bzip2 freetype mesa-libGLU libXi libXrender mesa-dri-drivers

# libGL error: unable to load driver: i965_dri.so
# libGL error: driver pointer missing
# libGL error: failed to load driver: i965
# libGL error: unable to load driver: i965_dri.so
# libGL error: driver pointer missing
# libGL error: failed to load driver: i965
# libGL error: unable to load driver: swrast_dri.so
# libGL error: failed to load driver: swrast
# 
yum -y install mesa-dri-drivers

# Gtk-Message: Failed to load module "pk-gtk-module"
# Gtk-Message: Failed to load module "canberra-gtk-module"
# Gtk-Message: Failed to load module "pk-gtk-module"
# Gtk-Message: Failed to load module "canberra-gtk-module"

yum -y install libcanberra-gtk2 libcanberra adwaita-gtk2-theme PackageKit-gtk3-module


%runscript
# you need to use the "unsupported" --no-sandbox flag, since singularity is not running as a privileged process
# failing to do so will result in:
# [singularity-docker-centos7-google-chrome]$ ./google-chrome 
# The setuid sandbox is not running as root. Common causes:
#   * An unprivileged process using ptrace on it, like a debugger.
#   * A parent process set prctl(PR_SET_NO_NEW_PRIVS, ...)
# Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted
# /.singularity.d/runscript: line 3: 23467 Trace/breakpoint trap   (core dumped) google-chrome "$@"

# you need to bind mount /run for dconf...
# 
# [27131:27154:1128/093252.304587:ERROR:bus.cc(395)] Failed to connect to the bus: Failed to connect to socket /var/run/dbus/system_bus_socket: No such file or directory
# (google-chrome:27131): dconf-CRITICAL **: unable to create directory '/run/user/2765/dconf': Permission denied.  dconf will not work properly.
# 
# [singularity-docker-centos7-google-chrome]$ singularity run -B /run -H ~/singularity.d/home/chrome google-chrome 
google-chrome --no-sandbox  "$@"
