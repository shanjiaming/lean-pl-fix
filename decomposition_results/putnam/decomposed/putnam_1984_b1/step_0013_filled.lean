theorem h₃₃ (f : ℕ → ℤ) (hf : ∀ n > 0, f n = ∑ i, (↑(↑i : ℕ)! : ℤ)) (n : ℕ) (hn : n ≥ 1) (h₁ : f (n + 2) = f (n + 1) + (↑(n + 2)! : ℤ)) (h₂ : f (n + 1) = f n + (↑(n + 1)! : ℤ)) (h₃₁ : f (n + 2) = f (n + 1) + (↑(n + 2)! : ℤ)) (h₃₂ : f (n + 1) = f n + (↑(n + 1)! : ℤ)) : ((↑n : ℝ) + 3) * (↑(f (n + 1)) : ℝ) + (-(↑n : ℝ) - 2) * (↑(f n) : ℝ) = (↑(f (n + 1)) : ℝ) + (↑(n + 2)! : ℝ) :=
  by
  --  rw [h₃₂]
  --  --  --  ring_nf <;> norm_cast <;> field_simp [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;> ring_nf at * <;>
            norm_cast at * <;>
          simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_succ] <;>
        ring_nf at * <;>
      norm_num at * <;>
    nlinarith
  hole