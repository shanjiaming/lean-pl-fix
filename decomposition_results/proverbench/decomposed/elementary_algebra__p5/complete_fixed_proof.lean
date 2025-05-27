theorem coefficient_of_X4_in_polynomial_expansion : coeff ((∑ i in Finset.range 101, X ^ i) ^ 3) 4 = 15:=
  by
  have h₁ : (∑ i in Finset.range 101, (X : Polynomial ℕ) ^ i) = ∑ i in Finset.range 101, X ^ i:= by rfl
    hole
  have h₂ : coeff ((∑ i in Finset.range 101, (X : Polynomial ℕ) ^ i) ^ 3) 4 = 15:=
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
  exact h₂
  hole