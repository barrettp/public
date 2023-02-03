### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 97339d68-a310-11ed-0c4c-7dd426dd4301
using PlutoUI; PlutoUI.TableOfContents()

# ╔═╡ 93a598ab-b722-40f0-bd58-f536c9bf859e
using Measurements

# ╔═╡ e87a112b-8743-4c7c-950d-c9b19a2f2dab
using Unitful

# ╔═╡ 54dca801-a079-4e79-a9f2-677b7067fd22
using PythonCall

# ╔═╡ 8fed09a1-9575-497e-859a-5d39158af649
using BenchmarkTools

# ╔═╡ 367d07de-ec8e-4c75-ad6a-c37fc5477094


# ╔═╡ 62aed81e-12d5-4b91-9a9e-f8866af1e3d7
md"""
## Running Julia
"""

# ╔═╡ dd8ca693-30e4-4d5e-9927-608b86162230
md"""
**===================================================================================**

### Starting Julia

Enter `julia` at the terminal prompt. Set the number of threads to `auto`. Threads will be discussed later in Parallel Computing.

    > julia --threads=auto
    
                   _
       _       _ _(_)_     |  Documentation: https://docs.julialang.org
      (_)     | (_) (_)    |
       _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.    
      | | | | | | |/ _` |  |
      | | |_| | | | (_| |  |  Version 1.7.3 (2022-05-06)
     _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
    |__/                   |
    
    julia>

!!! tip

    The command line option "-q" can be used to remove the start-up banner.
"""

# ╔═╡ 72dbc6c2-22e9-485f-ae40-1ff008cee3b3
md"""
**===================================================================================**

### Stopping Julia

To exit Julia, enter `<Ctl-D>` or `exit()`

```julia
julia> <Ctl-D>
```

!!! tip
    Don't do this now!

"""

# ╔═╡ 5d2679d7-fd7c-4ee2-a83e-3120f8df286e
md"""
**===================================================================================**

### The command line  or  REPL (Read-Eval-Print-Loop)

Our first command:

```julia
println("Hello World")
```
"""

# ╔═╡ 700513c1-f8eb-46da-b0e3-10e4a888afd6
println("Hello World")

# ╔═╡ d0f131ef-555b-4dee-a591-617ce36395d5
md"""
!!! note
    Unlike Jupyter and the REPL, Pluto prints the result above the line, not below.

Our first calculation

```julia
a = 4
```
"""

# ╔═╡ 1ae81446-759e-4a52-b51e-2f7cc96f5472
a = 4

# ╔═╡ 33e3d1b2-851b-47cc-855c-0eda2be59cb1
md"""
```julia
b = 2
```
"""

# ╔═╡ e7f21345-6f45-44c8-801a-140b680ca676
b = 2

# ╔═╡ 9aeaff07-9997-4b7d-92ba-a9005158bb5f
md"""
```julia
a + b
```
"""

# ╔═╡ 412e3233-f7c1-4e4a-a2af-198fd2ade430
a + b

# ╔═╡ 22fe494f-af4a-4d67-8d47-81292ac4e56e
md"""
**===================================================================================**

### Other REPL Modes

#### Help, '?'
For help mode,

    julia> ?
    help?> println
    search: println printstyled print sprint isprint

    println([io::IO], xs...)
    
    Print (using print) xs to io followed by a newline. If io is not supplied, prints to the default output stream stdout.
    
    See also printstyled to add colors etc
    
    Examples
    ≡≡≡≡≡≡≡≡≡≡
    
    julia> println("Hello, world")
    Hello, world
    
    julia> io = IOBuffer();
    
    julia> println(io, "Hello", ',', " world.")
    
    julia> String(take!(io))
    "Hello, world.\n"

Enter 'delete' or 'backspace' to exit help
"""

# ╔═╡ 00e8c94b-6fcf-41aa-8aa9-338b4a14aeb5


# ╔═╡ 3748c949-e09b-4cf1-9dbf-1154a871d671
md"""
#### Shell, ';'

For shell mode,

```julia
julia> ;
shell> pwd
/Users/myhomedir
```

Enter 'delete' or 'backspace' to exit shell
"""


# ╔═╡ 0a9bf528-912d-4782-928c-5107bd3ac0ba
; ls

# ╔═╡ ffd301ba-9af1-4e64-a8bf-cd7dcceaede8
md"""
## Package Manager, `]`

```julia
julia> ]
pkg> 
```

For package manager help,

```julia
pkg> ? `return`
```

Returns a brief summary of package commands

To add a package,

```julia
pkg> add <package>
pkg> add <package1>, <package2>
```

When adding a package, the Julia on-line repository will be searched. The package and its dependencies will then be downloaded, compiled, and installed. This may take anywhere from a few seconds to a few minutes depending on the size of the package and its dependencies.

To use or load a package (after it has been added),

```julia
using <package>
using <package1>, <package2>
```

A feature of the 'using' command is that it will add the package, if it hasn't alaredy been added.

The Measurements package enables variables to have both values and errors.
Let's add the Measurements package using the `using` statement.
"""


# ╔═╡ 6af4d494-cf25-4acc-ba93-37afa65ccd69
md"""
To check the manifest:

```julia
pkg> status
```

or
```julia
pkg> st
```
"""

# ╔═╡ 2a688d2c-d4a9-4018-947d-8547acedd11c
md"""
To update a package in the manifest:

```julia
pkg> update <package>
```

or

```julia
pkg> up <package>
```

To update all packages in the manifest,

```julia
pkg> up
```

To garbage collect packages not used for a significant time,

```julia
pkg> gc
```

**===================================================================================**

## Composability

Let's do some more calculations.

```julia
m1 = measurement(4.5, 0.1)
```

"""

# ╔═╡ 0a4f1f80-521b-421d-844d-3f4e8c071db4
m1 = measurement(4.5, 0.1)

# ╔═╡ 40b0c3a6-7091-49dd-bc45-394af1fe933d
md"""Typing 'measurements' is rather awkward. There must be a better way. How about the following?

```julia
m2 = 15 ± 0.3
```

where the plus-minus character is entered using LaTex syntax followed by tab, i.e., \pm<tab>.
"""

# ╔═╡ 79f16ae3-d4df-4fe3-ab56-fcfe340b7e7c
m2 = 15 ± 0.3

# ╔═╡ 6c7faa97-1f9f-4604-90cd-94a0bef55ce4
md"""
One of the features of Julia is that it understands unicode. For example, expressions in a printed document that contain greek characters can be entered as greek characters in your code. Let's calculate the following expression.

```julia
α = m1 + m2
```
"""

# ╔═╡ 82375bad-7883-4db4-8693-401b8925d90f
α = m1 + m2

