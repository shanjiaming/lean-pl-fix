theorem putnam_1986_b3
    (n p : ℕ)
    (nppos : n > 0 ∧ p > 0)
    (pprime : Nat.Prime p)
    (cong : Polynomial ℤ → Polynomial ℤ → ℤ → Prop)
    (hcong : ∀ f g m, cong f g m ↔ ∀ i : ℕ, m ∣ (f - g).coeff i)
    (f g h r s : Polynomial ℤ)
    (hcoprime : cong (r * f + s * g) 1 p)
    (hprod : cong (f * g) h p)
    : (∃ F G : Polynomial ℤ, cong F f p ∧ cong G g p ∧ cong (F * G) h (p ^ n)) := by
  have h₁ : n = 1 ∨ n > 1 := by
    have h₂ : n > 0 := nppos.1
    cases n with
    | zero =>
      exfalso
      linarith
    | succ n =>
      cases n with
      | zero =>
        exact Or.inl rfl
      | succ n =>
        apply Or.inr
        <;> simp_all [Nat.succ_eq_add_one, Nat.add_assoc]
        <;> omega

  have h₂ : ∃ (F G : Polynomial ℤ), cong F f p ∧ cong G g p ∧ cong (F * G) h (p ^ n) := by
    have h₃ : n = 1 ∨ n > 1 := h₁
    have h₄ : n = 1 → ∃ (F G : Polynomial ℤ), cong F f p ∧ cong G g p ∧ cong (F * G) h (p ^ n) := by
      intro hn
      have hn' : (p : ℤ) ^ n = (p : ℤ) := by
        rw [hn]
        <;> simp
      have h₅ : cong (f * g) h (p ^ n) := by
        rw [hn']
        exact hprod
      refine' ⟨f, g, _⟩
      constructor
      · -- Prove cong F f p
        have h₆ : cong f f p := by
          rw [hcong]
          intro i
          simp [coeff_sub, sub_self]
          <;> simp_all [Int.emod_eq_zero_of_dvd]
          <;> simp_all [Int.emod_eq_zero_of_dvd]
          <;> simp_all [Int.emod_eq_zero_of_dvd]
        exact h₆
      constructor
      · -- Prove cong G g p
        have h₇ : cong g g p := by
          rw [hcong]
          intro i
          simp [coeff_sub, sub_self]
          <;> simp_all [Int.emod_eq_zero_of_dvd]
          <;> simp_all [Int.emod_eq_zero_of_dvd]
          <;> simp_all [Int.emod_eq_zero_of_dvd]
        exact h₇
      · -- Prove cong (F * G) h (p ^ n)
        have h₈ : cong (f * g) h (p ^ n) := h₅
        simpa [hn'] using h₈
    have h₅ : n > 1 → ∃ (F G : Polynomial ℤ), cong F f p ∧ cong G g p ∧ cong (F * G) h (p ^ n) := by
      intro hn
      have h₆ : p > 0 := nppos.2
      have h₇ : (p : ℤ) > 0 := by exact_mod_cast h₆
      have h₈ : (p : ℤ) ^ n > 0 := by positivity
      -- We use the fact that p > 0 and n > 0 to simplify our proof.
      have h₉ : ∀ i : ℕ, (p : ℤ) ^ n ∣ (0 : Polynomial ℤ).coeff i := by
        intro i
        simp [coeff_zero]
        <;>
        simp_all [Int.emod_eq_zero_of_dvd]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        simp_all [Int.emod_eq_zero_of_dvd]
      -- We use the fact that p > 0 and n > 0 to simplify our proof.
      have h₁₀ : cong (0 : Polynomial ℤ) (0 : Polynomial ℤ) (p ^ n) := by
        rw [hcong]
        intro i
        simpa using h₉ i
      -- We use the fact that p > 0 and n > 0 to simplify our proof.
      refine' ⟨0, 0, _⟩
      have h₁₁ : cong (0 : Polynomial ℤ) f p := by
        have h₁₂ : cong (r * f + s * g) 1 p := hcoprime
        have h₁₃ : ∀ i : ℕ, (p : ℤ) ∣ (r * f + s * g - 1).coeff i := by
          rw [hcong] at h₁₂
          exact h₁₂
        have h₁₄ : ∀ i : ℕ, (p : ℤ) ∣ (0 - f).coeff i := by
          intro i
          have h₁₅ := h₁₃ 0
          have h₁₆ := h₁₃ 1
          have h₁₇ := h₁₃ ( Polynomial.natDegree (r * f + s * g) )
          have h₁₈ := h₁₃ ( Polynomial.natDegree (r * f + s * g) + 1)
          simp [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
            Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc] at h₁₅ h₁₆ h₁₇ h₁₈ ⊢
          <;>
          (try omega) <;>
          (try ring_nf at h₁₅ h₁₆ h₁₇ h₁₈ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd]) <;>
          (try omega) <;>
          (try ring_nf at h₁₅ h₁₆ h₁₇ h₁₈ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd]) <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
          <;>
          (try
            ring_nf at h₁₅ h₁₆ h₁₇ h₁₈ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd])
          <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
          <;>
          (try
            ring_nf at h₁₅ h₁₆ h₁₇ h₁₈ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd])
          <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
          <;>
          (try
            ring_nf at h₁₅ h₁₆ h₁₇ h₁₈ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd])
          <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
        rw [hcong]
        exact h₁₄
      have h₁₂ : cong (0 : Polynomial ℤ) g p := by
        have h₁₃ : cong (r * f + s * g) 1 p := hcoprime
        have h₁₄ : ∀ i : ℕ, (p : ℤ) ∣ (r * f + s * g - 1).coeff i := by
          rw [hcong] at h₁₃
          exact h₁₃
        have h₁₅ : ∀ i : ℕ, (p : ℤ) ∣ (0 - g).coeff i := by
          intro i
          have h₁₆ := h₁₄ 0
          have h₁₇ := h₁₄ 1
          have h₁₈ := h₁₄ ( Polynomial.natDegree (r * f + s * g) )
          have h₁₉ := h₁₄ ( Polynomial.natDegree (r * f + s * g) + 1)
          simp [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
            Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc] at h₁₆ h₁₇ h₁₈ h₁₉ ⊢
          <;>
          (try omega) <;>
          (try ring_nf at h₁₆ h₁₇ h₁₈ h₁₉ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd]) <;>
          (try omega) <;>
          (try ring_nf at h₁₆ h₁₇ h₁₈ h₁₉ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd]) <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
          <;>
          (try
            ring_nf at h₁₆ h₁₇ h₁₈ h₁₉ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd])
          <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
          <;>
          (try
            ring_nf at h₁₆ h₁₇ h₁₈ h₁₉ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd])
          <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
          <;>
          (try
            ring_nf at h₁₆ h₁₇ h₁₈ h₁₉ ⊢ <;> simp_all [Int.emod_eq_zero_of_dvd])
          <;>
          (try omega)
          <;>
          (try
            simp_all [coeff_sub, coeff_add, coeff_mul, coeff_one, Finset.sum_range_succ, Finset.sum_range_zero,
              Nat.cast_zero, Nat.cast_add, Nat.cast_one, Nat.cast_succ, add_assoc])
          <;>
          (try omega)
        rw [hcong]
        exact h₁₅
      have h₁₃ : cong (0 * 0 : Polynomial ℤ) h (p ^ n) := by
        have h₁₄ : cong (0 : Polynomial ℤ) (0 : Polynomial ℤ) (p ^ n) := by
          rw [hcong]
          intro i
          simpa using h₉ i
        have h₁₅ : cong (0 * 0 : Polynomial ℤ) h (p ^ n) := by
          have h₁₆ : (0 : Polynomial ℤ) * 0 = 0 := by simp
          rw [h₁₆]
          have h₁₇ : cong (0 : Polynomial ℤ) h (p ^ n) := by
            have h₁₈ : ∀ i : ℕ, (p : ℤ) ^ n ∣ (0 - h).coeff i := by
              intro i
              have h₁₉ := h₉ i
              simpa [coeff_sub, coeff_zero] using h₁₉
            rw [hcong]
            simpa [coeff_sub, coeff_zero] using h₁₈
          exact h₁₇
        exact h₁₅
      exact ⟨by simpa using h₁₁, by simpa using h₁₂, by simpa using h₁₃⟩
    -- We handle the two cases separately.
    cases h₃ with
    | inl hn =>
      exact h₄ hn
    | inr hn =>
      exact h₅ hn
  exact h₂