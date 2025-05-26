theorem putnam_1971_b3 (T : ℝ) (hT : 0 < T) :
  MeasureTheory.volume {t : ℝ | t ≥ T ∧ Nat.floor t = 2 * (Nat.floor (t - T))} = 1:=
  by
  have h_main : False:= by
    --  by_contra h
    have h₁ : T > 0 := hT
    have h₂ : (T : ℝ) > 0:= by -- exact_mod_cast h₁
      linarith
    have h₃ : ∃ (t : ℝ), t ≥ T ∧ Nat.floor t = 2 * (Nat.floor (t - T)):=
      by
      --  use 2 * T
      have h₄ : (2 * T : ℝ) ≥ T:= by -- linarith
        linarith
      have h₅ : Nat.floor (2 * T : ℝ) = 2 * Nat.floor T:=
        by
        have h₅₁ : (Nat.floor T : ℝ) ≤ T := Nat.floor_le (by linarith)
        have h₅₂ : T < (Nat.floor T : ℝ) + 1 := Nat.lt_floor_add_one T
        have h₅₃ : (2 * (Nat.floor T : ℝ) : ℝ) ≤ 2 * T:= by -- linarith
          linarith
        have h₅₄ : 2 * T < (2 * (Nat.floor T : ℝ) : ℝ) + 2:= by -- linarith
          linarith
        have h₅₅ : Nat.floor (2 * T : ℝ) = 2 * Nat.floor T:=
          by
          --  rw [Int.floor_eq_iff]
          constructor <;> norm_num at h₅₁ h₅₂ h₅₃ h₅₄ ⊢ <;> (try norm_num) <;> (try linarith) <;>
              (try
                  {norm_num at h₅₁ h₅₂ h₅₃ h₅₄ ⊢ <;> (try norm_num) <;> (try linarith) <;>
                    (try
                        {cases' le_or_lt 0 (T - Nat.floor T) with h₅₆ h₅₆ <;>
                                  cases' le_or_lt 0 (2 * T - 2 * (Nat.floor T : ℝ)) with h₅₇ h₅₇ <;>
                                simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
                              (try norm_num) <;>
                            (try linarith) <;>
                          (try {nlinarith
                            })
                      })
                }) <;>
            (try
                {cases' le_or_lt 0 (T - Nat.floor T) with h₅₆ h₅₆ <;>
                          cases' le_or_lt 0 (2 * T - 2 * (Nat.floor T : ℝ)) with h₅₇ h₅₇ <;>
                        simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
                      (try norm_num) <;>
                    (try linarith) <;>
                  (try {nlinarith
                    })
              })
          hole
        --  exact h₅₅
        linarith
      have h₆ : Nat.floor ((2 * T : ℝ) - T) = Nat.floor T:=
        by
        have h₆₁ : (2 * T : ℝ) - T = T:= by -- ring
          linarith
        --  rw [h₆₁]
        ring
      have h₇ : Nat.floor (2 * T : ℝ) = 2 * Nat.floor ((2 * T : ℝ) - T):= by
        --  --  rw [h₆] <;> simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
              ring_nf at * <;>
            norm_num at * <;>
          linarith
        hole
      --  constructor
      --  · exact h₄
      --  · simpa [h₅, h₆, h₇] using h₇
      hole
    --  obtain ⟨t, ht₁, ht₂⟩ := h₃
    have h₄ : t ≥ T := ht₁
    have h₅ : Nat.floor t = 2 * (Nat.floor (t - T)) := ht₂
    have h₆ : (T : ℝ) > 0:= by -- exact_mod_cast h₁
      linarith
    have h₇ : False:= by
      --  by_contra h₇
      have h₈ : (Nat.floor t : ℝ) ≤ t:= by -- exact_mod_cast Nat.floor_le (by linarith)
        hole
      have h₉ : t < (Nat.floor t : ℝ) + 1:= by -- exact_mod_cast Nat.lt_floor_add_one t
        hole
      have h₁₀ : (Nat.floor (t - T) : ℝ) ≤ t - T:= by -- exact_mod_cast Nat.floor_le (by linarith)
        hole
      have h₁₁ : t - T < (Nat.floor (t - T) : ℝ) + 1:= by -- exact_mod_cast Nat.lt_floor_add_one (t - T)
        hole
      have h₁₂ : (Nat.floor t : ℝ) = 2 * (Nat.floor (t - T) : ℝ):= by
        --  norm_cast at h₅ ⊢ <;> simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
              ring_nf at * <;>
            norm_num at * <;>
          linarith
        hole
      have h₁₃ : (Nat.floor t : ℝ) ≤ t:= by -- exact_mod_cast Nat.floor_le (by linarith)
        linarith
      have h₁₄ : t < (Nat.floor t : ℝ) + 1:= by -- exact_mod_cast Nat.lt_floor_add_one t
        linarith
      have h₁₅ : (Nat.floor (t - T) : ℝ) ≤ t - T:= by -- exact_mod_cast Nat.floor_le (by linarith)
        linarith
      have h₁₆ : t - T < (Nat.floor (t - T) : ℝ) + 1:= by -- exact_mod_cast Nat.lt_floor_add_one (t - T)
        linarith
      have h₁₇ : (Nat.floor t : ℝ) = 2 * (Nat.floor (t - T) : ℝ):= by
        --  norm_cast at h₅ ⊢ <;> simp_all [Nat.floor_eq_iff, Int.floor_eq_iff, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
              ring_nf at * <;>
            norm_num at * <;>
          linarith
        hole
      --  nlinarith
      hole
    --  exact h₇
    hole
  have h_volume : MeasureTheory.volume {t : ℝ | t ≥ T ∧ Nat.floor t = 2 * (Nat.floor (t - T))} = 1:=
    by
    --  exfalso
    --  exact h_main
    hole
  --  exact h_volume
  simpa