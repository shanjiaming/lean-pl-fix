import Mathlib

open RingHom Set Nat

-- True
/--
Let $X$ be the square $[0, 1] \times [0, 1]$, and let $f : X \to \mathbb{R}$ be continuous. If $\int_Y f(x, y) \, dx \, dy = 0$ for all squares $Y$ such that
\begin{itemize}
\item[(1)] $Y \subseteq X$,
\item[(2)] $Y$ has sides parallel to those of $X$,
\item[(3)] at least one of $Y$'s sides is contained in the boundary of $X$,
\end{itemize}
is it true that $f(x, y) = 0$ for all $x, y$?
-/