:cpp:

# Memory management


## Automatic allocation

For **local variable** 
- allocated by system 
- reside in **stack** 
- reclaimed when function exits


## Dynamic allocation

- allocated by `new T` (return a pointer)
- reside in **heap**  
- reclaimed when program exits, or by `delete`


## Dynamic allocatin for array

For array  
- allocated by `new T[n]` (return a pointer `T*` pointing at the first element of the array)
- reside in **heap**
- reclaimed when program exits, or by `delete[] p` (use `delete[]`, not `delete`)