# ╔═╡ b625dc4a-4267-4716-9d90-cf7579ff8669
md"""
!!! note

    Notice that the error of the result α has been propogated correctly.

Let's add another package called Unitful, which enables attaching units to variables.
"""

# ╔═╡ 3b7d830b-fc62-4786-8ac3-90be3a0fe665
md"""
Now let's create two new values m3 and m4 with units attached, and then multiply them together to create a third variable β.

```julia
    m3 = (32 ± 0.1)u"m/s"
    m4 = (9.8 ± 0.3)u"s"
    β = m3 * m
```
"""

# ╔═╡ 79b291a1-4a44-4431-bb6f-74f8b215f897
m3 = (32 ± 0.1)u"m/s"

# ╔═╡ 7efdf535-2135-4c69-85cb-d2614903d4fd
m4 = (9.8 ± 0.3)u"s"

# ╔═╡ 6e9f75ea-f009-4c05-bf03-fd6c66214ce9
β = m3 * m4

# ╔═╡ c5f5fdbc-3439-4c99-843d-5ef6dc3c59b7
md"""
The variable β's value now has an associated error and unit.

Let's see if this works with one dimensional arrays or vectors.

```julia
γ = [10 ± 0.1, 20 ± 0.2, 30 ± 0.3]u"m/s" .* [15 ± 0.01, 25 ± 0.02, 25 ± 0.03]u"s"
```

Note the dot '.' before the multiplication character '*'. This means element-wise multiplication.
"""

# ╔═╡ ad6b69da-d37c-4e3e-9f0f-186f8b6d3b00
γ = [10 ± 0.1, 20 ± 0.2, 30 ± 0.3]u"m/s" .* [15 ± 0.01, 25 ± 0.02, 25 ± 0.03]u"s"

# ╔═╡ 12061b16-9c5c-475a-bf87-82f8e9d167eb
md"""
!!! note

    What have we learned about the Julia command line and features?

    * Julia has four command line modes: **REPL**, **help**, **shell**, and **package manager**. 

    * Julia understands **unicode**.

    * Julia packages are **composable**. It means that independent packages are compatible and work together without modification, as demonstrated by the Measurements and Unitful packages. 
"""

# ╔═╡ b94b3f48-80c2-44b3-ba5d-896913ee7bb5
md"""
**===================================================================================**

## Interoperability

**Calling Python from Julia**

Julia has two packages for calling Python code from Julia: PyCall & PythonCall. PyCall has an easier learning curve, but has a few limitations. Whereas, PythonCall has better performance, because it is more complete and allows for more control.

Both packages have symmetric interfaces, so the user can call Python from Julia and Julia from Python. This session will only focus on calling Python from Julia.

```julia
using PythonCall
```
"""

# ╔═╡ 4426caeb-9b03-4a9a-8e7d-5c8cc9303b59
md"""
By default importing the module will initialize a conda environment in your Julia environment, install Python into it, load the corresponding Python library, and initialize an interpreter.

Here is an example using Python's "re" module. Because `PyCall` and `PythonCall` both define pyimport, this example must qualify which one we are using, namely PythonCall's `pyimport`.

```julia
let
    re = PythonCall.pyimport("re")
    words = re.findall("[a-zA-Z]+", "PythonCall.jl is great")
    sentence = Py(" ").join(words)
    pyconvert(String, sentence)  # convert Python string to Julia string
end
```
Try it.
"""

# ╔═╡ 3f058e45-d5f1-4f8c-a56a-a3de4d65f68d
let
    re = PythonCall.pyimport("re")
    words = re.findall("[a-zA-Z]+", "PythonCall.jl is great")
    sentence = Py(" ").join(words)
    pyconvert(String, sentence)  # convert Python string to Julia string
end

# ╔═╡ 84593e6e-5a29-435a-850e-13475e38bf53
md"""
**Wrapper Types**

A wrapper is a Julia type that wraps a Python object, but gives it Julia semantics. For example, the PyList type wraps Python's list object. 

```julia
let
    x = pylist([3,4,5])
    y = PyList{Union{Nothing, Int64}}(x)
    push!(y, nothing)
    append!(y, 1:2)
    x
end
```

Try it.
"""

# ╔═╡ 80563da7-d13c-499f-aade-c2423338eebf
let
    x = pylist([3,4,5])
    y = PyList{Union{Nothing, Int64}}(x)
    push!(y, nothing)
    append!(y, 1:2)
    x
end

# ╔═╡ 6bfc1a81-d594-4a7a-9b59-b85e089d8e8a
md"""
There are wrappers for other container types, such as PyDict and PySet.

```julia
let
    x = PythonCall.pyimport("array").array("i", [3,4,5])
    y = PythonCall.PyArray(x)
    println(sum(y))
    y[1] = 0
    x
end
```

Try this example too.
"""

# ╔═╡ cecec5b2-fc47-4a50-8b29-c613828802ec
let
    x = PythonCall.pyimport("array").array("i", [3,4,5])
    y = PythonCall.PyArray(x)
    println(sum(y))
    y[1] = 0
    x
end

# ╔═╡ baa960f9-58e7-4f50-9de0-34ad663b43fb
md"""
PyArray directly wraps the underlying data buffer, so array operations such as indexing are about as fast as an ordinary Array.

#### Installing Python packages

Assuming you are using `CondaPkg.jl`, PythonCall uses it to automatically install any Python packages. For example,

```julia
using CondaPkg
# enter package manager
conda add some_package
```
"""

# ╔═╡ cc45c201-1819-472f-99ff-d51143d3440c
md"""
**===================================================================================**

## Optimization and Macros

Julia is a high-performance language. However, like any computer language, certain constructs are faster and will better take adva
ntage of your computer's resources. This tutorial will overview how you can use Julia and some of its unique features to enable bl
azing-fast performance.

However, to achieve good performance, there are a couple of things to keep in mind.

```julia
using BenchmarkTools
```    
"""

# ╔═╡ 6aad639a-f7da-4ffb-b68a-53a53b9fe22b
md"""

**Global Variables and Type Instabilities**

First global variables in Julia are almost always a bad idea. First, from a coding standpoint, they are very hard to reason about since they could change at any moment. However, for Julia, they are also a performance bottleneck. Let's consider a simple function that updates a global array to demonstrate the issue.

```julia
begin
    gl = rand(1000)

    function global_update()
        for i in eachindex(gl)
            gl[i] += 1
        end
    end
end
```
"""

# ╔═╡ 88ae8198-b1aa-4838-a619-1ee926973239
begin
    gl = rand(1000)

    function global_update()
        for i in eachindex(gl)
            gl[i] += 1
        end
    end
end

