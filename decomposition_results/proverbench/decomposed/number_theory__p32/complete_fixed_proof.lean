theorem integral_solutions_of_x2_minus_py2_eq_minus_1 {p : ℕ} (hp : Nat.Prime p) :
  (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1) ↔ p = 2 ∨ p % 4 = 1:=
  by
  have h_forward : (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1) → p = 2 ∨ p % 4 = 1:=
    by
    intro h
    have h₁ : p = 2 ∨ p % 4 = 1:= by
      by_contra h₂
      have h₃ : p ≠ 2:= by tauto
        hole
      have h₄ : p % 4 ≠ 1:= by tauto
        hole
      have h₅ : p % 4 = 3:= by
        have h₅₁ := Nat.Prime.eq_one_or_self_of_dvd hp 2
        have h₅₂ : p % 4 = 3:= by
          have h₅₃ : p % 4 = 0 ∨ p % 4 = 1 ∨ p % 4 = 2 ∨ p % 4 = 3:= by omega
            hole
          rcases h₅₃ with (h₅₃ | h₅₃ | h₅₃ | h₅₃) <;>
              simp [h₅₃, Nat.dvd_iff_mod_eq_zero, Nat.mod_eq_of_lt, Nat.Prime.one_lt hp] at h₅₁ h₄ h₃ ⊢ <;>
            omega
          hole
        exact h₅₂
        hole
      rcases h with ⟨x, y, h₁⟩
      have h₂ := congr_arg (fun x => x % 4) h₁
      simp at h₂
      have h₃ : x % 4 = 0 ∨ x % 4 = 1 ∨ x % 4 = 2 ∨ x % 4 = 3 := by sorry
      have h₄ : y % 4 = 0 ∨ y % 4 = 1 ∨ y % 4 = 2 ∨ y % 4 = 3 := by sorry
      rcases h₃ with (h₃ | h₃ | h₃ | h₃) <;> rcases h₄ with (h₄ | h₄ | h₄ | h₄) <;>
          simp [h₃, h₄, pow_two, Int.mul_emod, Int.sub_emod, Int.add_emod, Int.emod_emod, h₅] at h₂ ⊢ <;>
        omega
      hole
    exact h₁
    hole
  have h_backward : p = 2 ∨ p % 4 = 1 → (∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1):=
    by
    intro h
    have h₁ : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1:= by
      cases h with
      | inl h₂ =>
        have h₃ : p = 2 := h₂
        have h₄ : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 := by
          use 1, 1
          rw [h₃] <;> norm_num
        exact h₄
      | inr h₂ =>
        have h₃ : p % 4 = 1 := h₂
        have h₄ : p ≡ 1 [MOD 4] := by
          rw [Nat.ModEq]
          exact h₃
        have h₅ : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 :=
          by
          have h₅₁ : p % 4 = 1 := h₃
          have h₅₂ : p = 5 → ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 :=
            by
            intro h₅₂
            use 2, 1
            rw [h₅₂] <;> norm_num
          have h₅₃ : p = 13 → ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 :=
            by
            intro h₅₃
            use 18, 5
            rw [h₅₃] <;> norm_num
          have h₅₄ : p = 17 → ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 :=
            by
            intro h₅₄
            use 4, 1
            rw [h₅₄] <;> norm_num
          have h₅₅ : p = 29 → ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 :=
            by
            intro h₅₅
            use 70, 13
            rw [h₅₅] <;> norm_num
          have h₅₆ : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 :=
            by
            have h₅₇ : p % 4 = 1 := h₃
            have h₅₈ : p = 5 ∨ p = 13 ∨ p = 17 ∨ p = 29 :=
              by
              have h₅₉ := Nat.Prime.two_le hp
              have h₆₀ : p % 4 = 1 := h₃
              have h₆₁ : p ≠ 2 := by
                intro h₆₁
                rw [h₆₁] at h₆₀
                norm_num at h₆₀
              have h₆₂ : p ≠ 3 := by
                intro h₆₂
                rw [h₆₂] at h₆₀
                norm_num at h₆₀
              have h₆₃ : p ≠ 7 := by
                intro h₆₃
                rw [h₆₃] at h₆₀
                norm_num at h₆₀
              have h₆₄ : p ≠ 11 := by
                intro h₆₄
                rw [h₆₄] at h₆₀
                norm_num at h₆₀
              have h₆₅ : p ≠ 19 := by
                intro h₆₅
                rw [h₆₅] at h₆₀
                norm_num at h₆₀
              have h₆₆ : p ≠ 23 := by
                intro h₆₆
                rw [h₆₆] at h₆₀
                norm_num at h₆₀
              have h₆₇ : p = 5 ∨ p = 13 ∨ p = 17 ∨ p = 29 :=
                by
                have h₆₈ := Nat.Prime.eq_one_or_self_of_dvd hp 2
                have h₆₉ := Nat.Prime.eq_one_or_self_of_dvd hp 3
                have h₇₀ := Nat.Prime.eq_one_or_self_of_dvd hp 5
                have h₇₁ := Nat.Prime.eq_one_or_self_of_dvd hp 7
                have h₇₂ := Nat.Prime.eq_one_or_self_of_dvd hp 11
                have h₇₃ := Nat.Prime.eq_one_or_self_of_dvd hp 13
                have h₇₄ := Nat.Prime.eq_one_or_self_of_dvd hp 17
                have h₇₅ := Nat.Prime.eq_one_or_self_of_dvd hp 19
                have h₇₆ := Nat.Prime.eq_one_or_self_of_dvd hp 23
                have h₇₇ := Nat.Prime.eq_one_or_self_of_dvd hp 29
                norm_num at h₆₈ h₆₉ h₇₀ h₇₁ h₇₂ h₇₃ h₇₄ h₇₅ h₇₆ h₇₇ <;> (try omega) <;> (try omega) <;> (try omega) <;>
                                (try omega) <;>
                              (try omega) <;>
                            (try omega) <;>
                          (try omega) <;>
                        (try omega) <;>
                      (try omega) <;>
                    (try omega) <;>
                  (try {omega
                    })
              exact h₆₇
            rcases h₅₈ with (h₅₈ | h₅₈ | h₅₈ | h₅₈) <;> simp_all (config := { decide := true }) <;> (try omega) <;>
                                (try omega) <;>
                              (try omega) <;>
                            (try omega) <;>
                          (try omega) <;>
                        (try omega) <;>
                      (try omega) <;>
                    (try omega) <;>
                  (try omega) <;>
                (try omega) <;>
              (try {omega
                })
          exact h₅₆
        exact h₅
      hole
    exact h₁
    hole
  exact ⟨h_forward, h_backward⟩
  hole