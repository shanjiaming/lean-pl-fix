import Mathlib

/-
Let $A$ be an $m \times n$ matrix. $A$ is said to be a column full rank matrix if and only if $\text{rank}(A) = n$, where $n$ is the number of columns in $A$.
-/

open Matrix LinearMap

variable {K : Type*} [Field K] {m n : Type*} [Fintype m] [Fintype n]

/-- A matrix A is said to be column full rank if its columns are linearly independent. -/
def column_full_rank (A : Matrix m n K) : Prop := LinearIndependent K (fun i => A i)