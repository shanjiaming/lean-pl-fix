theorem h₁₃ (f : ℕ → ℤ) (hf : ∀ n > 0, f n = ∑ i, (↑(↑i : ℕ)! : ℤ)) (n : ℕ) (hn : n ≥ 1) (h₁₁ : f (n + 2) = ∑ i, (↑(↑i : ℕ)! : ℤ)) (h₁₂ : f (n + 1) = ∑ i, (↑(↑i : ℕ)! : ℤ)) : ∑ i, (↑(↑i : ℕ)! : ℤ) = ∑ i, (↑(↑i : ℕ)! : ℤ) + (↑(n + 2)! : ℤ) :=
  by
  --  rw [← Finset.sum_range_add_sum_Ico _ (by omega : (n + 1 : ℕ) + 1 ≤ n + 2 + 1)]
  congr 1
  · congr 1
    ext ⟨x, hx⟩
    simp [Set.Icc, Set.mem_Icc] at hx ⊢ <;> simp_all [Finset.mem_range, Finset.mem_Icc] <;> omega
  ·
    simp [Finset.sum_Ico_eq_sum_range] <;>
            simp_all [Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;>
          ring_nf <;>
        norm_num <;>
      rfl
  hole