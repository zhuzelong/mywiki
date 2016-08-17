# Yarn Architecture

## Yarn Resource Management

An overview of Yarn resource management: https://www.mapr.com/blog/best-practices-yarn-resource-management


### File split size for mapper

`split_size = max(mapreduce.input.fileinputformat.split.minsize, min(mapreduce.input.fileinputformat.split.maxsize, dfs.block.size))`

