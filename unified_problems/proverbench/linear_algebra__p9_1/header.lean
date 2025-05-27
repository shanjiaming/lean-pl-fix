import Mathlib

/-
Let $f: \mathbb{R}^n \rightarrow \mathbb{R}$ be a function. Then $f$ is a quadratic form if and only if there exists a symmetric matrix $\boldsymbol{A} \in \mathbb{R}^{n \times n}$ such that for all $\boldsymbol{x} \in \mathbb{R}^n$, $f(\boldsymbol{x}) = \boldsymbol{x}^{\mathrm{T}} \boldsymbol{A} \boldsymbol{x}$.
-/

open Real

variable {n : ℕ} {K : Type*} [Field K]

/-- A quadratic form is a function from `K^n` to `K` that can be expressed as `x^T A x` for some symmetric matrix `A`. -/
def IsQuadraticForm (f : (Fin n → K) → K) : Prop :=
∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x))