:cpp:

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


## Set G_flag

The Glog settings can be set via environment variales by `GLOG_$flag`. The common flags are:

- `logtostderr` (bool, default false)
- `colorlogtostderr` (bool, default false)
- `stderrthreshold` (int, default 2): output the log of which level is larger than the threshold to stderr
- `minloglevel` (int, default 0, i.e. INFO)
- `log_dir` (string, default "")
- `v` (int, default 0): control vlog
- `vmodule` (string, default "")

