theorem h₈ (f : ↑(Ioi 1) → ↑(Ioi 1)) (hf : ∀ (x y : ↑(Ioi 1)), ↑x ^ 2 ≤ ↑y ∧ ↑y ≤ ↑x ^ 3 → ↑(f x) ^ 2 ≤ ↑(f y) ∧ ↑(f y) ≤ ↑(f x) ^ 3) (x : ↑(Ioi 1)) (h₂ h₃ : ↑x ^ 2 ≤ ↑x ∧ ↑x ≤ ↑x ^ 3 → ↑(f x) ^ 2 ≤ ↑(f x) ∧ ↑(f x) ≤ ↑(f x) ^ 3) (h₄ : 1 < ↑x) (h₅ : ↑x ^ 2 ≤ ↑x → False) (h₆ : ↑x ≤ ↑x ^ 3 → False) (h₇ : ¬(↑x ^ 2 ≤ ↑x ∧ ↑x ≤ ↑x ^ 3)) : ↑(f x) ^ 2 ≤ ↑(f x) ∧ ↑(f x) ≤ ↑(f x) ^ 3 :=
  by
  by_cases h₉ : ((x : ℝ) ^ 2 ≤ (x : ℝ) ∧ (x : ℝ) ≤ (x : ℝ) ^ 3)
  · exfalso
    exact h₇ h₉
  · exfalso
    exact h₇ ⟨by nlinarith [sq_nonneg ((x : ℝ) - 1)], by nlinarith [sq_nonneg ((x : ℝ) - 1)]⟩