:cpp:

# Template function


## Definition

```cpp
template <class T1, class T2, ...>
T func(vector<T> v) {
    typedef typename vector<T>::size_type vec_sz;

}


template <typename T1, typename T2>
func(T element) {

}

```

The type `T` is determinded during compilation.



----
# Template class

## Definition

```cpp
template <typename T>
class MyClass {
public:
    void func(T object);

private:
    T val_;

```


## Where to initialize a class

Refer to "Essential C++" P174

init list vs init in constructor:  
- init list: copy constructor
- init in constructor: default constructor + copy assignment

Always prefer init list.
