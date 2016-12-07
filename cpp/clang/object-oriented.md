:cpp:

# Inheritance & polymorphism

inheritance: 组织“类”的数据(data member)和行为(function member)
polymorphism: 调用接口时只操作一个个体，而非独立的类 (via pointer/reference to Abstract Base Class)

> 只有ABC的pointer和reference才可以支持object-oriented，因为pointer和reference指向内存地址，可以指向完整的派生类对象；而ABC的对象是内存空间，只能容纳ABC的member，派生类的member被slice off。


----
# Dynamic binding

> 在**运行时**而非**编译时**决定执行哪个类的函数

> function member默认在编译时解析，如果要强制在运行时解析，加`virtual`关键字


----
# Abstract Base Class (ABC)

## Steps

1. 抽象所有子类共通的操作行为，放入ABC的function member
2. 抽象所有子类共通的数据，放入ABC的data member
3. 判断哪些行为与具体的类型相关，设为`virtual`进行动态绑定
4. 设定access level


## Virtual function

### Rule

> 虚函数必须有实现，纯虚函数没有实现。任何类如果有一个或多个纯虚函数，无法实例化。

> 如果一个类有一个或多个虚函数，则必须把destructor声明为virtual，并提供空实现。**不要把destructor声明为纯虚函数**。

```cpp

// virutal function 
virutal int func1(int pos);

// pure virtual function
virtual int func2(int pos) const = 0;
```

ABC的纯虚函数在派生类中会自动成为虚函数，在派生类中不用加关键字`virtual`; 在cc中实现虚函数，不用写关键字`virtual`。


### Resolution

1. 基类的constructor和destructor不会调用派生类的虚函数 
2. 基类的对象(非pointer, reference）无法调用派生类的函数


----
# Derived class

## Inheritance

Derived class comprises:  
- ABC subobject: non static data member of ABC
- non static data member of derived class

ABC的pointer和reference无法访问派生类自定义的函数


## Scope

If function/data member has the same name in derived class and ABC, the one in derived class overrides that of ABC. Calling such members would always call the derived ones.

```cpp
// In derived class
bool Derived::func(int pos) const {
    // Explicit call ABC member via scope operator
    ABC::func(pos);
    
}

```

> 不要在派生类中定义同名的non-virtual函数


## Initialize & destruct & copy

派生类的初始化：  
1. 调用ABC的constructor
2. 调用自己的constructor

```cpp
// Call base constructor in the constructor
Derived::Derived(int len, int pos): ABC(len, pos, elems_) {}

```


----
# Runtime type identification

```cpp
#include <typeinfo>

const char* Base::whoami() const {
    return typeid(*this).name();  // typeid() return type_info
}

```

指向基类的pointer或reference无法知道指向对象的实际类型，只能转换指针类型。

```cpp
// 无条件转换
if (typeid(*ps) == typeid(Derived)) 
    Derived *pd = static_cast<Derived*>(ps);
    
// 条件转换
Derived *pd = dynamic_cast<Derived*>(ps);  // return true or false


```

