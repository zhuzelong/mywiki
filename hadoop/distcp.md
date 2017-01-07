:hadoop:

# Disctcp

## Command and options

Refer to [hadoop doc](https://hadoop.apache.org/docs/r1.2.1/distcp2.html)

Note the difference among `-update`, `-overwrite` and default (neither `-update` nor `-overwrite`).

The `-m` option specify the **maximum** number of mappers, not the exact number of running mappers.


## The number of mapper

distcp transfers files based on a *copy list* where each file entails a mapper, i.e. the transfer is based on *file*, not *block*.
