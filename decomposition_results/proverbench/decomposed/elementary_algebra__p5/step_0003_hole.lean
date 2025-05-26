theorem h₂ (h₁ : ∑ i ∈ Finset.range 101, sorry ^ i = ∑ i ∈ Finset.range 101, sorry ^ i) : sorry = 15 :=
  by
  rw [show (∑ i in Finset.range 101, (X : Polynomial ℕ) ^ i) ^ 3 = (∑ i in Finset.range 101, X ^ i) ^ 3 by rfl]
  rw [show
      (∑ i in Finset.range 101, X ^ i) ^ 3 =
        (∑ i in Finset.range 101, X ^ i) * (∑ i in Finset.range 101, X ^ i) * (∑ i in Finset.range 101, X ^ i)
      by ring]
  simp [coeff_mul, coeff_add, coeff_X_pow, Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_zero] <;>
      norm_num <;>
    rfl
  hole