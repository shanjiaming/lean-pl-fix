import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Suppose that the roots of the polynomial $P(x)=x^3+ax^2+bx+c$ are $\cos \frac{2\pi}7,\cos \frac{4\pi}7,$ and $\cos \frac{6\pi}7$, where angles are in radians. What is $abc$?

$\textbf{(A) }{-}\frac{3}{49} \qquad \textbf{(B) }{-}\frac{1}{28} \qquad \textbf{(C) }\frac{\sqrt[3]7}{64} \qquad \textbf{(D) }\frac{1}{32}\qquad \textbf{(E) }\frac{1}{28}$ Show that it is \textbf{(D) }\frac{1}{32}.-/