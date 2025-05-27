import Mathlib

open Topology Filter Nat Function Polynomial

/--
Let $M$ be a set of real $n \times n$ matrices such that
\begin{itemize}
\item[(i)] $I \in M$, where $I$ is the $n \times n$ identity matrix;
\item[(ii)] if $A \in M$ and $B \in M$, then either $AB \in M$ or $-AB \in M$, but not both;
\item[(iii)] if $A \in M$ and $B \in M$, then either $AB = BA$ or $AB = -BA$;
\item[(iv)] if $A \in M$ and $A \neq I$, there is at least one $B \in M$ such that $AB = -BA$.
\end{itemize}
Prove that $M$ contains at most $n^2$ matrices.
-/