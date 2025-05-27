theorem product_of_six_consecutive_integers_not_fifth_power :
  ∀ (n : ℕ),
    ∀ (a b c d e f : ℕ),
      (a * b * c * d * e * f = n ^ 5) → (a + 1 = b ∧ b + 1 = c ∧ c + 1 = d ∧ d + 1 = e ∧ e + 1 = f) → False:=
  by
  --  intro n a b c d e f h_product h_consecutive
  have h₁ : f = a + 5:= by
    have h₂ : a + 1 = b := h_consecutive.1
    have h₃ : b + 1 = c := h_consecutive.2.1
    have h₄ : c + 1 = d := h_consecutive.2.2.1
    have h₅ : d + 1 = e := h_consecutive.2.2.2.1
    have h₆ : e + 1 = f := h_consecutive.2.2.2.2
    have h₇ : f = a + 5:= by -- omega
      linarith
    --  exact h₇
    linarith
  have h₂ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5):=
    by
    have h₃ : a + 1 = b := h_consecutive.1
    have h₄ : b + 1 = c := h_consecutive.2.1
    have h₅ : c + 1 = d := h_consecutive.2.2.1
    have h₆ : d + 1 = e := h_consecutive.2.2.2.1
    have h₇ : e + 1 = f := h_consecutive.2.2.2.2
    have h₈ : f = a + 5 := h₁
    have h₉ : b = a + 1:= by -- omega
      linarith
    have h₁₀ : c = a + 2:= by -- omega
      linarith
    have h₁₁ : d = a + 3:= by -- omega
      linarith
    have h₁₂ : e = a + 4:= by -- omega
      linarith
    have h₁₃ : f = a + 5:= by -- omega
      linarith
    --  rw [h₉, h₁₀, h₁₁, h₁₂, h₁₃] at * <;> ring_nf at * <;> nlinarith
    hole
  have h₃ : a = 0:= by
    --  by_contra h
    have h₄ : a ≥ 1:= by -- omega
      omega
    have h₅ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5:= by -- linarith
      linarith
    have h₆ : False:=
      by
      have h₇ : n ≥ 1:= by
        --  by_contra hn
        have hn' : n = 0:= by -- omega
          linarith
        --  rw [hn'] at h₅
        have h₈ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = 0:= by -- -- simp at h₅ ⊢ <;> nlinarith
          linarith
        have h₉ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > 0:=
          by
          have h₁₀ : a ≥ 1:= by -- omega
            linarith
          have h₁₁ : a + 1 > 0:= by -- nlinarith
            norm_num
          have h₁₂ : a + 2 > 0:= by -- nlinarith
            norm_num
          have h₁₃ : a + 3 > 0:= by -- nlinarith
            norm_num
          have h₁₄ : a + 4 > 0:= by -- nlinarith
            norm_num
          have h₁₅ : a + 5 > 0:= by -- nlinarith
            norm_num
          --  positivity
          simpa
        --  omega
        linarith
      have h₈ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) = n ^ 5:= by -- linarith
        linarith
      have h₉ : False:=
        by
        have h₁₀ : 5 ∣ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5):=
          by
          --  apply Nat.dvd_of_mod_eq_zero
          have h₁₁ : a % 5 = 0 ∨ a % 5 = 1 ∨ a % 5 = 2 ∨ a % 5 = 3 ∨ a % 5 = 4:= by -- omega
            omega
          --  rcases h₁₁ with (h₁₁ | h₁₁ | h₁₁ | h₁₁ | h₁₁) <;>
          --            simp [h₁₁, Nat.mul_mod, Nat.add_mod, Nat.mod_mod, Nat.pow_succ, Nat.mod_eq_of_lt, Nat.succ_pos,
          --              Nat.zero_lt_succ, Nat.mod_self, Nat.mod_one, Nat.mod_zero] <;>
                  norm_num <;>
                (try omega) <;>
              (try ring_nf at * <;> omega) <;>
            (try omega)
          hole
        have h₁₁ : 5 ∣ n ^ 5:= by -- omega
          omega
        have h₁₂ : 5 ∣ n:= by
          have h₁₃ : 5 ∣ n ^ 5 := h₁₁
          --  exact Nat.Prime.dvd_of_dvd_pow (by decide) h₁₃
          hole
        have h₁₃ : n ^ 5 ≠ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5):=
          by
          --  intro h
          have h₁₄ : a ≥ 1:= by omega
            hole
          have h₁₅ : n ^ 5 = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by linarith
          have h₁₆ : 5 ∣ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := h₁₀
          have h₁₇ : 5 ∣ n ^ 5 := h₁₁
          have h₁₈ : 5 ∣ n := h₁₂
          have h₁₉ : False :=
            by
            have h₂₀ : a ≤ 5 := by
              by_contra h₂₀
              have h₂₁ : a ≥ 6 := by omega
              have h₂₂ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > n ^ 5 :=
                by
                have h₂₃ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > n ^ 5 :=
                  by
                  have h₂₄ : n < a + 3 := by
                    by_contra h₂₄
                    have h₂₅ : n ≥ a + 3 := by omega
                    have h₂₆ : n ^ 5 ≥ (a + 3) ^ 5 := by
                      calc
                        n ^ 5 ≥ (a + 3) ^ 5 := by exact Nat.pow_le_pow_of_le_left h₂₅ 5
                        _ = (a + 3) ^ 5 := by ring
                    have h₂₇ : (a + 3) ^ 5 > a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) :=
                      by
                      have h₂₈ : a ≥ 6 := by omega
                      have h₂₉ : (a + 3) ^ 5 > a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by
                        nlinarith [sq_nonneg (a ^ 2), sq_nonneg ((a + 1) ^ 2), sq_nonneg ((a + 2) ^ 2), sq_nonneg ((a + 3) ^ 2),
                            sq_nonneg ((a + 4) ^ 2), sq_nonneg ((a + 5) ^ 2), sq_nonneg (a * (a + 1)), sq_nonneg (a * (a + 2)),
                            sq_nonneg (a * (a + 3)), sq_nonneg (a * (a + 4)), sq_nonneg (a * (a + 5)),
                            sq_nonneg ((a + 1) * (a + 2)), sq_nonneg ((a + 1) * (a + 3)), sq_nonneg ((a + 1) * (a + 4)),
                            sq_nonneg ((a + 1) * (a + 5)), sq_nonneg ((a + 2) * (a + 3)), sq_nonneg ((a + 2) * (a + 4)),
                            sq_nonneg ((a + 2) * (a + 5)), sq_nonneg ((a + 3) * (a + 4)), sq_nonneg ((a + 3) * (a + 5)),
                            sq_nonneg ((a + 4) * (a + 5))] <;>
                          nlinarith
                      exact h₂₉
                    nlinarith <;> nlinarith
                  have h₂₅ : n < a + 3 := by omega
                  have h₂₆ : n ^ 5 < (a + 3) ^ 5 := by exact Nat.pow_lt_pow_of_lt_left h₂₅ (by omega)
                  have h₂₇ : (a + 3) ^ 5 ≤ a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := by
                    nlinarith [sq_nonneg (a ^ 2), sq_nonneg ((a + 1) ^ 2), sq_nonneg ((a + 2) ^ 2), sq_nonneg ((a + 3) ^ 2),
                      sq_nonneg ((a + 4) ^ 2), sq_nonneg ((a + 5) ^ 2), sq_nonneg (a * (a + 1)), sq_nonneg (a * (a + 2)),
                      sq_nonneg (a * (a + 3)), sq_nonneg (a * (a + 4)), sq_nonneg (a * (a + 5)), sq_nonneg ((a + 1) * (a + 2)),
                      sq_nonneg ((a + 1) * (a + 3)), sq_nonneg ((a + 1) * (a + 4)), sq_nonneg ((a + 1) * (a + 5)),
                      sq_nonneg ((a + 2) * (a + 3)), sq_nonneg ((a + 2) * (a + 4)), sq_nonneg ((a + 2) * (a + 5)),
                      sq_nonneg ((a + 3) * (a + 4)), sq_nonneg ((a + 3) * (a + 5)), sq_nonneg ((a + 4) * (a + 5))]
                  nlinarith
                exact h₂₃
              have h₂₄ : a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) > n ^ 5 := by omega
              omega
            interval_cases a <;> norm_num at h₅ ⊢ <;> (try omega) <;>
              (try {rcases n with (_ | _ | _ | _ | _ | _ | _ | n) <;> norm_num at h₅ ⊢ <;> ring_nf at h₅ ⊢ <;> omega
                })
          exact h₁₉
          hole
        --  omega
        omega
      --  exact h₉
      simpa
    --  exact h₆ <;> omega
    norm_cast
  have h₄ : False := by
    have h₅ : a = 0 := h₃
    have h₆ : a * b * c * d * e * f = n ^ 5 := h_product
    have h₇ : a + 1 = b := h_consecutive.1
    have h₈ : b + 1 = c := h_consecutive.2.1
    have h₉ : c + 1 = d := h_consecutive.2.2.1
    have h₁₀ : d + 1 = e := h_consecutive.2.2.2.1
    have h₁₁ : e + 1 = f := h_consecutive.2.2.2.2
    have h₁₂ : f = a + 5 := h₁
    have h₁₃ : a * b * c * d * e * f = a * (a + 1) * (a + 2) * (a + 3) * (a + 4) * (a + 5) := h₂
    rw [h₅] at h₆ h₁₃
    simp at h₆ h₁₃ <;> (try omega) <;> (try nlinarith) <;> (try ring_nf at h₆ h₁₃ ⊢) <;> (try omega) <;>
            (try nlinarith) <;>
          (try ring_nf at h₆ h₁₃ ⊢) <;>
        (try omega) <;>
      (try nlinarith)
  --  exact h₄
  hole