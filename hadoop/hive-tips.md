# Hive Cookbook


## Random sampling 

The `limit` clause is fake random. Use the statements below.

```sql
select * from mytbl
distribute by rand()
sort by rand()
limit 100;
```


Alternatively, if the total size of the table is known in advance, doing some filtering in the mappers would boost the performance.

```sql
select * from mytbl
where rand() <= 0.001
distribute by rand()
sort by rand()
limit 100;
```
