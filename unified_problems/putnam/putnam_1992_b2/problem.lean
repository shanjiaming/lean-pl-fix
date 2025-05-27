theorem putnam_1992_b2
    (Q : ℕ → ℕ → ℕ)
    (hQ : Q = fun n k ↦ coeff ((1 + X + X ^ 2 + X ^ 3) ^ n) k)
    (n k : ℕ) :
    Q n k = ∑ j in Finset.Iic k, choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) := by
  have h₁ : (1 + X + X ^ 2 + X ^ 3 : ℕ[X]) = (1 + X) * (1 + X ^ 2) := by
    simp [mul_add, add_mul, mul_comm, mul_assoc, mul_left_comm, pow_two, pow_three]
    <;> ring_nf
    <;> rfl
  
  have h₂ : (1 + X + X ^ 2 + X ^ 3 : ℕ[X]) ^ n = (1 + X) ^ n * (1 + X ^ 2) ^ n := by
    rw [h₁]
    rw [mul_pow]
    <;> simp [mul_assoc]
    <;> ring_nf
    <;> rfl
  
  have h₃ : Q n k = coeff ((1 + X) ^ n * (1 + X ^ 2) ^ n) k := by
    rw [hQ]
    rw [h₂]
    <;> simp [coeff_mul, Finset.sum_mul, Finset.mul_sum]
    <;> ring_nf
    <;> rfl
  
  have h₄ : coeff ((1 + X) ^ n * (1 + X ^ 2) ^ n) k = ∑ j in Finset.Iic k, choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) := by
    have h₅ : coeff ((1 + X) ^ n * (1 + X ^ 2) ^ n) k = ∑ x in Finset.Nat.antidiagonal k, coeff ((1 + X) ^ n) x.1 * coeff ((1 + X ^ 2) ^ n) x.2 := by
      rw [coeff_mul]
      <;> simp [Finset.Nat.antidiagonal_eq_map]
      <;> rfl
    rw [h₅]
    have h₆ : ∑ x in Finset.Nat.antidiagonal k, coeff ((1 + X) ^ n) x.1 * coeff ((1 + X ^ 2) ^ n) x.2 = ∑ j in Finset.Iic k, choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) := by
      have h₇ : ∀ (j : ℕ), j ∈ Finset.Iic k → (coeff ((1 + X) ^ n) (k - 2 * j) * coeff ((1 + X ^ 2) ^ n) j = choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0)) := by
        intro j hj
        have h₈ : j ≤ k := Finset.mem_Iic.mp hj
        have h₉ : coeff ((1 + X) ^ n) (k - 2 * j) = choose n (k - 2 * j) := by
          rw [coeff_one_add_X_pow, if_neg]
          <;>
          (try omega) <;>
          (try simp_all [Nat.choose_eq_zero_iff]) <;>
          (try ring_nf at *) <;>
          (try omega)
        have h₁₀ : coeff ((1 + X ^ 2) ^ n) j = choose n j := by
          rw [coeff_one_add_X_sq_pow]
          <;>
          (try omega) <;>
          (try simp_all [Nat.choose_eq_zero_iff]) <;>
          (try ring_nf at *) <;>
          (try omega)
        rw [h₉, h₁₀]
        have h₁₁ : 2 * j ≤ k → choose n (k - 2 * j) = choose n (k - 2 * j) := by intro h; rfl
        have h₁₂ : ¬2 * j ≤ k → (0 : ℕ) = 0 := by intro h; rfl
        split_ifs with h
        · simp_all
        · have h₁₃ : k - 2 * j = 0 := by
            have h₁₄ : 2 * j > k := by omega
            have h₁₅ : k - 2 * j = 0 := by
              have h₁₆ : k < 2 * j := by omega
              have h₁₇ : k - 2 * j = 0 := by
                omega
              exact h₁₇
            exact h₁₅
          have h₁₄ : choose n (k - 2 * j) = choose n 0 := by rw [h₁₃]
          have h₁₅ : choose n 0 = 1 := by simp [Nat.choose_zero_right]
          have h₁₆ : choose n (k - 2 * j) = 1 := by rw [h₁₄, h₁₅]
          have h₁₇ : choose n j * 1 = choose n j := by simp
          have h₁₈ : choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) = choose n j * 0 := by
            simp [h]
          have h₁₉ : choose n j * 0 = 0 := by simp
          have h₂₀ : choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) = 0 := by
            rw [h₁₈, h₁₉]
          have h₂₁ : choose n j * choose n (k - 2 * j) = choose n j * 1 := by
            rw [h₁₆]
          have h₂₂ : choose n j * 1 = choose n j := by simp
          have h₂₃ : choose n j * choose n (k - 2 * j) = choose n j := by
            rw [h₂₁, h₂₂]
          omega
      have h₇ : ∑ x in Finset.Nat.antidiagonal k, coeff ((1 + X) ^ n) x.1 * coeff ((1 + X ^ 2) ^ n) x.2 = ∑ j in Finset.Iic k, choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) := by
        have h₈ : ∑ x in Finset.Nat.antidiagonal k, coeff ((1 + X) ^ n) x.1 * coeff ((1 + X ^ 2) ^ n) x.2 = ∑ j in Finset.Iic k, coeff ((1 + X) ^ n) (k - 2 * j) * coeff ((1 + X ^ 2) ^ n) j := by
          have h₉ : ∑ x in Finset.Nat.antidiagonal k, coeff ((1 + X) ^ n) x.1 * coeff ((1 + X ^ 2) ^ n) x.2 = ∑ j in Finset.Iic k, coeff ((1 + X) ^ n) (k - 2 * j) * coeff ((1 + X ^ 2) ^ n) j := by
            apply Eq.symm
            apply Finset.sum_bij' (fun (j : ℕ) _ => (k - 2 * j, j)) (fun (x : ℕ × ℕ) _ => x.2)
            <;> simp_all [Finset.mem_Iic, Finset.mem_filter, Finset.mem_univ, Finset.Nat.mem_antidiagonal, true_and]
            <;>
            (try omega) <;>
            (try ring_nf at *) <;>
            (try omega) <;>
            (try aesop)
          rw [h₉]
        rw [h₈]
        have h₉ : ∑ j in Finset.Iic k, coeff ((1 + X) ^ n) (k - 2 * j) * coeff ((1 + X ^ 2) ^ n) j = ∑ j in Finset.Iic k, choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) := by
          apply Finset.sum_congr rfl
          intro j hj
          rw [h₇ j hj]
        rw [h₉]
      rw [h₇]
    rw [h₆]
  
  have h₅ : Q n k = ∑ j in Finset.Iic k, choose n j * (if 2 * j ≤ k then choose n (k - 2 * j) else 0) := by
    rw [h₃, h₄]
    <;> simp_all [Finset.sum_mul, Finset.mul_sum]
    <;> ring_nf
    <;> rfl
  
  rw [h₅]
  <;> simp_all [Finset.sum_mul, Finset.mul_sum]
  <;> ring_nf
  <;> rfl