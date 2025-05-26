theorem putnam_1984_b1 (f : ℕ → ℤ) (hf : ∀ n > 0, f n = ∑ i : Set.Icc 1 n, ((i : ℕ)! : ℤ)) :
  let (P, Q):= ((Polynomial.X + 3, -Polynomial.X - 2) : Polynomial ℝ × Polynomial ℝ);
  ∀ n ≥ 1, f (n + 2) = P.eval (n : ℝ) * f (n + 1) + Q.eval (n : ℝ) * f n :=
  by
  dsimp only
  intro n hn
  have h₁ : f (n + 2) = f (n + 1) + ((n + 2 : ℕ)! : ℤ):=
    by
    have h₁₁ : f (n + 2) = ∑ i : Set.Icc 1 (n + 2), ((i : ℕ)! : ℤ):= by -- -- apply hf <;> linarith
      hole
    have h₁₂ : f (n + 1) = ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ):= by -- -- apply hf <;> linarith
      hole
    --  rw [h₁₁, h₁₂]
    have h₁₃ : ∑ i : Set.Icc 1 (n + 2), ((i : ℕ)! : ℤ) = ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ) + ((n + 2 : ℕ)! : ℤ):=
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
    --  rw [h₁₃] <;> simp [h₁₂, add_assoc] <;> ring_nf <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;>
          ring_nf <;>
        norm_num <;>
      rfl
    hole
  have h₂ : f (n + 1) = f n + ((n + 1 : ℕ)! : ℤ):=
    by
    have h₂₁ : f (n + 1) = ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ):= by -- -- apply hf <;> linarith
      hole
    have h₂₂ : f n = ∑ i : Set.Icc 1 n, ((i : ℕ)! : ℤ):= by -- -- apply hf <;> omega
      hole
    --  rw [h₂₁, h₂₂]
    have h₂₃ : ∑ i : Set.Icc 1 (n + 1), ((i : ℕ)! : ℤ) = ∑ i : Set.Icc 1 n, ((i : ℕ)! : ℤ) + ((n + 1 : ℕ)! : ℤ):=
      by
      --  rw [← Finset.sum_range_add_sum_Ico _ (by omega : (n : ℕ) + 1 ≤ n + 1 + 1)]
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
    --  rw [h₂₃] <;> simp [h₂₂, add_assoc] <;> ring_nf <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;>
          ring_nf <;>
        norm_num <;>
      rfl
    hole
  have h₃ : f (n + 2) = (n + 3 : ℝ) * (f (n + 1) : ℝ) + (-(n : ℝ) - 2) * (f n : ℝ):=
    by
    have h₃₁ : f (n + 2) = (f (n + 1) : ℤ) + ((n + 2 : ℕ)! : ℤ):= by -- linarith
      hole
    have h₃₂ : f (n + 1) = (f n : ℤ) + ((n + 1 : ℕ)! : ℤ):= by -- linarith
      hole
    have h₃₃ : (n + 3 : ℝ) * (f (n + 1) : ℝ) + (-(n : ℝ) - 2) * (f n : ℝ) = (f (n + 1) : ℝ) + ((n + 2 : ℕ)! : ℝ):=
      by
      --  rw [h₃₂]
      --  --  --  ring_nf <;> norm_cast <;> field_simp [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;> ring_nf at * <;>
                norm_cast at * <;>
              simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero, Nat.cast_succ] <;>
            ring_nf at * <;>
          norm_num at * <;>
        nlinarith
      hole
    have h₃₄ : (f (n + 2) : ℝ) = (f (n + 1) : ℝ) + ((n + 2 : ℕ)! : ℝ):= by
      --  --  rw [h₃₁] <;> norm_cast <;> simp_all [Nat.cast_add, Nat.cast_one, Nat.factorial_succ] <;> ring_nf at * <;>
          norm_cast at * <;>
        linarith
      hole
    have h₃₅ : (f (n + 2) : ℝ) = (n + 3 : ℝ) * (f (n + 1) : ℝ) + (-(n : ℝ) - 2) * (f n : ℝ):= by -- linarith
      hole
    --  exact_mod_cast h₃₅
    hole
  have h₄ :
    f (n + 2) =
      (Polynomial.eval (n : ℝ) (Polynomial.X + 3) : ℝ) * (f (n + 1) : ℝ) +
        (Polynomial.eval (n : ℝ) (-Polynomial.X - 2) : ℝ) * (f n : ℝ) := by sorry
  have h₅ :
    f (n + 2) =
      (Polynomial.eval (n : ℝ) (Polynomial.X + 3)) * (f (n + 1) : ℝ) +
        (Polynomial.eval (n : ℝ) (-Polynomial.X - 2)) * (f n : ℝ) := by sorry
  have h₆ :
    f (n + 2) =
      (Polynomial.eval (n : ℝ) (Polynomial.X + 3) : ℝ) * (f (n + 1) : ℝ) +
        (Polynomial.eval (n : ℝ) (-Polynomial.X - 2) : ℝ) * (f n : ℝ) := by sorry
  have h₇ :
    f (n + 2) =
      (Polynomial.eval (n : ℝ) (Polynomial.X + 3) : ℝ) * (f (n + 1) : ℝ) +
        (Polynomial.eval (n : ℝ) (-Polynomial.X - 2) : ℝ) * (f n : ℝ) := by sorry
  have h₈ :
    f (n + 2) =
      (Polynomial.eval (n : ℝ) (Polynomial.X + 3) : ℝ) * (f (n + 1) : ℝ) +
        (Polynomial.eval (n : ℝ) (-Polynomial.X - 2) : ℝ) * (f n : ℝ) := by sorry
  have h₉ :
    f (n + 2) =
      (Polynomial.eval (n : ℝ) (Polynomial.X + 3) : ℝ) * (f (n + 1) : ℝ) +
        (Polynomial.eval (n : ℝ) (-Polynomial.X - 2) : ℝ) * (f n : ℝ) := by sorry
  norm_num at * <;> (try norm_num) <;> (try ring_nf at *) <;> (try simp_all [h₁, h₂, h₃, h₄, h₅, h₆, h₇, h₈, h₉]) <;>
                                (try norm_cast) <;>
                              (try ring_nf at *) <;>
                            (try linarith) <;>
                          (try norm_num) <;>
                        (try ring_nf at *) <;>
                      (try linarith) <;>
                    (try field_simp at *) <;>
                  (try norm_num) <;>
                (try ring_nf at *) <;>
              (try linarith) <;>
            (try norm_cast at * <;> ring_nf at * <;> linarith) <;>
          (try norm_num at * <;> ring_nf at * <;> linarith) <;>
        norm_num <;>
      ring_nf <;>
    linarith
  hole