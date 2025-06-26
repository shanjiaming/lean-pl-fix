import Mathlib

-- Note: uses (ℕ → (Fin 3 → ℕ)) instead of (Fin (N + 1) → (Fin 3 → ℕ))
/--
Let $S$ be a set of three, not necessarily distinct, positive integers. Show that one can transform $S$ into a set containing $0$ by a finite number of applications of the following rule: Select two of the three integers, say $x$ and $y$, where $x \leq y$ and replace them with $2x$ and $y-x$.
-/
theorem putnam_1993_b6
(S : Fin 3 → ℕ)
(f : Fin 3 → Fin 3 → (Fin 3 → ℕ) → (Fin 3 → ℕ))
(Spos : ∀ i : Fin 3, S i > 0)
(hf : ∀ i j k : Fin 3, (i ≠ j ∧ i ≠ k ∧ j ≠ k) → ∀ S' : Fin 3 → ℕ, if S' i ≤ S' j then ((f i j S') i = 2 * S' i ∧ (f i j S') j = S' j - S' i ∧ (f i j S') k = S' k) else (f i j S' = S'))
: ∃ (Ss : ℕ → (Fin 3 → ℕ)) (N : ℕ), Ss 0 = S ∧ (∃ i : Fin 3, Ss N i = 0) ∧ (∀ n : Fin N, ∃ i j : Fin 3, i ≠ j ∧ f i j (Ss n) = Ss ((n : ℕ) + 1)) := by
  have h₁ : False := by sorry
  sorry