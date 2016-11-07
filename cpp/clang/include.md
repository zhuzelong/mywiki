:cpp:

# Include Directive

Refer to this [tutorial](http://www.cplusplus.com/forum/articles/10627/).


# Difference between '#include "file"' and '#include <file>'

Refer to the [Microsoft doc](https://msdn.microsoft.com/en-us/library/36k2cdd4.aspx). The detail varies based on compilers.


# Where to include files, '.h' or '.cpp'?

Short answer: include header files in `.cpp` if possible and only include files in `.h` if necessary (i.e. the header needs them).

Long answer: each `.cpp` file is a **compilation unit**, so all files included in `.cpp` will be included only when the source file is compiled. The files included in `.h` will be included everytime the source files that refer to the `.h` are compiled.

> 函数的定义在整个程序中只能出现一次，在cc文件内；但可以被声明多次。
> inline函数必须在header内定义。



# Right way to include

If class `A` uses class `B`, then `B` is `A`'s dependency.

> Do NOT `#include` unless it is necessary.

## Do nothing

1. If `A` makes no reference to `B`
2. If the only reference to B is a friend declaration


## Forward declare B

1. If `A` contains a pointer or reference to `B`
2. If one or more functions has `B` object/pointer/reference as parameters / return type


## Include B's header

1. If `B` is a parent class of `A`
2. If `A` contains a `B` object


## Example header

```cpp
// myclass.h
// include guard
#ifndef __MYCLASS_H_INCLUDED__
#define __MYCLASS_H_INCLUDED__

//=================================
// forward declared dependencies
class Foo;
class Bar;

//=================================
// included dependencies
#include <vector>
#include "parent.h"

//=================================
// the actual class
class MyClass : public Parent  // Parent object, so #include "parent.h"
{
public:
  std::vector<int> avector;    // vector object, so #include <vector>
  Foo* foo;                    // Foo pointer, so forward declare Foo
  void Func(Bar& bar);         // Bar reference, so forward declare Bar

  friend class MyFriend;       // friend declaration is not a dependency
                               //   don't do anything about MyFriend
};

#endif // __MYCLASS_H_INCLUDED__ 

```
