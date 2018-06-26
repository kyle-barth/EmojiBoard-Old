MsgBox, READ ME: To enable emoji mode, turn capslock on. You can still type capital letters using shift.

#If GetKeyState("CapsLock","T")
;space
space::Send {Space 6}
;letters
a::Send {U+1F170}
b::Send {U+1F171}
c::Send {U+00A9}
d::Send {U+21A9}
e::Send {U+1F4E7}
f::Send {U+1F38F}
g::Send {U+E221}
h::Send {U+1F202}
i::Send {U+2139}
j::Send {U+2934}
k::Send {U+1F38B}
l::Send {U+1F6F4}
m::Send {U+24C2}
n::Send {U+2651}
o::Send {U+1F17E}
p::Send {U+1F17F}
q::Send {U+1F50D}
r::Send {U+00AE}
s::Send {U+1F4B2}
t::Send {U+271D}
u::Send {U+26CE}
v::Send {U+2648}
w::Send {U+1F450}
x::Send {U+274E}
y::Send {U+270C}
z::Send {U+24CF}
;numbers
0::Send {U+E225}
1::Send {U+E21C}
2::Send {U+E21D}
3::Send {U+E21E}
4::Send {U+E21F}
5::Send {U+E220}
6::Send {U+E221}
7::Send {U+E222}
8::Send {U+E223}
9::Send {U+E224}
;symbols
LShift & 1::Send {U+2757} ;e
RShift & 1::Send {U+2757} ;e
LShift & /::Send {U+2753} ;q
RShift & /::Send {U+2753} ;q