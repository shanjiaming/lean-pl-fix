import Mathlib

open Filter Topology

-- Note: uses (ℕ → ℝ) instead of (Fin n → ℝ)
-- {p : Polynomial ℝ | p.degree = 2 ∧ (∃ r1 r2 : ℝ, r1 ≠ r2 ∧ p.eval r1 = 0 ∧ p.eval r2 = 0)}
/--
Find all real polynomials $p(x)$ of degree $n \geq 2$ for which there exist real numbers $r_1<r_2<\cdots<r_n$ such that
\begin{enumerate}
\item $p(r_i)=0, \qquad i=1,2,\dots,n$, and
\item $p'(\frac{r_i+r_{i+1}}{2})=0 \qquad i=1,2,\dots,n-1$,
\end{enumerate}
where $p'(x)$ denotes the derivative of $p(x)$.
-/