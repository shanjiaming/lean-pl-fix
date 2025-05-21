theorem i_pow_mod_4 (n : ℕ) : I ^ n = I ^ (n % 4) := by
  have h₀ : I ^ 4 = 1 := by
    norm_num [pow_succ, Complex.ext_iff, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    simp [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    norm_num
    <;>
    simp_all [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    norm_num
    <;>
    simp_all [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    norm_num
  
  have h₁ : ∀ (k : ℕ), I ^ (4 * k) = 1 := by
    intro k
    induction k with
    | zero =>
      simp
    | succ k ih =>
      rw [show 4 * (k + 1) = 4 * k + 4 by ring]
      rw [pow_add]
      simp [ih, h₀, pow_mul, Complex.ext_iff, Complex.I_mul_I]
      <;> norm_num
      <;> simp_all [Complex.ext_iff, Complex.I_mul_I]
      <;> norm_num
      <;> simp_all [Complex.ext_iff, Complex.I_mul_I]
      <;> norm_num
  
  have h₂ : I ^ n = I ^ (n % 4) := by
    have h₃ : I ^ n = I ^ (n % 4) := by
      have h₄ : n % 4 < 4 := Nat.mod_lt n (by norm_num)
      have h₅ : n = 4 * (n / 4) + n % 4 := by
        have h₅₁ : 4 * (n / 4) + n % 4 = n := by
          have h₅₂ : 4 * (n / 4) + n % 4 = n := by
            omega
          exact h₅₂
        omega
      rw [h₅]
      rw [pow_add]
      have h₆ : I ^ (4 * (n / 4)) = 1 := h₁ (n / 4)
      rw [h₆]
      simp [Complex.ext_iff, pow_add, pow_mul, Complex.I_mul_I, h₀]
      <;>
      (try ring_nf) <;>
      (try simp_all [Complex.ext_iff, pow_add, pow_mul, Complex.I_mul_I, h₀]) <;>
      (try norm_num) <;>
      (try ring_nf) <;>
      (try simp_all [Complex.ext_iff, pow_add, pow_mul, Complex.I_mul_I, h₀]) <;>
      (try norm_num) <;>
      (try ring_nf) <;>
      (try simp_all [Complex.ext_iff, pow_add, pow_mul, Complex.I_mul_I, h₀]) <;>
      (try norm_num) <;>
      (try ring_nf) <;>
      (try simp_all [Complex.ext_iff, pow_add, pow_mul, Complex.I_mul_I, h₀]) <;>
      (try norm_num)
    exact h₃
  
  exact h₂