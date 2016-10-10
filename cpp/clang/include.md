:cpp:

# Include Directive

## Difference between '#include "file"' and '#include <file>'

Refer to the [Microsoft doc](https://msdn.microsoft.com/en-us/library/36k2cdd4.aspx). The detail varies based on compilers.


## Where to include files, '.h' or '.cpp'?

Short answer: include header files in `.cpp` if possible and only include files in `.h` if necessary (i.e. the header needs them).

Long answer: each `.cpp` file is a **compilation unit**, so all files included in `.cpp` will be included only when the source file is compiled. The files included in `.h` will be included everytime the source files that refer to the `.h` are compiled.
