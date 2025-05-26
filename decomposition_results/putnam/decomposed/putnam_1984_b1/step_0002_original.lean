theorem h₁ (f : ℕ → ℤ) (hf : ∀ n > 0, f n = ∑ i, (↑(↑i : ℕ)! : ℤ)) (n : ℕ) (hn : n ≥ 1) : f (n + 2) = f (n + 1) + (↑(n + 2)! : ℤ) :=
  by
  have h₁₁ : f (n + 2) = ∑ i : Set.Icc 1 (n + 2), ((i : ℕ)! : ℤ) := by sorry
  have h₁₂ : f (n + 1) = ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ) := by sorry
  rw [h₁₁, h₁₂]
  have h₁₃ : ∑ i : Set.Icc 1 (n + 2), ((i : ℕ)! : ℤ) = ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ) + ((n + 2 : ℕ)! : ℤ) := by sorry
  rw [h₁₃] <;> simp [h₁₂, add_assoc] <;> ring_nf <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;>
        ring_nf <;>
      norm_num <;>
    rfl