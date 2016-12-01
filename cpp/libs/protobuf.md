:cpp:

# Format

```
package tutorial;  // all classes in the .proto will be put in the namespace

message Person {
    required string name = 1;
    required int id = 2;
    optional string email = 3;
    
    enum PhoneType {
        mobile = 0;
        home = 1;
        work = 2;
    }
    
    message PhoneNumber {
        required string number = 1;
        optional PhoneType type = 2 [default = home];
    }
    
    repeated PhoneNumber phone = 4;
}

message AddressBook {
    repeated Person person = 1;
}

```

- A `message` can be defined in another `message`.
- A `message` can contain another `message` as fileds.
- The markers (`1, 2, 3, 4`) identify the unique tag of the fields in the binary encoding. Markers 1 - 15 entail less bytes to encode, so put common fields in these markers.
- Each `repeated` field requires re-encoding in the tag number.
- NO "class inheritance"

For C++, a `.h` and `.cc` file is generated for each `.proto` file.

## Modifier

`required`, `optional`, `repeated`

> `required` is forever. Once a field is set `required`, it can not be changed to `optional` or `repeated`. `required` is usually more harm than good.

Default values will be used if an `optional` field is not set.

`repeated` fields can repeat any number of times (including 0), as a dynamic array.


## Data types

Refer to [doc](https://developers.google.com/protocol-buffers/docs/proto#scalar)


----
# Compile


`protoc -I=$SRC --cpp_out=$DST $SRC/item.proto`

The `--cpp_out` is used for specify output C++.

The `item.pb.h` and `item.pb.cc` will be generated.


----
# API


## Get

```
// For the singular field "name"
inline bool has_name() const;  // checks if the field has been set
inline const std::string& name() const;  // return a const reference

// For the repeated field "phone"
inline int phone_size() const;
inline const google::protobuf::RepeatedPtrField<tutorial::Person_PhoneNumber>& phone() const;

inline const tutorial::Person::PhoneNumber& phone(int index)[ ]( )const;

// For enum
Person::PhoneNumber {
    Person::MOBILE,
    Person::HOME,
    Person::WORK
}

```

## Set

```
// For the field "name"
inline void clear_name();  // back to empty state
inline void set_name(const std::string& value);
inline void set_name(const char* value);
inline std::string* mutable_name();  // return a pointer

// For the repeated field "phone"
inline void clear_phone();
inline google::protobuf::RepeatedPtrField<tutorial::Person::PhoneNumber>* mutable_phone();
inline tutorial::Person::PhoneNumber* mutable_phone(int index);  // update an existing value at the specified index
inline tutorial::Person::PhoneNumber* add_phone();  // no argument, use the returned pointer to set new data

```

## Message methods

```
bool IsInitialized() const;  // checks if all required fields have been set

string DebugString() const;  // returns a human-readable string

void CopyFrom(const Person& from);  // overwrites the messsage

void Clear();  // set all fields to empty state
```


----
# Extend protocol buffer

- Must not change the markers of any existing fields
- Must not add nor delete any `required` fields
- Can delete `optional` and `repeated` fields
- Can add `optional` or `repeated` fields with fresh markers (not even the markers of deleted fields)


----
# Optimization

- Reuse message if possible
- Try using Google's tcmalloc

