##########################
## configuration
##########################
# change these to match your system configuration

# do not trigger sensitive rules if these processes exist
readonly KEEPALIVE_PROCS="shutdown vlc"

# can hardcode to "profiles/my_profile" or use a symlink
readonly PROFILE=current_profile

# sysfs file with ac status
readonly SYSFS_AC_STATUS_FILE=/sys/class/power_supply/AC/online

# value in SYSFS_AC_STATUS_FILE indicating we are plugged in
readonly AC=1

# the IO class may differ from system to system. you can check this by doing
# `watch cat /proc/interrupts` and observing changes when you move keyboard and
# mouse
readonly PROCFS_INTERRUPT_FILE=/proc/interrupts
readonly INTERRUPT_IO_CLASS=i8042

