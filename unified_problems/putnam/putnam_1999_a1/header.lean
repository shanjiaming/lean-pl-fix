import Mathlib

-- Note: The actual problem asks to "find" such polynomials as well - but the solution does not give a set of all possible solutions. Hence, we would need to do the analysis ourselves, the following formalization should work.
-- True
/--
Find polynomials $f(x)$,$g(x)$, and $h(x)$, if they exist, such that for all $x$, \[|f(x)|-|g(x)|+h(x) = \begin{cases} -1 & \mbox{if $x<-1$} \\3x+2 & \mbox{if $-1 \leq x \leq 0$} \\-2x+2 & \mbox{if $x>0$.}\end{cases}\]?
-/