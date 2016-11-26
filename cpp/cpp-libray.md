# C++ third libraries 

- [[libraries/glog|GLOG]]



# C++ profiler

## Valgrind

Toolkit: valgrind + gprof2dot.py + graphviz

Valgrind把程序运行自己创建的虚拟CPU上，采集信息

- pro: 无需修改编译选项，任何C++程序都可以直接profile
- con: 程序的运行速度下降10-50倍


### Installation

- valgrind: `brew install valgrind` or refer to the [blog](http://blog.csdn.net/ljxfblog/article/details/39209645) for installation from binary
- gprof2dot.py: `pip install gprof2dot`
- graphviz: `brew install graphviz`


### Profile

```bash
# Run program
cat input.txt | valgrind --tool=callgrind ./run_runner -c nlp.conf > result.txt

# Analyze and visualize the callgrind result
gprof2dot -f callgrind [-n 0 -e 0] callgrind.out.pid | dot -Tpng -o grind.png
```
