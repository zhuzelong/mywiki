:cpp:

# Function 

## Argument via reference & pointer

> 调用函数时，会分配一块内存区(program stack)，用于存储函数参数、局部变量；函数退出时该内存会被释放。


### Reference vs Pointer in argument

> C++ 不允许改变reference代表的对象，即必须“从一而终”

```cpp
int ival = 100;
int jval = 1;
int &rval = ival;
rval = jval;  // Compilation error
```

> 除非要在函数内改变参数值，否则在传递**内置类型**时尽量不要pass by reference

- same: 传递的是对象的**地址**，而不是副本  
- diff: 
  1. 语法不同
  2. pointer可能不指向对象，必须先检查pointer非0；reference必然代表某个对象（在定义的时候），无需检查
  3. reference一定不等于0 (NULL)


## Scope

- local scope: 函数内可见 
- file scope / static extent: 从声明点至文件末可见

> 内置类型在file scope必定被默认初始化为0；在local scope不会被默认初始化
> *const object* 在文件外（cc或header)不可见，因此可以在多个文件内定义


### Local static object

```cpp
#include <vector>

vector<int> func(int size) {
    static vector<int> elements;  // 函数调用结束后，内存也不会被回收
    
    // Processing
    
    return elements;
}

```


## Default parameter

Rule:

1. default parameter从**最右边**的参数开始解析，因此第一个带default parameter的参数后的所有参数都必须指定default parameter
2. default parameter只能指定一次，在声明处/定义处。建议放在**声明处** (header)


## Inline function

```cpp
inline bool func() {
    // Body
}

```

1. `inline` 函数只是对编译器的请求，是否执行由编译器决定
2. 编译器将通过“复制代码”来展开函数，而不是“调用”函数，因此可以改善性能
3. 适合作为inline的函数：体积小、调用频率高、计算复杂度低


## Overloading

> Identical name & different parameter list (differ in parameter type or the number of parameters)

Return type 不能作为overloading的依据。



## Template function

```cpp
template <typename T [, T2]>
void func(const string &msg, const vector<T> &vec) {
    // Body
}

```

`typename`是关键字，用于标识“推迟决定”的数据类型.


## Function pointer

```cpp
// Declaration 
const vector<int> * (*func_ptr) (int);

// Invoke: identical to normal function
const vector<int> *p = func_ptr(size);

// Pass a function to a function pointer
// Just pass the function [name](name)
func_ptr = func;
```







----

# Memory management


## Automatic allocation

For **local variable** 
- allocated by system 
- reside in **stack** 
- reclaimed when function exits


## Dynamic allocation

- allocated by `new T` (return a pointer) 
- reside in **heap**  
- **NO default initialization**  
- reclaimed when program exits, or by `delete`


## Dynamic allocatin for array

For array  
- allocated by `new T[n]` (return a pointer `T*` pointing at the first element of the array)
- reside in **heap**
- **NO default initialization**  
- reclaimed when program exits, or by `delete[] p` (use `delete[]`, not `delete`)


*Memory leak*: forget to `delete` objects created by `new`.
