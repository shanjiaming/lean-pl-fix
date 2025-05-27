import Mathlib

/-
Let $\boldsymbol{A}$ be a matrix and $\boldsymbol{x}$ be a vector such that $\boldsymbol{A x}=\mathbf{0}$ is a homogeneous system
of linear equations. If $\boldsymbol{\xi}$ is a solution to this system, then for any scalar $k \in \mathbb{R}$, the vector $k
\boldsymbol{\xi}$ is also a solution to the system.
-/

open LinearMap

variable {R : Type*} [Field R] -- R is a field
variable {n : Type*} [Fintype n] [DecidableEq n] -- n is a finite type with decidable equality
variable (A : Matrix n n R) -- Matrix A
variable (ξ : n → R) -- Vector ξ
variable (k : R) -- Scalar k

/-- A homogeneous system of linear equations A x = 0 -/
def HomogeneousSystem (A : Matrix n n R) (x : n → R) : Prop := A.mulVec x = 0