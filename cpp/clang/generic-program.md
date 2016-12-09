:cpp:

# Generic Style

> STL (Standard Template Library) comprises: container & generic algorithm.


## Containers

1. sequential: vector, list
2. associative: map, set

> vector可以为空，但array不能为空

### Common operators

- `==` : equality, return `true` or `false`
- `=` : assignment, 复制容器的内容
- `empty()` : return `true` or `false`
- `size()` : 返回容器的元素个数
- `clear()` : 删除容器内的所有元素
- `begin()`
- `end()`
- `insert()` : 插入单一/范围内的元素
- `erase()` : 删除单一/范围内的元素


## Generic algorithm

- 与操作对象的数据类型无关：via function template
- 与容器类型无关：不对容器本身进行操作，而是通过一对iterator


----
# Iterator

> iterator是泛型**指针**，是对底层指针的抽象，用于实现对所有泛型容器的迭代（因此不用对每一类容器实现不同的迭代算法）

Iterator的基本操作

```cpp
for (iter = container.begin(); iter != container.end(); ++iter) {
    cout << *iter << std::endl;
}

// 倒序访问
for (vector<T>::reverse_iterator it = vec.rbegin(); it != vec.rend(); ++it) {
    cout << *it << std::endl;
}
```

- `begin()`返回容器第一个元素的指针, `rbegin()`返回倒序的第一个元素 
- `end()`返回容器最后一个元素的**下一个**位置的指针，只能用于比较位置，不能使用内容
- 顺序访问使用`iterator`或`const_iterator`，倒序访问必须用`reverse_iterator`


----
# Containers

## Sequential containers

1. vector: 随机访问快，随机增删慢
2. list: 双向linked list
3. deque: 类似vector，对头部增加、尾部删除进行了优化

### Initialization

```cpp
#include <vector>
#include <list>
#include <deque>

// 1. Empty 
list<string> slist;
vector<int> ivec;

// 2. Fixed-length, all elements are default initialized
list<string> slist(100);
vector<int> ivec(32);

// 3. Fixed-length with initial values
list<string> slist(100, "foo bar");
vector<int> ivec(32, 1);

// 4. From iterators
int numbers[8] = {1, 2, 3, 4, 5, 6, 7, 8};
vector<int> nums(numbers, numbers+8);  // the "last" pointer is not included

// 5. From another container
list<string> slist;
// Fill slist
list<string> slist2(slist);

```


### Access

- insert: `push_back()`, `push_front()` (not for vector)
- delete: `pop_back()`, `pop_front()` (not for vector)
- read: `front()`, `back()`



## Associative containers

> Key is unique in a map. Use `multimap` if duplicate keys is necessary.
> Key is unique in a set. Use `multiset` if duplicate keys is necessary.

- set默认按升序排序
- 用generic algorithm进行set的操作

```cpp
#include <map>
#include <set>

// Find if key is in a map/set

map<string, int> words;
set<string> wset;

// 1. find
if (words.find("key") != words.end())
if(wset.find("key") != wset.end())

// 2. count
if (words.count("key") > 0)
if (wset.count("key") > 0)


```






----
# Generic algorithms

> `#include <algorithm>`


## Function object

> *function object*: an instance of algorithm Class that overload operator `()`.

```cpp
#include <functional>

// 1. arithmetic
plus<T>
minus<T>
negate<T>
multiplies<T>
divides<T>
modules<T>

// 2. relational
less<T>
less_equal<T>
greater<T>
greater_equal<T>
equal_to<T>
not_equal_to<T>

// 3. logical
logical_and<T>
logical_or<T>
logical_not<T>

```


## Iterator inserter

1. back_inserter: 用参数容器的`push_back()`替代`=`
2. inserter: 用参数容器的`insert()`替代`=`
3. front_inserter: 用参数容器的`push_front()`替代`=`


```cpp
#include<iterator>
#include<algorithm>

vector<int> result;
unique_copy(ivec.begin(), ivec.end(), back_inserter(result));
unique_copy(ivec.begin(), ivec.end(), inserter(result, result.end());
unique_copy(ivec.begin(), ivec.end(), front_inserter(result));
```

## iostream iterator

```cpp
/* 从文件读入字符串到vector */

#include <algorithm>
#include <vector>
#include <string>
#include <iostream>
#include <fstream>
#include <iterator>

int main() {
    ifstream infile("in.txt");
    ofstream outfile("out.txt");
    
    istream_iterator<string> is(infile);
    istream_iterator<string> eof;
    
    vector<string> text;
    
    // 读取，排序
    copy(is, eof, back_inserter(text));
    sort(text.begin(), text.end());
    
    // 输出
    ostream_iterator<string> os(outfile, " ");
    copy(text.begin(), text.end(), os);

}

```
