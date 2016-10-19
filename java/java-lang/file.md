# File

## java.nio (since Java 4)

`java.nio` was introduced in Java4, `java.nio.2` was introduced in Java7. The differences can be found [here](http://stackoverflow.com/questions/25537675/java-what-exactly-is-the-difference-between-nio-and-nio-2)


### Path class

```java
import java.nio.file.Path;
import java.nio.file.Paths;

// Create a path
Path p1 = Paths.get("/home/user");
Path p2 = Paths.get(URI.create("file:///home/user/test.txt"));
Path p3 = Paths.get("/home/user", "files", "test.txt");  // access '/home/user/files/test.txt'

// Join path
Path p4 = Paths.get("/home/user/dir1");
p4.resolve("test.txt");  // access '/home/user/dir1/test.txt'

```

### Files class

- The `java.nio.file.Files` class provides a set of static methods for manipulating files.
- The methods of `java.nio.file.Files` expect `java.nio.file.Path` arguments.



### try-with-resource

```java
// One resource
try (BufferedReader br = new BufferedReader(new FileReader(path))) {
    // processing
} catch {}

// Multiple resources

try (
    BufferedReader br1 = new BufferedReader(new FileReader(path1);
    BufferedReader br2 = new BufferedReader(new FileReader(path2)
    ) {
    // processing
} catch {}

```


