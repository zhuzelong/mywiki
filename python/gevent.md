:python:

# Gevent

## Components

A `greenlet (gevent.Greenlet)` is a coroutine; a `gevent.pool.Group` is a fixed number of `greenlet`; a `gevent.pool.Pool` is a dynamic group of `greenlet`.


> The monkey pactching must be put in the first line of script such that the patches are valid before any thread is invoked.


## Asynchronized concurrency

```python
# Monkey patching at the very beginning
from gevent import monkey; monkey.patch_all()
import gevent


def job(query):
    # Search query
    return result
    

def main():
    quries = []
    jobs = [gevent.spawn(job, q) for q in quries]
    # Begin execution
    gevent.joinall(jobs, timeout=60)  # timeout in second
    
    for job in jobs:
        result = job.value  # the returned value is stored in the 'value' attribute
    
```


## Pool

```python
from gevent import monkey; monkey.patch_all()
import gevent


def job(query):
    # search query
    return result
    

def main():
    queries = []
    pool = gevent.pool.Pool(10)  # size of pool
    
    # Begin execution
    # Refer to the other method: map, imap
    for result in pool.imap_unorderd(job, queries):
        print result

```
