import Mathlib

open MvPolynomial Set Nat

/--
Let $f(z)=az^4+bz^3+cz^2+dz+e=a(z-r_1)(z-r_2)(z-r_3)(z-r_4)$ where $a,b,c,d,e$ are integers, $a \neq 0$. Show that if $r_1+r_2$ is a rational number and $r_1+r_2 \neq r_3+r_4$, then $r_1r_2$ is a rational number.
-/