# ╔═╡ 9296b12e-74aa-4a14-bcfe-612368916919
md"""
Now let's check the performance of this function. To do this, we will use the excellent benchmarking package [`BenchmarTools.jl`](https://github.com/JuliaCI/BenchmarkTools.jl) and the macro `@benchmark`, which runs the function multiple times and outputs a histogram of the time it took to execute the function

```julia-repl
julia> @benchmark global_update()

BenchmarkTools.Trial: 10000 samples with 1 evaluation.
 Range (min … max):   96.743 μs …   8.838 ms  ┊ GC (min … max): 0.00% … 97.79%
 Time  (median):     105.987 μs               ┊ GC (median):    0.00%
 Time  (mean ± σ):   123.252 μs ± 227.353 μs  ┊ GC (mean ± σ):  5.14% ±  2.76%

  ▄█▇█▇▅▄▃▄▅▃▂▃▅▆▅▅▄▃▃▂▂▂ ▁▁▁          ▁  ▁                     ▂
  ████████████████████████████▇██▇▇██▇███████▇▇█▇▇█▇▇▇▇▆▇▇▆▆▅▆▅ █
  96.7 μs       Histogram: log(frequency) by time        211 μs <

 Memory estimate: 77.77 KiB, allocs estimate: 3978.
```

!!! note

    This was run on a Intel Core i7 i7-1185G7 processors so your benchmarks may differ.

Try this benchmark
"""

# ╔═╡ 939909cc-adc4-46bf-ab09-6f70fcb7c9ed
@benchmark global_update()

# ╔═╡ 21a75052-236a-4899-b48c-c9e12298f3d9
md"""
Looking at the histogram, we see that the minimum time is 122 μs to update a vector! We can get an idea of why this is happening by looking at the total number of allocations we made while updating the vector. Since we are updating the array in place, there should be no allocations. 

To see what is happening here, Julia provides several code introspection tools.
Here we will use `@code_warntype`
```julia
@code_warntype global_update()
```
"""

# ╔═╡ a0b57cff-1cf2-4c40-a59b-e7e1d351870c
@code_warntype global_update()

# ╔═╡ b4cab1ca-bfe4-442b-94b6-f7271ce19f45
md"""
which should give the following output


```julia
MethodInstance for Main.var"workspace#12".global_update()
  from global_update() in Main.var"workspace#12"
Arguments
  #self#::Core.Const(Main.var"workspace#12".global_update)
Locals
  @_2::Any
  i::Any
Body::Nothing
1 ─ %1  = Main.var"workspace#12".eachindex(Main.var"workspace#12".gl)::Any
│         (@_2 = Base.iterate(%1))
│   %3  = (@_2 === nothing)::Bool
│   %4  = Base.not_int(%3)::Bool
└──       goto #4 if not %4
2 ┄ %6  = @_2::Any
│         (i = Core.getfield(%6, 1))
│   %8  = Core.getfield(%6, 2)::Any
│   %9  = Base.getindex(Main.var"workspace#12".gl, i)::Any
│   %10 = (%9 + 1)::Any
│         Base.setindex!(Main.var"workspace#12".gl, %10, i)
│         (@_2 = Base.iterate(%1, %8))
│   %13 = (@_2 === nothing)::Bool
│   %14 = Base.not_int(%13)::Bool
└──       goto #4 if not %14
3 ─       goto #2
4 ┄       return nothing
```

`@code_warntype` tells us where the Julia compiler could not infer the variable type. If this happens, Julia cannot efficiently compile the function, and we end up with performance comparable to Python. The above example highlights the type instabilities in red and denotes accessing the global variable `gl`. These globals are a problem for Julia because their type could change anytime. As a result, Julia defaults to leaving the type to be the `Any` type.

Typically the standard way to fix this issue is to pass the offending variable as an argument to the function.

```julia
function better_update!(x)
    for i in eachindex(x)
        x[i] += 1
    end
end
```

"""

# ╔═╡ 4e9d3ae6-a748-4c0d-be4b-f55d36416b90
function better_update!(x)
    for i in eachindex(x)
        x[i] += 1
    end
end

# ╔═╡ 91122ecd-aa85-4c8c-8081-efc408bc27fa
md"""
Benchmarking this now

```julia
@benchmark better_update!(gl)
```
"""

# ╔═╡ 8a1a1068-f0b7-4b25-b536-946d5b71014e
@benchmark better_update!(gl)

# ╔═╡ ed3f056f-2533-4afd-8924-bea5522d2b67
md"""
By passing the array as a function argument, Julia can infer the type and compile an efficient version of the function, achieving a 1000x speedup on my machine (Ryzen 7950x).

```julia
@code_warntype better_update!(gl)
```
"""

# ╔═╡ 73bc014e-5fbe-4e56-8541-ac4ea7a1de73
@code_warntype better_update!(gl)

# ╔═╡ 2a0dc186-5f81-43d7-b35d-114d81ca189f
md"""
We see that the red font is gone. This is a general thing to keep in mind when using Julia. Try not to use the global scope in performance-critical parts. Instead, place the computation inside a function.

**Types**

Julia is a typed but dynamic language. The use of types is part of the reason that Julia can produce fast code. If Julia can infer the types inside the body of a function, it will compile efficient machine code. However, if this is not the case, the function will become **type unstable**. We saw this above with our global example, but these type instabilities can also occur in other seemingly simple functions.

For example let's start with a simple sum
```julia
function my_sum(x)
    s = 0
    for xi in x
        s += xi
    end
    return
end
```
"""

# ╔═╡ 607282b1-b131-4673-b587-e5153526b479


# ╔═╡ 89bbe72c-6ac1-42e8-9bad-9622f9a0ddc8
md"""
Analyzing this with `@code_warntype` shows a small type instability.

```julia
@code_warntype my_sum(gl)
```

!!! tip
        Remember to look for red-highlighted characters
"""

# ╔═╡ 5b9b2e83-40c9-41b7-bf7c-afa532381c3a


# ╔═╡ f4f6a0f4-2122-4ff8-9502-277c259bdc12
md"""
In this case, we see that Julia inserted a type instabilities since it could not determine the specific type of `s`. This is because when we initialized `s`, we used the value `0` which is an integer. Therefore, when we added xi to it, Julia determined that the type of `s` could either be an `Int` or `Float`. 

!!! note

    In Julia 1.8, the compiler is actually able to do something called [`union splitting`](https://julialang.org/blog/2018/08/union-splitting/), preventing this type instability from being a problem. However, it is still good practice to write more generic code.

To fix this we need to initialize `s` to be more generic. That can be done with the `zero` function in Julia.

```julia
function my_sum_better(x)
    s = zero(eltype(x))
    for xi in x
        s += xi
    end
    return s
end
```
"""

# ╔═╡ b1c9394d-c8d2-41b0-b660-2a306f37938b


# ╔═╡ d150d0ad-a56c-4980-93b7-3f4aeb5b99fc
md"""
Running `@code_warntype` we now get
```julia
@code_warntype my_sum_better(gl)
```
"""

