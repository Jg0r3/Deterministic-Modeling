
syms f x g b

f(x) = 2*x - b + x

g(x) = f(x) - x

v = fzero(g(x),1)

