import Mathlib

open Topology Filter

/--
Let $C$ be the set of continuous functions $f : \mathbb{R} \to \mathbb{R}$. Let $T : C \to C$ satisfty the following two properties:
\begin{enumerate}
\item Linearity: $T(af + bg) = aT(f) + bT(g)$ for all $a, b \in \mathbb{R}$ and all $f, g \in C$.
\item Locality: If $f \in C$ and $g \in C$ are identical on some interval $I$, then $T(f)$ and $T(g)$ are also identical on $I$.
\end{enumerate}
Prove that there exists some function $f \in C$ such that $T(g(x)) = f(x)g(x)$ for all $g \in C$.
-/