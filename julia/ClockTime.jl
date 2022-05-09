# everything has a type
a = 1.0
typeof(a) # Float64
b = "hello"
typeof(b)

# own types
struct ClockTime{T}
    time::T
end

my_time = ClockTime(5.0)
my_time.time

# methods
@code_llvm 6.0*7.0
@code_llvm 6*7

import Base: +

+(x::ClockTime{T}, y::ClockTime{T}) where{T} = ClockTime((x.time + y.time) % T(24))

# 5.5 == 5:30h

my_time = ClockTime(11.2)
your_time = ClockTime(18.4)

our_time = my_time + your_time

# extend 1: I have memory problems, and I only care about full hours

my_time = ClockTime(UInt8(5))
your_time = ClockTime(UInt8(8))

our_time = my_time + your_time

# extend 2: I want to multiply sparse matrices of clocktimes

using SparseArrays, BenchmarkTools

import Base: zero, *

*(x::T, y::ClockTime{T}) where T = ClockTime((x * y.time) % T(24))

zero(x::ClockTime{T}) where T = ClockTime(zero(T))
zero(::Type{ClockTime{T}}) where T = ClockTime(zero(T))
#iszero(x::ClockTime) = iszero(x.time)

a = zeros(ClockTime{Float64}, 20, 20)

a[1,1] = ClockTime(5.0)
a[1,2] = ClockTime(11.673)
a[6,9] = ClockTime(17.23)
a[16,4] = ClockTime(20.87)

a_sparse = sparse(a)

b = zeros(20, 20)
b[3,9] = 1
b[6,9] = sqrt(2)
b[19,1] = π
b[4,5] = ℯ

b_sparse = sparse(b)

b_sparse*a_sparse

@benchmark b_sparse*a_sparse
@benchmark b*a

# simple, but: everything can be a function
function optimize(variable)
    ...
    objective(variable)
    ...
    gradient(variable)
    ...
end

objective(variable)
gradient(variable)