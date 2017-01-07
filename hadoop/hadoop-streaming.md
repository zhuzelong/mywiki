:hadoop:

# Hadoop streaming

## Commands and options

Refer to [hadoop doc](https://hadoop.apache.org/docs/r1.2.1/streaming.html).

**Caveat**: the *generic options* must precede the *streaming options*.

`-files` is generic options and for HDFS files while `-file` is streaming options and for distribute local files.


## Control the number of output files

Each mapper yields a file for the reducers. The number of reducers determine the number of output files. Use `-D mapred.reduce.tasks=n` to control the number of reducers and output files.
