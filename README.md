# simon - System Idle MONitor

This is a small program for managing laptop screen brightness and sleeps
after some idle time, based on whether the laptop is on AC or battery power.

Supports arbitrary actions with different times for AC/battery via a
profile file the path to which is set in `$HOME/.config/simon/config.sh`

`simon` uses `sysfs`/`procfs` where possible, but currently uses `systemd` for
avoiding conflicts with other sleeps - this shouldn't be too hard to swap out if
your system is a magical unicorn and hence doesn't use `systemd`.

Should work out of the box for: my laptop :)

## Installation

* Place the `simon` executable somewhere on your `$PATH`

* Copy the files from `config` to `~/.config`

* Add yourself to the `power` group to be able to sleep the system as your user.

To run `simon` as yourself at startup, add the line

    simon &

to your `.xinitrc`.


## Configuration

There are three files defining `simon`'s behaviour:

* `~/.config/simon/config.sh`: set the current `$PROFILE`, along with
  appropriate `sysfs` settings for your system

* `~/.config/simon/functions.sh`: this gets sourced by the main script and
  you can use it to add any function you want

* `~/.config/simon/$PROFILE`: the profile to use. An example profile is
  provided in `~/.config/simon/profiles` and pointed to by 
  `~/.config/simon/current_profile`

### Profiles

An example profile file looks like this

    # a comment
    #function       btime   atime   sensitive   args...
    darken_screen   60      600     false       10  30
    turn_off_screen 90      600     false
    suspend         0       300     true
    hibernate       300     0       true

* `function`:    Function to execute when rule is met. This can be a function
                 defined in this file, or an existing system utility


* `atime/btime`: Time in seconds before triggering for AC/battery. If `0`, do
                 not trigger in this mode. If `1`, trigger when user returns
                 from being idle

* `sensitive`:   `true` if function does session management (logout, suspend,
                        poweroff etc).
                 `false` otherwise

* `args`:        Arguments to pass to the function. Can only be plaintext, but
                 you get to write the functions, so, you can make this as
                 powerful as you want.

Any number of tabs or spaces delimit fields. Anything following a `#` is
treated as a comment.

# Credit

This program was based on a script posted by user rkwurth on the #! forums:
http://crunchbang.org/forums/viewtopic.php?id=26447
