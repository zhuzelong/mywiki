:cpp:

# Class


## Components

1. declaration
2. body
3. member function
4. member variable
5. constructor
6. destructor

```cpp
// MyClass.h
class MyClass {  // declaration
public:
    bool func1();
    int func2();

private:
    int pvar;


}


// MyClass.cc
bool MyClass::func1() {}

bool MyClass:func2() {}

```

> Member functions defined/implemented in class body are **inline** function, so should be put in header file.


## Constructor

```cpp
// MyClass.h
class MyClass {
public:
    MyClass();  // default constructor
    MyClass(int a, int b);


// MyClass.cc
MyClass::MyClass(int a, int b): var1_(a), var2_(b) {}  // member initialization list


```

*member initialization list*: right after parameter list, delimited by `,`.


## Destructor

```cpp
// MyClass.h
class MyClass {
public:
    ~MyClass() {
        // release resources
    }

}
```

> No return value, no parameter, no overloading for destructor.
> Destructor is not necessary thus can omitted.



## Memberwise initialization and copy constructor

> If memberwise initialization will cause error, then implement a *copy constructor* and a *copy assignment constructor*.

Why copy constructor is needed:

```cpp
// Matrix.h
class Matrix {
public:
    Matrix(int row, int col): row_(row), col_(col);

private:
    double *pmat_;

}


// main.cc
Matrix mat1(4, 4);
Matrix mat2 = mat1;  // memberwise initialization

// destruct mat2
// access mat1.pmat_ will core!

```

The member variables in `mat1` is copied to `mat2` one by one, including the pointer, which points to the identical memory.


```cpp
Matrix::Matrix(const Matrix &src): row_(src.row_), col(src.col) {
    // Custom copy
}

```


## Const member function

> Compiler will validate if a `const function` does not modify an instance.
> The keyword `const` is right after the parameter list.
> A `const reference` can NOT call the non-const member function.


```cpp
class MyClass {
public:
    int size() const {return size_}  // inline function
    int func() const;

}


```


## Mutable member data

> The keyword `mutable` tells the compiler that the member data is not part of constant member, i.e. a const function can modify the mutable member data.


```cpp
class MyClass {
public:
    
private:
    mutable int max;
}

```

## `this` pointer

> The `this` pointer points to the function **caller**.
> Always check if two objects are identical in the `copy` function.


```cpp
MyClass& MyClass::copy(const MyClass &rhs) {
    if (this != &rhs) {
        this->var1_ = rhs.var1_;
    }

}
```


## Static class member


### Static member variable

> All instances shares the unique static class member.

- Use *class scope operator* to access static class member outside the class header.
- Access static member in member function as non-static member. 


```cpp
// MyClass.h
class MyClass {
public:

private:
    static vector<int> elements_;  // static member
    static const int size_ = 10;
}

// main.cc
vector<int> MyClass::elements_;

// MyClass.cc
MyClass::func() {
    int size = elements_.size();
}

```


### Static member function

> Static member function can only access static member variable.
> No `static` keyword in the cc file for the implementation.


```cpp
// MyClass.h
class MyClass {
public:
    static void func();
}


// MyClass.cc
void MyClass::func() {


// main.cc
MyClass::func();

}

```


## Overload operator

### Rules

1. No new operators
2. The operators `.`, `.*`, `::`, `?:` cannot be overloaded.
3. The number of operands cannot be modified.
4. The precedence of operators cannot be changed.
5. The parameter msut contains **at least* one class object.


`operator++`的前置式和后置式的实现类似，但后置式的参数列表为`(int )`（因为overload函数的参数列表不能一样），编译器会生成一个值为0的参数。


## Nested type

Typedef: `typedef <existing_type> <new_name>;`


```cpp
class Matrix {
public:
    typedef Matrix_iterator iterator  // nested type
    
    Matrix_iterator begin() const;
    Matrix_iterator end() const;
}


// main.cc
Matrix::iterator it = mat.begin();

```


## Friend

### Friend function

1. Friend funciton has the same privilege of member function.
2. Put `friend` before function prototype.
3. Declare `friend` in both classes.
4. `friend` is not limited by `public` and `private`.


```cpp
class A {
    friend int operator*(B &rhs);
}

class B {
    friend int operator*(B &rhs);
}

```


### Friend class

All member functions of `A` are friends of `B`.

```cpp
class A {
    friend class B;

}


```


## Pointer to member function

```cpp
void (MyClass::*func) (int) = 0;

// typedef member function pointer
typedef void (MyClass::*PtrType) (int);
PtrType pointer = 0;

```
