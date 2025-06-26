import Mathlib

open Classical Polynomial Filter Topology Real Set Nat List

-- (3 / 4, 4 / 3)
/--
Define a positive integer $n$ to be \emph{squarish} if either $n$ is itself a perfect square or the distance from $n$ to the nearest perfect square is a perfect square. For example, $2016$ is squarish, because the nearest perfect square to $2016$ is $45^2 = 2025$ and $2025 - 2016 = 9$ is a perfect square. (Of the positive integers between $1$ and $10$, only $6$ and $7$ are not squarish.)

For a positive integer $N$, let $S(N)$ be the number of squarish integers between $1$ and $N$,
inclusive. Find positive constants $\alpha$ and $\beta$ such that
\[
\lim_{N \to \infty} \frac{S(N)}{N^\alpha} = \beta,
\]
or show that no such constants exist.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2016_b2
(squarish : ℤ → Prop)
(hsquarish : ∀ n, squarish n ↔ IsSquare n ∨ ∃ w : ℤ, IsSquare |n - w ^ 2| ∧ ∀ v : ℕ, |n - w ^ 2| ≤ |n - v ^ 2|)
(S : ℤ → ℕ)
(hS : S = fun n ↦ {i ∈ Finset.Icc 1 n | squarish i}.card)
(p : ℝ → ℝ → Prop)
(hp : ∀ α β, p α β ↔ α > 0 ∧ β > 0 ∧ Tendsto (fun N ↦ S N / (N : ℝ) ^ α) atTop (𝓝 β))
: ((∀ α β : ℝ, ((α, β) = ((3 / 4, 4 / 3) : ℝ × ℝ ) ↔ p α β)) ∨ ¬∃ α β : ℝ, p α β) := by
  have h₁ : ¬∃ (α β : ℝ), p α β := by hole_1
  have h₂ : (∀ α β : ℝ, ((α, β) = ((3 / 4, 4 / 3) : ℝ × ℝ) ↔ p α β)) ∨ ¬∃ (α β : ℝ), p α β := by hole_2
  hole_3