import Mathlib

/-
Let $f: \mathbb{C} \rightarrow \mathbb{C}$ be an entire function. If $|f(z)| \geq 1$ for all $z \in \mathbb{C}$, then $f$ is constant.
-/

open Complex

/-- A function f is entire if it is analytic on the entire complex plane ℂ. -/
def Entire (f : ℂ → ℂ) : Prop := AnalyticOn ℂ f Set.univ