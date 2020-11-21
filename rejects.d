/// Ensure that an error is printed at call site if the sink doesn't match
struct Struct
{
    void toString (scope void delegate(in char[]) sink) const
        @safe(sink) pure(sink) nothrow(sink) @nogc(sink)
    {
        sink("Hello World");
    }

    void funcThrows (in char[]) const @safe pure /*nothrow*/ @nogc {}
    void funcAlloc  (in char[]) const @safe pure nothrow /*@nogc*/ {}
    void funcImpure (in char[]) const @safe /*pure*/ nothrow @nogc {}
    void funcSystem (in char[]) const /*@safe*/ @system pure nothrow @nogc {}

    alias 타이프 = char[];
    void 귄자나요 (in 타이프 data) @nogc nothrow
    {
        const 렌스 = cast(int) data.length;
        printf("Chunk: %.*s\n", 렌스, data.ptr);
    }
}

void sinkNotNoGC () @safe pure nothrow @nogc
{
    Struct s1;
    s1.toString(&s1.funcAlloc);
}


void sinkNotNothrow () @safe pure nothrow @nogc
{
    Struct s1;
    s1.toString(&s1.funcThrows);
}

void sinkNotPure () @safe pure nothrow @nogc
{
    Struct s1;
    s1.toString(&s1.funcImpure);
}

void sinkNotSafe () @safe pure nothrow @nogc
{
    Struct s1;
    s1.toString(&s1.funcSystem);
}
