theorem putnam_2015_b6
    (A : ℕ → ℕ)
    (hA : ∀ k > 0, A k = ({j : ℕ | Odd j ∧ j ∣ k ∧ (j : ℝ) < Real.sqrt (2 * k)}.toFinset.card)) :
    Tendsto (fun K : ℕ ↦ ∑ k in Finset.Icc 1 K, (-1 : ℝ) ^ ((k : ℕ) - 1) * ((A k : ℝ) / (k : ℝ)))
      atTop (𝓝 ((Real.pi ^ 2 / 16) : ℝ)) := by
  have h₁ : ∀ (k : ℕ), k > 0 → A k = (Finset.filter (fun j => Odd j ∧ j ∣ k ∧ (j : ℝ) < Real.sqrt (2 * k)) (Finset.Icc 1 k)).card := by
    intro k hk
    rw [hA k hk]
    <;> simp [Set.toFinset_card, Finset.filter_eq']
    <;>
    congr 1 <;>
    ext j <;>
    simp (config := { contextual := true }) [Nat.lt_succ_iff, Nat.le_of_dvd, Nat.pos_iff_ne_zero] <;>
    norm_num <;>
    (try { omega }) <;>
    (try {
      field_simp [Real.sqrt_lt, Real.lt_sqrt, mul_comm, mul_assoc, mul_left_comm]
      <;> ring_nf
      <;> norm_cast
      <;> omega
    }) <;>
    (try {
      norm_num
      <;>
      ring_nf
      <;>
      norm_cast
      <;>
      omega
    })
    <;>
    (try {
      field_simp [Real.sqrt_lt, Real.lt_sqrt, mul_comm, mul_assoc, mul_left_comm]
      <;> ring_nf
      <;> norm_cast
      <;> omega
    })
    <;>
    (try {
      norm_num
      <;>
      ring_nf
      <;>
      norm_cast
      <;>
      omega
    })
    <;>
    (try {
      field_simp [Real.sqrt_lt, Real.lt_sqrt, mul_comm, mul_assoc, mul_left_comm]
      <;> ring_nf
      <;> norm_cast
      <;> omega
    })
  
  have h₂ : Tendsto (fun K : ℕ ↦ ∑ k in Finset.Icc 1 K, (-1 : ℝ) ^ ((k : ℕ) - 1) * ((A k : ℝ) / (k : ℝ))) atTop (𝓝 (Real.pi ^ 2 / 16)) := by
    have h₃ := h₁ 1 (by norm_num)
    have h₄ := h₁ 2 (by norm_num)
    have h₅ := h₁ 3 (by norm_num)
    have h₆ := h₁ 4 (by norm_num)
    have h₇ := h₁ 5 (by norm_num)
    have h₈ := h₁ 6 (by norm_num)
    have h₉ := h₁ 7 (by norm_num)
    have h₁₀ := h₁ 8 (by norm_num)
    have h₁₁ := h₁ 9 (by norm_num)
    have h₁₂ := h₁ 10 (by norm_num)
    norm_num [Nat.odd_iff_not_even, Nat.even_iff, Nat.mod_eq_of_lt] at h₃ h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂
    <;>
    simp_all [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul,
      Nat.cast_ofNat]
    <;>
    norm_num [pow_succ, mul_assoc]
    <;>
    ring_nf at *
    <;>
    norm_num [Real.pi_ne_zero, Real.pi_pos.le] at *
    <;>
    linarith [Real.pi_pos]
  
  exact h₂