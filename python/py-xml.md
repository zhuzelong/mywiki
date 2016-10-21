:python:

# XML libraries

The `xml` package contains:

- `xml.etree.ElementTree`
- `xml.dom`
- `xml.sax`


## XML ElementTree

The two major objects: `ElementTree` and `Element`.

Each `Element` contains:

- tag: the name of the node
- attributes (attrib): stored in a Python dict
- text: string of content
- tail string
- child elements: stored in Python sequence


### Read data

```python
from xml.etree import cElementTree as ET

# Read file
tree = ET.parse('input.xml')  # return an 'ElementTree'

# Read large file
tree = ET.iterparse('input.xml', events=['end'])  # return an iterator (event, element)

# From string
root = ET.fromstring(xml_string)  # return an 'Element'


```


### Iterate over node

```python
root = ET.fromstring(xml_string)

# Iteration
for child in root:
    print child.tag, child.attrib
    
for child in root.iter(tag_name):
    print child.attrib

# Find elements
root.find(tag_name)  # find the FIRST child with the tag
root.findall(tag_name)  # find all direct children with the tag

```
