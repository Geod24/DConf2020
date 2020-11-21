import std.format;
import std.stdio;

struct Struct
{
    void toString (scope void delegate(in char[]) sink) const
        @safe(sink) pure(sink) nothrow(sink) @nogc(sink)
    {
        sink(this.value);
    }

    string value = "Hello";
}

struct Printer
{
    void print (in char[] data) nothrow @nogc
    {
        printf("Chunk: %.*s\n", cast(int) data.length, data.ptr);
    }
}

// A simple test, with all attributes
void main () nothrow @nogc
{
    Struct s;
    Printer p;
    s.toString(&p.print);
}
