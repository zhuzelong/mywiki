:cpp:

# IO


## File IO

```cpp
#include <fstream>

int main() {
    ifstream infile("input_filename");
    ofstream outfile("output_filename");
    
    string s;
    
    while (getline(infile, s))
        outfile << s << std::endl;
    
    return 0;
}

```

Note: `ifstream` and `ofstream` expect a `char *filenam`, not a `string`. Use `string s; s.c_str();` if necessary.