# ╔═╡ d1c0bf38-5f71-4b60-9237-8d49674b711a


# ╔═╡ 578e9229-c627-44ee-808a-665093b60163
md"""
`zero` is a generic function that will create a `0` element that matches the type of the elements of the vector `x`.

One important thing to note is that while Julia uses types to optimize the code, using types in the function arguments does not impact performance at all. 

To see this let's look at an explicit version of `my_sum`
```julia
function my_sum_explicit(x::Vector{Float64})
    s = zero(eltype(x))
    for xi in x
        s += xi
    end
    return s
end
```
"""

# ╔═╡ 6af8a79d-de65-4ab2-8b02-39bb713769ff


# ╔═╡ 1ba4ae23-68d9-4b71-ac58-7cc7b05c5a6c
md"""
We can now benchmark both of our functions

```julia
@benchmark my_sum_better($gl)
```
"""

# ╔═╡ 648426de-1ae8-4d71-94a4-bad3246949bf


# ╔═╡ 4172daff-f72b-43a5-b9b2-bdee69c30cc6
md"""
```julia
@benchmark my_sum_explicit($gl)
```
"""

# ╔═╡ 3a3b1298-4e7f-4105-9012-5ee7f98bdb42


# ╔═╡ cb9ce792-96b1-4864-9ab6-bc9bcd8ef1da
md"""
We can even make sure that both functions produce the same code using `@code_llvm` (`@code_native`), which outputs the LLVM IR (native machine code).

```julia
@code_llvm my_sum_better(gl)
```
"""

# ╔═╡ 6a0165e3-a5f3-45eb-8fa1-0295c63a750e


# ╔═╡ dd31c043-d7ab-4cdb-a541-3c9d8874f13e
md"""
```julia
@code_llvm my_sum_explicit(gl)
```
"""

# ╔═╡ 95cf7746-4e62-4fd8-a178-d089811ba30a


# ╔═╡ aa122d78-4dd1-4d90-8fba-6739cc520579
md"""
Being overly specific with types in Julia is considered bad practice since it prevents composability with other libraries in Julia
. For example, 

```julia
my_sum_explicit(Float32.(gl))
```
"""

# ╔═╡ 2cf80da8-260d-4a09-aeba-e214578306d7


# ╔═╡ b5ca6168-9b97-4554-9c17-42e79e9ca4b9
md"""
gives a method error because we told the compiler that the function could only accept `Float64`. In Julia, types are mostly used for `dispatch` i.e., selecting which function to use.

Julia uses `multiple dispatch`, which uses the function name and all required arguments to select the proper function to execute. On the other hand, Python uses `single dispatch`, which uses the function name and only the first argument to select the function.

For example, the `add` operator in Python has two operators: `__add__` and `__radd__`. The second version of the function is necessary when the first can't perform the call. The `add` operator in Julia has two functions: `add(arg1, arg2)` and `add(arg2, arg1)`, i.e., two functions of the same name with their argruments swapped. **That is multiple dispatch.**

**Additional Tools**

In addition to `@code_warntype` Julia also has a number of other tools that can help diagnose type instabilities or performance problems:
  - [`Cthulhu.jl`](https://github.com/JuliaDebug/Cthulhu.jl): Recursively moves through a function and outputs the results of type inference.
  - [`JET.jl`](https://github.com/aviatesk/JET.jl): Employs Julia's type inference system to detect potential performance problems as well as bugs.
  - [`ProfileView.jl`](https://github.com/timholy/ProfileView.jl) Julia profiler and flame graph for evaluating function performance. 

"""

# ╔═╡ cb3a5dd2-8e56-404e-9c4e-db34c26ce1fa
md"""
**===================================================================================**

## Parallel Computing

Julia is particularly able to exploit various types of parallelism to accelerate the performance of a program.
In this tutorial, we will overview how to enable parallelism in various Julia programs.

Julia has a strong parallel computing infrastructure that enable HPC using vectorization,
threading, distributed computing, and even GPU acceleration.

**Single Processor Parallelism (SIMD)**

To get started, we will discuss low-level parallelism related to a single core called
*SIMD* or **Single Instruction Multiple Data**. SIMD is when the computer can apply a
single instruction to multiple data sets in a single instruction cycle. For instance,
suppose we have two vectors of number in Julia `a` and `b`. Then the following graph
compares how a serial instruction v.s. a vectorized instruction would be run on the computer.

!!! note
    **CPU cycle**: Can be thought of the smallest unit of time on which a CPU behaves. In a single CPU cycle, the computer usually does a fetch-decode-execute step. Briefly, this means that you can think of the CPU doing a single simpler operation, like addition, multiplication, etc.
"""

# ╔═╡ 582ff185-6da5-4aa9-929a-9ad2b84acf3e
Resource("https://github.com/sefffal/AASJuliaWorkshop/raw/main/vectorization.png")

# ╔═╡ ce7e5c95-face-406d-91d8-c97ba3d6a8f3
md"""
While the serial computation loops through each element in the list and applies the
addition operation each CPU clock cycle, the vectorized version realizes that it can
group multiple datasets (array elements) together and perform the same operation.
This can lead to 2x, 4x, or greater speedups depending on the specific CPU architecture
(related to AVX, AVX2, AVX512).

So what does Julia do? Let's start with the simple example above:

!!! note
    Vectorization in this setting is usually different from vectorization in Python/R. In python vectorization refers to placing all your variables in some vector container, like a numpy array, so that the resulting operation is run using a C/Fortran library.

```julia
function serial_add!(out, x, y)
    for i in eachindex(x, y)
    	out[i] = x[i] + y[i]
    end
    return out
end
```
"""


# ╔═╡ 19572955-bd07-4c79-a124-a6f7771d8b05


# ╔═╡ dc9a555e-5bf9-406e-8af9-a32d885f67b6
md"""
!!! note
    Note that we append the function with `!` this is a Julia convention which signals that we are mutating the arguments.

First we will allocate some variables for this tutorial.

```julia
begin
    N = 2^10
    x = rand(N)
    y = rand(N)
    out = zeros(y)
end
```
"""

# ╔═╡ 687721b3-93d5-4f7f-832b-b0db1d7bb88d


# ╔═╡ f0d4631a-d7b1-4319-bda6-9af2c323841b
md"""
Now let's benchmark our serial add to get a baseline for our performance.

```julia
@benchmark serial_add!($out, $x,  $y)
```
"""

# ╔═╡ 0cd6d228-ce36-49ff-b35c-88a7937a914e


# ╔═╡ 1596de4f-dd5b-4236-885a-8bf70e0eb9cf
md"""
Analyzing this on a Ryzen 7950x, it appears that the summation is 53.512 ns, or each
addition takes only 0.05ns! Inverting this number would naively suggest that the computer I am using has a 19 GHz processor! 

SIMD is the reason for this performance. Namely Julia's was able to automatically apply its auto-vectorization routines to use SIMD to accelerate the program.

To confirm that Julia was able to vectorize the loop we can use the introspection tool
```julia
@code_llvm serial_all!(out, x, y)
```
"""

