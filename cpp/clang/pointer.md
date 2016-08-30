:clang:

# Pointer and Array


## Function pointer

> A function can only be invoked or referenced.

> A function is NOT an object in C++.

```cpp
int (*fp)(int);  // Declare a function pointer fp

// Equivalent assignment
fp = &func;
fp = func;

// Equivalent calling
int i = 0;
fp(i);
(*fp)(i);


```


## Array

```cpp
// Init
const int lengths[] = {1, 2, 3, 4, 5};

```

