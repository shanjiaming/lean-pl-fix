import Mathlib

open Finset symmDiff

/--
Let $S$ be a finite set. Prove that there exists a list of subsets of $S$ such that
\begin{enumerate}
\item The first element of the list is the empty set,
\item Each subset of $S$ occurs exactly once in the list, and
\item Each successive element in the list is formed by adding or removing one element from the previous subset in the list.
\end{enumerate}
-/