# ╔═╡ caedac68-1dad-4ebb-9546-8c763733a916


# ╔═╡ 1aa3a8c6-2e0b-4944-92a4-10a7a06cb365
md"""
This outputs the LLVM IR and represents the final step of Julia's compilation pipeline
before it is converted into native machine code. While the output of `@code_llvm` is
complicated to check that the compiler effectively used SIMD we can look for something
similar to

```
   %wide.load30 = load <4 x double>, <4 x double>* %55, align 8
; └
; ┌ @ float.jl:383 within `+`
   %56 = fadd <4 x double> %wide.load, %wide.load27
```

This means that for each addition clock, we are simultaneously adding four elements of the array together. As a sanity check, this means that I have a 19/4 = 4.8 GHz processor which is roughly in line with the Ryzen 7950x reported speed.

**Vectorizing Julia Code with Packages**

Proving that a program can SIMD however can be difficult, and sometimes the compiler
won't effectively auto-vectorize the code. Julia however provides a number of tools that
can help the user to more effectively use SIMD. The most low-level of these libraries
is [`SIMD.jl`](https://github.com/eschnett/SIMD.jl). However,  most users never need to use SIMD.jl directly (for an introduction
see <http://kristofferc.github.io/post/intrinsics/>. Instead most Julia users will use more-upstream packages, such as [`LoopVectorization.jl`](https://github.com/JuliaSIMD/LoopVectorization.jl).

To see `LoopVectorization` in action let's change our above example to the slightly more complicated function.

```julia
function serial_sinadd(out, x, y)
    for i in eachindex(out, x, y)
        out[i] = x[i] + sin(y[i])
    end
    return out
end
```
"""

# ╔═╡ 9720d3c9-444f-45a7-a586-5ece2fd45f42


# ╔═╡ aa14adc1-ad37-4217-a2c1-99ccf0c9a1a1
md"""
Again lets start with a baseline evaluation
```julia
@benchmark serial_sinadd($out, $x, $y)
```
"""

# ╔═╡ 4a9da04b-f0f7-4c04-b451-dfd3a2094133


# ╔═╡ 773f0d5d-ce3c-4059-9880-4802dd624357
md"""
Running this example will show that the code is a lot slower than our previous example! Part of this is because `sin` is expensive, however we can also check whether the code was vectorized using the `@code_llvm`.
```julia
@code_llvm serial_sinadd(out, x, y)
```
"""

# ╔═╡ 31034523-c379-4fd9-a77f-a5c0964b85db


# ╔═╡ 8d1e882b-d074-4f99-88d9-2b03abc31dbe
md"""
Analyzing the output does show that Julia/LLVM was unable to automatically vectorize the expression. The reason for this is complicated and won't be discussed. However, we can fix this with
loop vectorization and its `@turbo` macro

```julia
function serial_sinadd_turbo(out, x, y)
    @turbo for i in eachindex(out, x, y)
        out[i] = x[i] + sin(y[i])
    end
    return out
end
```
"""

# ╔═╡ ad3d9bbf-6813-4cde-aa1c-8ce9f20f65dc


# ╔═╡ dc1d12b6-6fd9-4140-b6fa-187d608fc6b7
md"""
```julia
@benchmark serial_sinadd_turbo($out, $x, $y)
```
"""

# ╔═╡ 078e1a26-9580-4eed-8117-71493092f45e


# ╔═╡ 3f959b86-b3ee-4111-ba25-d5838aa41189
md"""
And boom we get large speed increase (factor of 2 on a Ryzen 7950x) by simply adding the `@turbo` macro to our loop.

**Threading with Julia**

Multi-threading is when a set of processors in Julia share the same Julia runtime and memory.
This means that multiple threads can all write and read from the exact same section of
memory in the computer and can execute code on the memory simultaneously.

To enable threading in julia you need to tell julia the number of threads you want to use.
For instance, start julia with 4 threads do
```bash
> julia -t 4
```
which will start Julia with 4 threads. You can also start Julia with threads on Linux/Mac by
using the environment label `JULIA_NUM_THREADS=4`. If you use `julia -t auto` then Julia will
start with the number of threads available on your machine. Note that `julia -t` required julia version 1.5 or later.

You can check the number of threads julia is using in the repl by typing
```julia
Threads.nthreads()
```
"""

# ╔═╡ f2a78556-cdfe-4d7b-9db7-049eac9d62a3


# ╔═╡ 3557caf8-49d9-4c8b-8a99-84620eb91b7c
md"""
Each Julia thread is tagged with an id that can be found using
```julia
Threads.threadid()
```
which defaults to 1, the master thread.


!!! tip
    This is the number of `Julia` threads not the number of BLAS threads. To set those do

```julia
using LinearAlgebra
BLAS.set_num_threads(8)
```
where 8 is the number of threads you want to use.
"""

# ╔═╡ e9ddb1ed-a56b-4adb-a4da-b5ae825d2fd5


# ╔═╡ 89cfd71a-9b58-4943-aaa8-3149d4688e29
md"""
which defaults to `1` the master thread.

**Simple threading with `Threads.@threads`**

The simplest way to use multi-threading in Julia is to use the `Threads.@threads` macro which automatically threads loops for you. For instance, we can thread our previous function using:

```julia
function threaded_add!(out, x, y)
    Threads.@threads for i in eachindex(out, x, y)
        out[i] = x[i] + y[i]
    end
	return out
end
```
"""

# ╔═╡ 80c070f2-516e-41be-9d74-bd31b0aec5a5


# ╔═╡ bd329998-a689-45dc-a55a-3ac0ce5a40ad
md"""
And benchmarking:

```julia
@benchmark threaded_add!($out, $x, $y)
```
"""

# ╔═╡ 292aacc4-a7f0-4873-a35a-8a84c6ac7345


# ╔═╡ 0106c518-8416-4e03-8928-93ad5fb177c3
md"""
This is actually slower than what we previously got without threading! This is because
threading has significant overhead! For simple computations, like adding two small vectors the overhead from threading dominates over any benefit you gain from using multiple threads.

In order to gain a benefit from threading our operation needs to:

1. Be expensive enough that the threading overhead is relatively minor
2. Be applied to a large enough vector to limit the threading overhead.

To see the benefit of threading we can then simply increase the number of operations

```julia
begin
	xlarge = rand(2^20)
	ylarge = rand(2^20)
	outlarge = rand(2^20)
end
```
"""

# ╔═╡ b068694a-c6f3-4d8d-87b7-0a29feeaea32


