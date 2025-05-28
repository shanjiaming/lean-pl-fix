theorem putnam_2021_b4 (F : ℕ → ℕ) (hF : ∀ (n : ℕ), F (n + 2) = F (n + 1) + F n) (F01 : F 0 = 0 ∧ F 1 = 1) : ∀ m > 2, ∃ p, (∏ k, ↑k ^ ↑k) % F m = F p :=
  by
  have h₁ : F 2 = 1 := by sorry
  have h₂ : ∀ n, n ≥ 1 → F n ≥ 1 := by sorry
  have h₃ : ∀ m, m > 2 → F m ≥ 2 := by sorry
  have h₄ : ∀ (m : ℕ), m > 2 → (∃ p, (∏ k : Set.Icc 1 (F m - 1), (k.1 ^ k.1)) % F m = F p) := by sorry
  --  intro m hm
  have h₅ := h₄ m hm
  --  exact h₅
  hole