import Mathlib

open Nat Topology Filter

/--
If $f$ and $g$ are continuous and periodic functions with period $1$ on the real line, then $\lim_{n \to \infty} \int_0^1 f(x)g(nx)\,dx=(\int_0^1 f(x)\,dx)(\int_0^1 g(x)\,dx)$.
-/