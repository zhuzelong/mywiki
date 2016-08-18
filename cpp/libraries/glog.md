# GLOG

Refer to the [tutorial](http://rpg.ifi.uzh.ch/docs/glog.html)

## Control logging levels

```bash
INFO: 0
WARN: 1
ERROR: 2
FATAL: 3

# Run in bash
GLOG_minloglevel=2 ./runner

# Run in gdb
(gdb)> set env GLOG_minloglevel = 2

```
