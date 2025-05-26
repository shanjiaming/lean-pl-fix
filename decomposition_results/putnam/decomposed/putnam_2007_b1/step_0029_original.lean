theorem h17 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (hfnconst : ∃ n > 0, f.coeff n > 0) (n : ℤ) (hn : n > 0) (h1 : Polynomial.eval 1 f > 0) (h2 : n ≥ 1) (hn1 : n ≠ 1) (h4 h5 : n ≥ 2) (m : ℕ) (hm1 : m > 0) (hm2 : f.coeff m > 0) (h8 : m > 0) (h10 : Polynomial.eval n f = Polynomial.eval n f) (h11 : Polynomial.eval 1 f = Polynomial.eval 1 f) (h13 : Polynomial.eval n f - Polynomial.eval 1 f = Polynomial.eval n f - Polynomial.eval 1 f) (h15 : 0 < n) (h16 : ∀ (k : ℕ), f.coeff k ≥ 0) : Polynomial.eval n f - Polynomial.eval 1 f = ∑ k ∈ f.support, f.coeff k * (n ^ k - 1) := by
  calc
    (Polynomial.eval n f : ℤ) - (Polynomial.eval 1 f : ℤ) =
        ∑ k in f.support, (f.coeff k : ℤ) * (n : ℤ) ^ k - ∑ k in f.support, (f.coeff k : ℤ) * (1 : ℤ) ^ k :=
      by simp [Polynomial.eval_eq_sum, Finset.sum_sub_distrib]
    _ = ∑ k in f.support, ((f.coeff k : ℤ) * (n : ℤ) ^ k - (f.coeff k : ℤ) * (1 : ℤ) ^ k) := by
      simp [Finset.sum_sub_distrib]
    _ = ∑ k in f.support, (f.coeff k : ℤ) * ((n : ℤ) ^ k - (1 : ℤ) ^ k) :=
      by
      apply Finset.sum_congr rfl
      intro k _
      ring
    _ = ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) :=
      by
      apply Finset.sum_congr rfl
      intro k _
      have h18 : (1 : ℤ) ^ k = 1 := by simp
      simp [h18] <;> ring