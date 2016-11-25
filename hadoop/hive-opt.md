:hive:

# Hive optimization

## Join optimization

### Common join and Map join 

Detail in https://cwiki.apache.org/confluence/display/Hive/MapJoinOptimization and https://cwiki.apache.org/confluence/display/Hive/LanguageManual+JoinOptimization

Given `table a join table b`, if `a` and `b` are both *large* tables, then _common join_ will be used, i.e. 

1. two `mappers`: sort the joint key of `a` and `b` respectively, and emit an intermediate table 
2. `reducer`: fed the intermediate table, do the join job 

The reducer phase requires a lot of memory. But if one of the table is a _small_ table that can be fitted in a `mapper`'s memory, then the best practise is to use *Map join*, i.e.

1. two `mappers`: fit the small table in the mapper, and finish the join job in the mappers. *NO* `reducers`. 

*Note*: 
The small table is fitted in the mapper as *hash table*, of which size will be larger than the actual size. The hash table is then compressed in a `tar` file and exported to HDFS, then propagated to each mappers that read the larger table.


Related options

- `hive.mapjoin.localtask.max.memory.usage`: the portion threshold of local task memory, default 0.9 
- `hive.auto.convert.join`: auto convert common join to map join. Caveat: the table size can only be perceived during run time. (Default `true` since Hive 0.11) 
- `hive.mapjoin.smalltable.filesize`: the size threshold of _small table_ (in Bytes), default 25MB 

    List the smaller table at the beginning in the join clause.
    
    
    
## Transform optimization


### Determine the split size

`actual_split_size = max (mapred.min.split.size, min (mapred.max.split.size, dfs.block.size))`

Hive不知道`dfs.block.size`的信息；可以通过`set mapred.[min|max].split.size;` 查询当前的设置。


### Avoid deadlock

Refer the [blog](http://www.cnblogs.com/yueweimian/p/4667888.html)

`set mapreduce.job.reduce.slowstart.completedmaps = 0.95`


