theorem aime_1983_p1 (x y z w : ℕ) (ht : 1 < x ∧ 1 < y ∧ 1 < z) (hw : 0 ≤ w) (h0 : Real.log w / Real.log x = 24)
  (h1 : Real.log w / Real.log y = 40) (h2 : Real.log w / Real.log (x * y * z) = 12) : Real.log w / Real.log z = 60:=
  by
  have hx : (x : ℝ) > 1:= by -- -- norm_cast <;> linarith [ht.1, ht.2.1, ht.2.2]
    linarith
  have hy : (y : ℝ) > 1:= by -- -- norm_cast <;> linarith [ht.1, ht.2.1, ht.2.2]
    linarith
  have hz : (z : ℝ) > 1:= by -- -- norm_cast <;> linarith [ht.1, ht.2.1, ht.2.2]
    linarith
  have hxyz : (x : ℝ) * y * z > 1:= by
    have h₁ : (x : ℝ) > 1 := hx
    have h₂ : (y : ℝ) > 1 := hy
    have h₃ : (z : ℝ) > 1 := hz
    have h₄ : (x : ℝ) * y > 1:= by -- nlinarith
      nlinarith
    --  nlinarith
    hole
  have hlogx : Real.log (x : ℝ) > 0:= by -- -- apply Real.log_pos <;> simpa using hx
    hole
  have hlogy : Real.log (y : ℝ) > 0:= by -- -- apply Real.log_pos <;> simpa using hy
    hole
  have hlogz : Real.log (z : ℝ) > 0:= by -- -- apply Real.log_pos <;> simpa using hz
    hole
  have hlogxyz : Real.log ((x : ℝ) * y * z) > 0:=
    by
    have h₁ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ):=
      by
      have h₂ : (x : ℝ) * y > 0:= by -- positivity
        nlinarith
      have h₃ : (z : ℝ) > 0:= by -- positivity
        linarith
      have h₄ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ):= by
        --  rw [Real.log_mul (by positivity) (by positivity)] <;> rw [Real.log_mul (by positivity) (by positivity)] <;> ring
        hole
      --  rw [h₄]
      linarith
    --  rw [h₁]
    have h₂ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ):=
      by
      have h₃ : 0 < (x : ℝ):= by -- positivity
        linarith
      have h₄ : 0 < (y : ℝ):= by -- positivity
        linarith
      --  rw [Real.log_mul (by positivity) (by positivity)]
      hole
    --  rw [h₂]
    have h₃ : Real.log (x : ℝ) > 0 := hlogx
    have h₄ : Real.log (y : ℝ) > 0 := hlogy
    have h₅ : Real.log (z : ℝ) > 0 := hlogz
    --  nlinarith
    linarith
  have hlogw_pos : Real.log (w : ℝ) > 0:=
    by
    have h₃ : Real.log (w : ℝ) / Real.log (x : ℝ) = 24:= by -- simpa using h0
      linarith
    have h₄ : Real.log (x : ℝ) > 0 := hlogx
    have h₅ : Real.log (w : ℝ) > 0:= by
      --  by_contra h
      have h₆ : Real.log (w : ℝ) ≤ 0:= by -- linarith
        linarith
      have h₇ : Real.log (w : ℝ) / Real.log (x : ℝ) ≤ 0:= by -- exact div_nonpos_of_nonpos_of_nonneg h₆ (by linarith)
        hole
      --  linarith
      linarith
    --  exact h₅
    linarith
  have hlogw_eq : Real.log (w : ℝ) = 24 * Real.log (x : ℝ):=
    by
    have h₃ : Real.log (w : ℝ) / Real.log (x : ℝ) = 24:= by -- simpa using h0
      linarith
    have h₄ : Real.log (x : ℝ) ≠ 0:= by -- linarith
      linarith
    have h₅ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ):= by -- -- field_simp [h₄] at h₃ ⊢ <;> linarith
      hole
    --  exact h₅
    linarith
  have hlogw_eq' : Real.log (w : ℝ) = 40 * Real.log (y : ℝ):=
    by
    have h₃ : Real.log (w : ℝ) / Real.log (y : ℝ) = 40:= by -- simpa using h1
      linarith
    have h₄ : Real.log (y : ℝ) ≠ 0:= by -- linarith
      linarith
    have h₅ : Real.log (w : ℝ) = 40 * Real.log (y : ℝ):= by -- -- field_simp [h₄] at h₃ ⊢ <;> linarith
      hole
    --  exact h₅
    linarith
  have hlogxy : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ):=
    by
    have h₁ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := hlogw_eq
    have h₂ : Real.log (w : ℝ) = 40 * Real.log (y : ℝ) := hlogw_eq'
    have h₃ : 24 * Real.log (x : ℝ) = 40 * Real.log (y : ℝ):= by -- linarith
      linarith
    have h₄ : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ):= by -- -- ring_nf at h₃ ⊢ <;> linarith
      linarith
    --  exact h₄
    linarith
  have hlogxyz_eq : Real.log (w : ℝ) = 12 * (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)):=
    by
    have h₃ : Real.log (w : ℝ) / Real.log ((x : ℝ) * y * z) = 12:= by -- simpa using h2
      linarith
    have h₄ : Real.log ((x : ℝ) * y * z) = Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ):=
      by
      have h₅ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ):=
        by
        have h₆ : 0 < (x : ℝ) * y:= by -- positivity
          nlinarith
        have h₇ : 0 < (z : ℝ):= by -- positivity
          linarith
        have h₈ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ):= by
          --  rw [Real.log_mul (by positivity) (by positivity)]
          hole
        --  rw [h₈]
        linarith
      --  rw [h₅]
      have h₉ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ):=
        by
        have h₁₀ : 0 < (x : ℝ):= by -- positivity
          linarith
        have h₁₁ : 0 < (y : ℝ):= by -- positivity
          linarith
        have h₁₂ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ):= by
          --  rw [Real.log_mul (by positivity) (by positivity)]
          hole
        --  rw [h₁₂]
        linarith
      --  rw [h₉] <;> ring
      linarith
    --  rw [h₄] at h₃
    have h₅ : Real.log (w : ℝ) / (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)) = 12:= by -- simpa using h₃
      linarith
    have h₆ : Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ) ≠ 0:=
      by
      --  by_contra h
      --  rw [h] at h₅
      --  norm_num at h₅ <;> linarith [hlogx, hlogy, hlogz]
      linarith
    --  --  field_simp [h₆] at h₅ ⊢ <;> nlinarith [hlogx, hlogy, hlogz, hlogw_pos, hlogw_eq, hlogw_eq', hlogxy]
    hole
  have hlogx_rel : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ):=
    by
    have h₃ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := hlogw_eq
    have h₄ : Real.log (w : ℝ) = 12 * (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)) := hlogxyz_eq
    have h₅ : 24 * Real.log (x : ℝ) = 12 * (Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ)):= by -- linarith
      linarith
    have h₆ : 2 * Real.log (x : ℝ) = Real.log (x : ℝ) + Real.log (y : ℝ) + Real.log (z : ℝ):= by -- linarith
      linarith
    have h₇ : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ):= by -- linarith
      linarith
    --  exact h₇
    linarith
  have hlogz_rel : Real.log (z : ℝ) = (2 : ℝ) / 5 * Real.log (x : ℝ):=
    by
    have h₃ : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ) := hlogxy
    have h₄ : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ) := hlogx_rel
    have h₅ : Real.log (y : ℝ) = (3 : ℝ) / 5 * Real.log (x : ℝ):=
      by
      have h₅₁ : 3 * Real.log (x : ℝ) = 5 * Real.log (y : ℝ) := hlogxy
      have h₅₂ : Real.log (y : ℝ) = (3 : ℝ) / 5 * Real.log (x : ℝ):=
        by
        --  apply mul_left_cancel₀ (show (5 : ℝ) ≠ 0 by norm_num)
        --  nlinarith
        linarith
      --  exact h₅₂
      linarith
    have h₆ : Real.log (z : ℝ) = (2 : ℝ) / 5 * Real.log (x : ℝ):=
      by
      have h₆₁ : Real.log (x : ℝ) = Real.log (y : ℝ) + Real.log (z : ℝ) := hlogx_rel
      --  rw [h₅] at h₆₁
      --  --  ring_nf at h₆₁ ⊢ <;> nlinarith
      linarith
    --  exact h₆
    linarith
  have hgoal : Real.log (w : ℝ) / Real.log (z : ℝ) = 60:=
    by
    have h₃ : Real.log (w : ℝ) = 24 * Real.log (x : ℝ) := hlogw_eq
    have h₄ : Real.log (z : ℝ) = (2 : ℝ) / 5 * Real.log (x : ℝ) := hlogz_rel
    --  rw [h₃, h₄]
    have h₅ : Real.log (x : ℝ) ≠ 0:= by -- linarith [hlogx]
      linarith
    --  --  field_simp [h₅] <;> ring_nf <;> field_simp [h₅] <;> nlinarith [hlogx, hlogy, hlogz]
    hole
  --  simpa using hgoal
  linarith