theorem i_pow_73 : I ^ 73 = I := by
  have h₁ : I ^ 4 = 1 := by
    norm_num [pow_succ, Complex.ext_iff, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    simp [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    norm_num
    <;>
    simp_all [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
    <;>
    norm_num
  
  have h₂ : I ^ 73 = I := by
    calc
      I ^ 73 = I ^ (4 * 18 + 1) := by norm_num
      _ = (I ^ 4) ^ 18 * I := by
        rw [pow_add, pow_mul]
        <;> simp [h₁, pow_succ, mul_assoc]
        <;> ring_nf
        <;> simp_all [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
        <;> norm_num
      _ = 1 ^ 18 * I := by rw [h₁]
      _ = I := by
        norm_num [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
        <;>
        simp [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
        <;>
        norm_num
        <;>
        simp_all [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I]
        <;>
        norm_num
  
  exact h₂