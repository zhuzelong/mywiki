# Python unicode processing

## Conversion between unicode and byte string

```python 
# unicode to str (byte string)
u = u'This is unicode'
s = u.encode('utf8')

# byte string to unicode
s = r'This is byte string'
u = s.decode('utf8')

```


## Unescape string literal

```python
s = r'\t\n\tSome text\n\t'
unescaped = s.decode('string_escpae')

u = ur'\t\n\tSome unicode\n\t'
unescpae = u.deocde('string_escape')  # Return str, not unicode

```
