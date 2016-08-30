# C++ Containers


## Map

### Caveats

1. 访问map中不存在的元素将创建一个元素并自动初始化，因此使用`it = m.find(k)`返回的迭代器访问元素





## Iterator


### Types

> Each type of containers correspond a set of operations.

1. sequence read-only: `++, ==, !=, *` 
2. sequence write-only:
    - 不能在两次赋值运算之间执行2次或以上的`++it` 
    - 不能对同一元素多次赋值 
3. sequence read-write: 正向迭代器（不会访问、处理同一个元素两次） 
4. reverse iterator: 正向迭代器 + `--it, it--`
