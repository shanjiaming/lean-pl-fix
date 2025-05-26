import Mathlib

open Matrix Function

-- Note: uses (ℝ → ℝ) instead of (Set.Icc (-1 : ℝ) 1 → ℝ)
-- fun x : ℝ => Real.sqrt (1 - x^2)
/--
Let $f: [-1, 1] \to \mathbb{R}$ be a continuous function such that
\begin{itemize}
\item[(i)]
$f(x) = \frac{2-x^2}{2} f \left( \frac{x^2}{2-x^2} \right)$ for every $x$ in $[-1, 1]$,
\item[(ii)]
$f(0) = 1$, and
\item[(iii)]
$\lim_{x \to 1^-} \frac{f(x)}{\sqrt{1-x}}$ exists and is finite.
\end{itemize}
Prove that $f$ is unique, and express $f(x)$ in closed form.
-/