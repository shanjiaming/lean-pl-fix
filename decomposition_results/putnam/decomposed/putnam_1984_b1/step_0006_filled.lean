theorem h₂ (f : ℕ → ℤ) (hf : ∀ n > 0, f n = ∑ i, (↑(↑i : ℕ)! : ℤ)) (n : ℕ) (hn : n ≥ 1) (h₁ : f (n + 2) = f (n + 1) + (↑(n + 2)! : ℤ)) : f (n + 1) = f n + (↑(n + 1)! : ℤ) :=
  by
  have h₂₁ : f (n + 1) = ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ) := by sorry
  have h₂₂ : f n = ∑ i : Set.Icc 1 n, ((i : ℕ)! : ℤ) := by sorry
  --  rw [h₂₁, h₂₂]
  have h₂₃ : ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ) = ∑ i : Set.Icc 1 n, ((i : ℕ)! : ℤ) + ((n + 1 : ℕ)! : ℤ) := by sorry
  --  rw [h₂₃] <;> simp [h₂₂, add_assoc] <;> ring_nf <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;>
        ring_nf <;>
      norm_num <;>
    rfl
  hole