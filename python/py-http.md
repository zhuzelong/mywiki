:python:

# HTTP handlers

## urllib



## urllib2

> `urlopen()` with no data will invoke `GET` while with data will invoke `POST`.


### Fetch url

```python

import urllib
import urllib2

# Trivial sample
url = 'http://www.google.com'
response = urllib2.urlopen(url)
html = response.read()

# Request object
request = urllib2.Request(url)
respsone = urllib2.urlopen(request)
html = response.read()

```

### Post data

```python
data = {'name': 'foo', 'id': 'bar'}  # dict
data = urllib.urlencode(data)
request = urllib2.Request(url, data)
response = urllib2.urlopen(request)
html = response.read()

```


### Add headers

> The default header is `User-agent: Python-urllib/x.y` (e.g. `Python-urllib/2.7`)

```python
headers = {'User-agent': 'Mozilla/5.0'}
request = urllib2.Request(url, data, headers)



```

### Opener and Handler

> When you fetch a URL you use an opener (an instance of the perhaps confusingly-named urllib2.OpenerDirector). Normally we have been using the default opener - via urlopen - but you can create custom openers. Openers use handlers. All the “heavy lifting” is done by the handlers.



