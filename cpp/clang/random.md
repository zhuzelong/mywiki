# Random generation in C++

## Random function

Included in `<cstdlib>`, the `rand()` function takes no arguments and returns an **integer** within `[0, RAND_MAX)`.


## Bad practice

```cpp
#include <random>

int r = rand() % n;

```

1. When `n` is small (e.g. `n = 2`), the remainder is NOT random.
2. When `n` is large, the probability of some remainders are larger than the others, e.g. `n = 20000` and `RAND_MAX = 32767`, then `10000 % n and 30000 % n` both raise `10000`, but only `15000 % n` raise `15000`.


## Good practice

```cpp
int nrand(int n) {
    if (n <= 0 || n > RAND_MAX) 
        throw domain_error("n is out of range.");
    
    const int bucket_size = RAND_MAX / n;
    int r;
    
    do
        r = rand() / bucket_size;
    while (r >= n);
    
    return r;
}
```
