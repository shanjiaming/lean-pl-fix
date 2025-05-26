theorem h_main (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) (h_a3 : a 3 % 100 = 87) (h_a_ge_3 : ∀ i ≥ 3, a i % 100 = 87) : {k | ∀ (N : ℕ), ∃ i ≥ N, a i % 100 = (↑k : ℕ)} = {87} :=
  by
  --  apply Set.Subset.antisymm
  --  · intro k hk
    have h₁ : ∀ N : ℕ, ∃ i ≥ N, a i % 100 = k := hk
    have h₂ : k = 87 := by sorry
    have h₃ : k = 87 := h₂
  --  --    rw [h₃] <;> simp [Set.mem_singleton_iff] <;> aesop
  --  · intro k hk
    have h₁ : k = 87 := by sorry
  --    rw [h₁]
  --    intro N
    have h₂ : ∃ i ≥ N, a i % 100 = 87 := by sorry
  --    exact h₂
  hole