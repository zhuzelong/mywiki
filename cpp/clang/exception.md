:cpp:

# Try-catch

> `throw`的内容是一个对象，可以是`int`, `string`或自定义的exception class

如果异常发生点不在try block内，则会终止（terminate）**当前函数**，返回caller寻找try block；如果最顶层的caller也没有try block，则终止整个程序。

catch block可以把exception再次抛出：

```cpp
int func() {
    try {
        // process
    }
    catch (exception) {
        throw;  // Re-throw the catched exception
    }
    catch (...) {
    }  // catch all types of exceptions
}
```

# Local resource management

> 在初始化constructor阶段申请资源；在destructor释放资源。C++会在异常发生并终止函数之前，调用所有local variable的destructor。


# Standard exception

```cpp
#include <exception>

exception e;  // "exception" is the base class
e.what()  // print out the message, return const char*

```
