theorem h₅ (α : ℝ) (ha : Real.cos (Real.pi * α) = 1 / 3) (p q : ℤ) (hq : q > 0) (hα : α = ↑p / ↑q) (h₁ : Real.cos (↑p * Real.pi / ↑q) = 1 / 3) (h₂ : Real.cos (Real.pi * α) = Real.cos (↑p * Real.pi / ↑q)) (h₃ : Real.cos (↑p * Real.pi / ↑q) = 1 / 3) (h₄ : q > 0) : ∀ (k : ℕ), ∃ N, Real.cos (↑k * (↑p * Real.pi / ↑q)) = ↑N / 3 ^ k ∧ 3 ∣ N → 3 ∣ ↑k :=
  by
  intro k
  by_contra! h
  use 0 <;> simp_all [Int.emod_eq_of_lt] <;> norm_num <;> linarith