# ╔═╡ 230ee3f2-12b9-4120-8da8-d4ce33301522
md"""
Get the baseline again
```julia
@benchmark serial_add!($outlarge, $xlarge,  $ylarge)
```
"""

# ╔═╡ cc5a1a62-3b46-46f1-aeaf-f33a4b36ac4c


# ╔═╡ 16e20b74-612c-4cef-8055-2382fc2b87fb
md"""
Now test the threading example
```julia
@benchmark threaded_add!($outlarge, $xlarge,  $ylarge)
```
"""

# ╔═╡ 5278ef7e-a6a4-41bf-80a6-14bc28d1365b


# ╔═╡ 75cd0a9a-a1df-45f4-85b0-21749223eaff
md"""
Now, we are starting to see the benefits of threading for large enough vectors.
To determine whether threading is useful, a user should benchmark the code. Additionally, memory bandwidth limitations are often important and so multi-threaded code should also do as few allocations as possible.

**Using Higher-Level Threading Packages**

In general multi-threading programming can be quite difficult and error prone. Luckily there are a number of packages in Julia that can make this much simpler. The [`JuliaFolds`](https://github.com/JuliaFolds) ecosystem has a large number of packages, for instance, the [`FLoops.jl`](https://github.com/JuliaFolds/FLoops.jl). FLoops.jl provides two macros that enable a simple for-loop to be used for a variety of different execution mechanisms.

**GPU Acceleration**

GPUs are in some sense, opposite to CPUs. The typical CPU is characterized by a small
number of very fast processors. On the other hand, a GPU has thousands of very slow processors. This dichotomy directly relates to the types of problems that are fast on a GPU compared to a CPU.

To get started with GPUs in Julia you need to load the correct package one of
    1. [CUDA.jl](https://github.com/JuliaGPU/CUDA.jl): NVIDIA GPUs, and the most stable GPU package
    2. [AMDGPU.jl](https://github.com/JuliaGPU/AMDGPU.jl): AMD GPUs, actively developed but not as mature as CUDA; only works on linux due to ROCm support
    3. [oneAPI.jl](https://github.com/JuliaGPU/oneAPI.jl): Intel GPUs, currently under active development so it may have bugs; only works on linux currently.
    4. [Metal.jl](https://github.com/JuliaGPU/Metal.jl): Mac GPUs. Work in progress. Expect bugs and it is open to pull-requests.

For this tutorial I will be using the CUDA library. If your computer doesn't have a CUDA GPU then the examples below will not work.

**Getting Started with CUDA.jl**

CUDA.jl provides a complete suite of GPU tools in Julia from low-level kernel writing to high-level array operations. Most of the time a user just needs to use the high-level array interface which uses Julia's built-in broadcasting. For instance we can port our simple addition example above to the GPU by first moving the data to the GPU and using Julia's CUDA.jl broadcast interface.

```julia
begin
	xlarge_gpu = cu(xlarge)
	ylarge_gpu = cu(ylarge)
	outlarge_gpu = cu(outlarge)
end
```

For CUDA.jl the `cu` function take an array and creates a `CuArray` which is a copy of the array that lives in the GPU memory. Below we will mention some of the potential performance pitfalls that can occur due to this memory movement.

`cu` will tend to work on a large number of Array types in Julia. However, if your have a more complicated variable such as a `struct` then you will need to tell Julia how to move the data to the GPU. To see how to do this see <https://cuda.juliagpu.org/stable/tutorials/custom_structs/>

Given these `CuArray` objects, our `serial_add!` function could be written as

```julia
function bcast_add!(out, x, y)
    out .= x .+ y
    return out
end
```

!!! note
    Pay special attention to the `.=`. This ensures that not intermediate array is created on the GPU.

Running this on the gpu is then as simple as
```julia
@benchmark bcast_add!($outlarge_gpu, $xlarge_gpu, $ylarge_gpu)
```

However, at this point you may notice something. Nowhere in our algorithm did we specify that this kernel is actually running on the GPU. In fact we could use the exact same function using our CPU verions of the arrays

```julia
@benchmark bcast_add!($outlarge, $xlarge, $ylarge)
```

This reflects more general advice in Julia. Programs should be written generically. Julia's dot syntax `.` has been written to be highly generic, so functions should more generally be written using it than with generic loops, unless speed due to SIMD as with LoopVectorization, or multi-threading is required. This programming style has been codified in the [`SciMLStyle coding guide`](https://github.com/SciML/SciMLStyle).

**Distributed Computing (Switch to the REPL here)**

Distributed computing differs from all other parallelization strategies we have used.
Distributed computing is when multiple independent processes are used together for computation.
That is, unlike multi-threading, where each process lives in the Julia session, distributed
computing links multiple **separate** Julia sessions together.

As a result, each processor needs to communicate with the other processors
through message passing, i.e., sending data (usually through a network connection) from
one process to the other. The downside of this approach is that this communication
entails additional overhead compared to the other parallelization strategies we mentioned
previously. The upside is that you can link arbitrarily large numbers of processors and
processor memory together to parallelize the computation.

Julia has a number of different distributed computing facilities, but we will focus on Distributed.jl
the one supported in the standard library [`Distributed.jl`](https://tdocs.julialang.org/en/v1/manual/distributed-computing/).

**Distributed.jl (Manager-Worker parallelism)**

Distributed's multiprocessing uses the **manager-worker** paradigm. This is where the programmer
controls the manager directly and then it assigns tasks to the rest of the workers.
To start multiprocessing with Julia, there are two options

1. `julia -p 3` will start julia with 3 workers (4 processes in total). This will also automatically bring the Distributed library into scope
2. Is to manually add Julia processors in the repl. To do this in a fresh Julia session,

we do

````julia
using Distributed
addprocs(3)
````

!!! note
    On HPC systems, you can also use [`ClusterManagers.jl`] (https://github.com/JuliaParallel/ClusterManagers.jl)
    to setup a distributed environment using different job queue systems, such as Slurm and SGE.

This add 3 worker processors to the Julia process. To check the id's of the workers we
can use the `workers` function

````julia
workers()
````

We see that there are three workers with id's 2, 3, 4. The manager worker is always given the first id `1` and corresponds to the 
current Julia session. To see this we can use the `myid()` function

````julia
myid()
````

To start a process on a separate worker process, we can use the `remotecall` function

````julia
f = remotecall(rand, 2, 4, 4)
````

The first argument is the function we wish to call on the worker, the second argument is the id of the worker, and the rest of the arguments are passed to the function.
One thing to notice is that `remotecall` doesn't return the actual result of the computation. Instead `remotecall` returns a `Future`. This is because we don't necessarily need to return the result of the computation to the manager processor, which would induce additional communication costs. However, to get the value of the computation you can use the `fetch` function

````julia
fetch(f)
````

`remotecall` is typically considered a low-level function. Typically a user will use the `@spawnat` macro

````julia
f2 = @spawnat :any rand(4, 4)
````

This call does the same thing as the `remotecall` function above but the first argument is the worker id which we set to any to let Julia itself decide which processor to run it on.

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
Measurements = "eff96d63-e80a-5855-80a2-b1b0885c5ab7"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PythonCall = "6099a3de-0909-46bc-b1f4-468b9a2dfc0d"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
BenchmarkTools = "~1.3.2"
Measurements = "~2.8.0"
PlutoUI = "~0.7.49"
PythonCall = "~0.9.10"
Unitful = "~1.12.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "9268668630fed8626baecaefd09d382061eb9c94"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "d9a9701b899b30332bbcb3e1679c41cce81fb0e8"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.3.2"

[[deps.Calculus]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f641eb0a4f00c343bbc32346e1217b86f3ce9dad"
uuid = "49dc2e85-a5d0-5ad3-a950-438e2897f1b9"
version = "0.5.1"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.CondaPkg]]
deps = ["JSON3", "Markdown", "MicroMamba", "Pidfile", "Pkg", "TOML"]
git-tree-sha1 = "4682a2d28f98aa83be1ed137c0bd7d053f85db79"
uuid = "992eb4ea-22a4-4c89-a5bb-47a3300528ab"
version = "0.2.17"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "fb21ddd70a051d882a1686a5a550990bbe371a95"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.4.1"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JSON3]]
deps = ["Dates", "Mmap", "Parsers", "SnoopPrecompile", "StructTypes", "UUIDs"]
git-tree-sha1 = "84b10656a41ef564c39d2d477d7236966d2b5683"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.12.0"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Measurements]]
deps = ["Calculus", "LinearAlgebra", "Printf", "RecipesBase", "Requires"]
git-tree-sha1 = "12950d646ce04fb2e89ba5bd890205882c3592d7"
uuid = "eff96d63-e80a-5855-80a2-b1b0885c5ab7"
version = "2.8.0"

[[deps.MicroMamba]]
deps = ["Pkg", "Scratch", "micromamba_jll"]
git-tree-sha1 = "a6a4771aba1dc8942bc0f44ff9f8ee0f893ef888"
uuid = "0b3b1443-0f03-428d-bdfb-f27f9c1191ea"
version = "0.1.12"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "151d91d63d8d6c1a5789ecb7de51547e00480f1b"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.4"

[[deps.Pidfile]]
deps = ["FileWatching", "Test"]
git-tree-sha1 = "2d8aaf8ee10df53d0dfb9b8ee44ae7c04ced2b03"
uuid = "fa939f87-e72e-5be4-a000-7fc836dbe307"
version = "1.3.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eadad7b14cf046de6eb41f13c9275e5aa2711ab6"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.49"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[deps.PythonCall]]
deps = ["CondaPkg", "Dates", "Libdl", "MacroTools", "Markdown", "Pkg", "REPL", "Requires", "Serialization", "Tables", "UnsafePointers"]
git-tree-sha1 = "1052188e0a017d4f4f261f12307e1fa1b5b48588"
uuid = "6099a3de-0909-46bc-b1f4-468b9a2dfc0d"
version = "0.9.10"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
deps = ["SnoopPrecompile"]
git-tree-sha1 = "261dddd3b862bd2c940cf6ca4d1c8fe593e457c8"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.3"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "f94f779c94e58bf9ea243e77a37e16d9de9126bd"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
deps = ["Preferences"]
git-tree-sha1 = "e760a70afdcd461cf01a575947738d359234665c"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "ca4bccb03acf9faaf4137a9abc1881ed1841aa70"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.10.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "c79322d36826aa2f4fd8ecfa96ddb47b174ac78d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "ac00576f90d8a259f2c9d823e91d1de3fd44d348"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "d670a70dd3cdbe1c1186f2f17c9a68a7ec24838c"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.12.2"

[[deps.UnsafePointers]]
git-tree-sha1 = "c81331b3b2e60a982be57c046ec91f599ede674a"
uuid = "e17b2a0c-0bdf-430a-bd0c-3a23cae4ff39"
version = "1.0.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.micromamba_jll]]
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "80ddb5f510c650de288ecd548ebc3de557ffb3e2"
uuid = "f8abcde7-e9b7-5caa-b8af-a437887ae8e4"
version = "1.2.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─97339d68-a310-11ed-0c4c-7dd426dd4301
# ╟─367d07de-ec8e-4c75-ad6a-c37fc5477094
# ╟─62aed81e-12d5-4b91-9a9e-f8866af1e3d7
# ╟─dd8ca693-30e4-4d5e-9927-608b86162230
# ╟─72dbc6c2-22e9-485f-ae40-1ff008cee3b3
# ╟─5d2679d7-fd7c-4ee2-a83e-3120f8df286e
# ╠═700513c1-f8eb-46da-b0e3-10e4a888afd6
# ╟─d0f131ef-555b-4dee-a591-617ce36395d5
# ╠═1ae81446-759e-4a52-b51e-2f7cc96f5472
# ╟─33e3d1b2-851b-47cc-855c-0eda2be59cb1
# ╠═e7f21345-6f45-44c8-801a-140b680ca676
# ╟─9aeaff07-9997-4b7d-92ba-a9005158bb5f
# ╠═412e3233-f7c1-4e4a-a2af-198fd2ade430
# ╟─22fe494f-af4a-4d67-8d47-81292ac4e56e
# ╠═00e8c94b-6fcf-41aa-8aa9-338b4a14aeb5
# ╟─3748c949-e09b-4cf1-9dbf-1154a871d671
# ╠═0a9bf528-912d-4782-928c-5107bd3ac0ba
# ╟─ffd301ba-9af1-4e64-a8bf-cd7dcceaede8
# ╠═93a598ab-b722-40f0-bd58-f536c9bf859e
# ╟─6af4d494-cf25-4acc-ba93-37afa65ccd69
# ╟─2a688d2c-d4a9-4018-947d-8547acedd11c
# ╠═0a4f1f80-521b-421d-844d-3f4e8c071db4
# ╟─40b0c3a6-7091-49dd-bc45-394af1fe933d
# ╠═79f16ae3-d4df-4fe3-ab56-fcfe340b7e7c
# ╟─6c7faa97-1f9f-4604-90cd-94a0bef55ce4
# ╠═82375bad-7883-4db4-8693-401b8925d90f
# ╟─b625dc4a-4267-4716-9d90-cf7579ff8669
# ╠═e87a112b-8743-4c7c-950d-c9b19a2f2dab
# ╟─3b7d830b-fc62-4786-8ac3-90be3a0fe665
# ╠═79b291a1-4a44-4431-bb6f-74f8b215f897
# ╠═7efdf535-2135-4c69-85cb-d2614903d4fd
# ╠═6e9f75ea-f009-4c05-bf03-fd6c66214ce9
# ╟─c5f5fdbc-3439-4c99-843d-5ef6dc3c59b7
# ╠═ad6b69da-d37c-4e3e-9f0f-186f8b6d3b00
# ╟─12061b16-9c5c-475a-bf87-82f8e9d167eb
# ╟─b94b3f48-80c2-44b3-ba5d-896913ee7bb5
# ╠═54dca801-a079-4e79-a9f2-677b7067fd22
# ╟─4426caeb-9b03-4a9a-8e7d-5c8cc9303b59
# ╠═3f058e45-d5f1-4f8c-a56a-a3de4d65f68d
# ╟─84593e6e-5a29-435a-850e-13475e38bf53
# ╠═80563da7-d13c-499f-aade-c2423338eebf
# ╟─6bfc1a81-d594-4a7a-9b59-b85e089d8e8a
# ╠═cecec5b2-fc47-4a50-8b29-c613828802ec
# ╟─baa960f9-58e7-4f50-9de0-34ad663b43fb
# ╟─cc45c201-1819-472f-99ff-d51143d3440c
# ╠═8fed09a1-9575-497e-859a-5d39158af649
# ╟─6aad639a-f7da-4ffb-b68a-53a53b9fe22b
# ╠═88ae8198-b1aa-4838-a619-1ee926973239
# ╟─9296b12e-74aa-4a14-bcfe-612368916919
# ╠═939909cc-adc4-46bf-ab09-6f70fcb7c9ed
# ╟─21a75052-236a-4899-b48c-c9e12298f3d9
# ╠═a0b57cff-1cf2-4c40-a59b-e7e1d351870c
# ╟─b4cab1ca-bfe4-442b-94b6-f7271ce19f45
# ╠═4e9d3ae6-a748-4c0d-be4b-f55d36416b90
# ╟─91122ecd-aa85-4c8c-8081-efc408bc27fa
# ╠═8a1a1068-f0b7-4b25-b536-946d5b71014e
# ╟─ed3f056f-2533-4afd-8924-bea5522d2b67
# ╠═73bc014e-5fbe-4e56-8541-ac4ea7a1de73
# ╟─2a0dc186-5f81-43d7-b35d-114d81ca189f
# ╠═607282b1-b131-4673-b587-e5153526b479
# ╟─89bbe72c-6ac1-42e8-9bad-9622f9a0ddc8
# ╠═5b9b2e83-40c9-41b7-bf7c-afa532381c3a
# ╟─f4f6a0f4-2122-4ff8-9502-277c259bdc12
# ╠═b1c9394d-c8d2-41b0-b660-2a306f37938b
# ╟─d150d0ad-a56c-4980-93b7-3f4aeb5b99fc
# ╠═d1c0bf38-5f71-4b60-9237-8d49674b711a
# ╟─578e9229-c627-44ee-808a-665093b60163
# ╠═6af8a79d-de65-4ab2-8b02-39bb713769ff
# ╟─1ba4ae23-68d9-4b71-ac58-7cc7b05c5a6c
# ╠═648426de-1ae8-4d71-94a4-bad3246949bf
# ╟─4172daff-f72b-43a5-b9b2-bdee69c30cc6
# ╠═3a3b1298-4e7f-4105-9012-5ee7f98bdb42
# ╟─cb9ce792-96b1-4864-9ab6-bc9bcd8ef1da
# ╠═6a0165e3-a5f3-45eb-8fa1-0295c63a750e
# ╟─dd31c043-d7ab-4cdb-a541-3c9d8874f13e
# ╠═95cf7746-4e62-4fd8-a178-d089811ba30a
# ╟─aa122d78-4dd1-4d90-8fba-6739cc520579
# ╠═2cf80da8-260d-4a09-aeba-e214578306d7
# ╟─b5ca6168-9b97-4554-9c17-42e79e9ca4b9
# ╟─cb3a5dd2-8e56-404e-9c4e-db34c26ce1fa
# ╟─582ff185-6da5-4aa9-929a-9ad2b84acf3e
# ╟─ce7e5c95-face-406d-91d8-c97ba3d6a8f3
# ╠═19572955-bd07-4c79-a124-a6f7771d8b05
# ╟─dc9a555e-5bf9-406e-8af9-a32d885f67b6
# ╠═687721b3-93d5-4f7f-832b-b0db1d7bb88d
# ╟─f0d4631a-d7b1-4319-bda6-9af2c323841b
# ╠═0cd6d228-ce36-49ff-b35c-88a7937a914e
# ╟─1596de4f-dd5b-4236-885a-8bf70e0eb9cf
# ╠═caedac68-1dad-4ebb-9546-8c763733a916
# ╟─1aa3a8c6-2e0b-4944-92a4-10a7a06cb365
# ╠═9720d3c9-444f-45a7-a586-5ece2fd45f42
# ╟─aa14adc1-ad37-4217-a2c1-99ccf0c9a1a1
# ╠═4a9da04b-f0f7-4c04-b451-dfd3a2094133
# ╟─773f0d5d-ce3c-4059-9880-4802dd624357
# ╠═31034523-c379-4fd9-a77f-a5c0964b85db
# ╟─8d1e882b-d074-4f99-88d9-2b03abc31dbe
# ╠═ad3d9bbf-6813-4cde-aa1c-8ce9f20f65dc
# ╟─dc1d12b6-6fd9-4140-b6fa-187d608fc6b7
# ╠═078e1a26-9580-4eed-8117-71493092f45e
# ╟─3f959b86-b3ee-4111-ba25-d5838aa41189
# ╠═f2a78556-cdfe-4d7b-9db7-049eac9d62a3
# ╟─3557caf8-49d9-4c8b-8a99-84620eb91b7c
# ╠═e9ddb1ed-a56b-4adb-a4da-b5ae825d2fd5
# ╟─89cfd71a-9b58-4943-aaa8-3149d4688e29
# ╠═80c070f2-516e-41be-9d74-bd31b0aec5a5
# ╟─bd329998-a689-45dc-a55a-3ac0ce5a40ad
# ╠═292aacc4-a7f0-4873-a35a-8a84c6ac7345
# ╟─0106c518-8416-4e03-8928-93ad5fb177c3
# ╠═b068694a-c6f3-4d8d-87b7-0a29feeaea32
# ╟─230ee3f2-12b9-4120-8da8-d4ce33301522
# ╠═cc5a1a62-3b46-46f1-aeaf-f33a4b36ac4c
# ╟─16e20b74-612c-4cef-8055-2382fc2b87fb
# ╠═5278ef7e-a6a4-41bf-80a6-14bc28d1365b
# ╟─75cd0a9a-a1df-45f4-85b0-21749223eaff
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
