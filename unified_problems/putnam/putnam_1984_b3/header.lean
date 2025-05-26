import Mathlib

open Topology Filter Nat

-- True
/--
Prove or disprove the following statement: If $F$ is a finite set with two or more elements, then there exists a binary operation $*$ on F such that for all $x,y,z$ in $F$,
\begin{enumerate}
\item[(i)] $x*z=y*z$ implies $x=y$ (right cancellation holds), and
\item[(ii)] $x*(y*z) \neq (x*y)*z$ (\emph{no} case of associativity holds).
\end{enumerate}
-/