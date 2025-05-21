lemma scalar_multiplication (n : ℕ) (a b : ZMod 3) : n • (a, b) = (n • a, n • b) := by
  simp [Prod.smul_def]
  <;> aesop

lemma multiple_of_3 (n : ℕ) (a : ZMod 3) : (a ≠ 0 → (n • a = 0 ↔ n % 3 = 0)) := by
  intro h_a_ne_zero
  have h₁ : a ≠ 0 := h_a_ne_zero
  have h₂ : (n • a = 0 ↔ n % 3 = 0) := by
    have h₃ : a = 1 ∨ a = 2 := by
      fin_cases a <;> simp_all (config := {decide := true})
    rcases h₃ with (rfl | rfl)
    · -- Case a = 1
      simp [Nat.smul_one_eq_cast, ZMod.nat_cast_zmod_eq_zero_iff_dvd]
      <;>
      (try decide) <;>
      (try omega) <;>
      (try
        {
          norm_num
          <;>
          omega
        })
    · -- Case a = 2
      simp [ZMod.nat_cast_self, Nat.smul_one_eq_cast, ZMod.nat_cast_zmod_eq_zero_iff_dvd]
      <;>
      (try decide) <;>
      (try omega) <;>
      (try
        {
          norm_num
          <;>
          omega
        })
  exact h₂

theorem characteristic_Z3xZ3 : evalChar = 3 := by
  have h_main : ringChar (ZMod 3 × ZMod 3) = 3 := by
    apply Eq.symm
    apply Eq.symm
    -- Prove that the ring characteristic of ZMod 3 × ZMod 3 is 3
    rw [ringChar.eq]
    -- Check that n = 3 is the smallest natural number such that (n : ZMod 3 × ZMod 3) = 0
    <;> simp [ZMod.nat_cast_zmod_eq_zero_iff_dvd, Nat.dvd_iff_mod_eq_zero, Prod.ext_iff]
    <;> norm_num
    <;> decide
  
  have h_final : evalChar = 3 := by
    rw [evalChar]
    rw [h_main]
    <;> rfl
  
  exact h_final