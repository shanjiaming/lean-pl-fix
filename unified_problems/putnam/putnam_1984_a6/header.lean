import Mathlib

open Topology Filter Function Nat

-- Note: uses `0` to indicate not periodic.
-- 4
/--
Let $n$ be a positive integer, and let $f(n)$ denote the last nonzero digit in the decimal expansion of $n!$. For instance, $f(5)=2$.
\begin{enumerate}
\item[(a)] Show that if $a_1,a_2,\dots,a_k$ are \emph{distinct} nonnegative integers, then $f(5^{a_1}+5^{a_2}+\dots+5^{a_k})$ depends only on the sum $a_1+a_2+\dots+a_k$.
\item[(b)] Assuming part (a), we can define $g(s)=f(5^{a_1}+5^{a_2}+\dots+5^{a_k})$, where $s=a_1+a_2+\dots+a_k$. Find the least positive integer $p$ for which $g(s)=g(s + p)$, for all $s \geq 1$, or else show that no such $p$ exists.
\end{enumerate}
-/