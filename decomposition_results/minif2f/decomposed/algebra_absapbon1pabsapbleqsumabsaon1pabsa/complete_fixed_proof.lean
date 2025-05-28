theorem algebra_absapbon1pabsapbleqsumabsaon1pabsa (a b : ℝ) :
  abs (a + b) / (1 + abs (a + b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b):=
  by
  have h₁ : abs (a + b) ≤ abs a + abs b:= by
    --  calc
    --    abs (a + b) ≤ abs a + abs b := by exact abs_add a b
    --    _ = abs a + abs b := by rfl
    hole
  have h₂ : ∀ (x y : ℝ), 0 ≤ x → x ≤ y → x / (1 + x) ≤ y / (1 + y):=
    by
    --  intro x y hx hxy
    have h₃ : 0 ≤ x := hx
    have h₄ : x ≤ y := hxy
    have h₅ : 0 ≤ y:= by -- linarith
      linarith
    have h₆ : 0 ≤ 1 + x:= by -- linarith
      linarith
    have h₇ : 0 ≤ 1 + y:= by -- linarith
      linarith
    have h₈ : 0 < 1 + x:= by -- linarith
      linarith
    have h₉ : 0 < 1 + y:= by -- linarith
      linarith
    have h₁₀ : x / (1 + x) ≤ y / (1 + y):=
      by
      --  rw [div_le_div_iff (by positivity) (by positivity)]
      --  nlinarith [mul_nonneg h₃ (sub_nonneg.mpr h₄), mul_nonneg h₅ h₃, mul_nonneg h₅ (sub_nonneg.mpr h₄)]
      hole
    --  exact h₁₀
    hole
  have h₃ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)):=
    by
    have h₄ : 0 ≤ abs (a + b) := abs_nonneg (a + b)
    have h₅ : 0 ≤ abs a + abs b:= by -- positivity
      linarith
    have h₆ : abs (a + b) ≤ abs a + abs b := h₁
    have h₇ : 0 ≤ 1 + abs (a + b):= by -- positivity
      linarith
    have h₈ : 0 ≤ 1 + (abs a + abs b):= by -- positivity
      linarith
    have h₉ : 0 < 1 + abs (a + b):= by -- positivity
      linarith
    have h₁₀ : 0 < 1 + (abs a + abs b):= by -- positivity
      linarith
    have h₁₁ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)):=
      by
      have h₁₂ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)):=
        by
        have h₁₃ : 0 ≤ abs (a + b):= by -- positivity
          norm_num
        have h₁₄ : abs (a + b) ≤ abs a + abs b := h₁
        have h₁₅ : 0 ≤ abs a + abs b:= by -- positivity
          linarith
        have h₁₆ : 0 < 1 + abs (a + b):= by -- positivity
          linarith
        have h₁₇ : 0 < 1 + (abs a + abs b):= by -- positivity
          linarith
        have h₁₈ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)):= by
          --  --  apply h₂ <;> try norm_num <;> linarith
          hole
        --  exact h₁₈
        linarith
      --  exact h₁₂
      linarith
    --  exact h₁₁
    linarith
  have h₄ : (abs a + abs b) / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b):=
    by
    have h₅ : 0 ≤ abs a := abs_nonneg a
    have h₆ : 0 ≤ abs b := abs_nonneg b
    have h₇ : 0 ≤ abs a + abs b:= by -- positivity
      linarith
    have h₈ : 0 < 1 + abs a:= by -- positivity
      linarith
    have h₉ : 0 < 1 + abs b:= by -- positivity
      linarith
    have h₁₀ : 0 < 1 + (abs a + abs b):= by -- positivity
      linarith
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) :=
      by field_simp [h₈, h₉, h₁₀] <;> ring <;> field_simp [h₈, h₉, h₁₀] <;> ring
    --  rw [h₁₁]
    have h₁₂ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a):=
      by
      have h₁₃ : 0 ≤ abs a := abs_nonneg a
      have h₁₄ : 0 < 1 + abs a:= by -- positivity
        linarith
      have h₁₅ : 0 < 1 + (abs a + abs b):= by -- positivity
        linarith
      have h₁₆ : 0 < 1 + abs a + abs b:= by -- positivity
        linarith
      have h₁₇ : 1 + abs a ≤ 1 + (abs a + abs b):= by -- nlinarith [h₆]
        norm_num
      have h₁₈ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a):= by
        --  apply div_le_div_of_le_left (by positivity) (by positivity) <;> nlinarith
        hole
      --  exact h₁₈
      linarith
    have h₁₃ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b):=
      by
      have h₁₄ : 0 ≤ abs b := abs_nonneg b
      have h₁₅ : 0 < 1 + abs b:= by -- positivity
        linarith
      have h₁₆ : 0 < 1 + (abs a + abs b):= by -- positivity
        linarith
      have h₁₇ : 0 < 1 + abs a + abs b:= by -- positivity
        linarith
      have h₁₈ : 1 + abs b ≤ 1 + (abs a + abs b):= by -- nlinarith [h₅]
        norm_num
      have h₁₉ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b):= by
        --  apply div_le_div_of_le_left (by positivity) (by positivity) <;> nlinarith
        hole
      --  exact h₁₉
      linarith
    have h₂₀ :
      abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
      linarith
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)):= by
      --  field_simp [h₈, h₉, h₁₀] <;> ring <;> field_simp [h₈, h₉, h₁₀] <;> ring
      ring
  have h₄ : (abs a + abs b) / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) :=
    by
    have h₅ : 0 ≤ abs a := abs_nonneg a
    have h₆ : 0 ≤ abs b := abs_nonneg b
    have h₇ : 0 ≤ abs a + abs b := by sorry
    have h₈ : 0 < 1 + abs a := by sorry
    have h₉ : 0 < 1 + abs b := by sorry
    have h₁₀ : 0 < 1 + (abs a + abs b) := by sorry
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) :=
      by field_simp [h₈, h₉, h₁₀] <;> ring <;> field_simp [h₈, h₉, h₁₀] <;> ring
    rw [h₁₁]
    have h₁₂ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) :=
      by
      have h₁₃ : 0 ≤ abs a := abs_nonneg a
      have h₁₄ : 0 < 1 + abs a := by positivity
      have h₁₅ : 0 < 1 + (abs a + abs b) := by positivity
      have h₁₆ : 0 < 1 + abs a + abs b := by positivity
      have h₁₇ : 1 + abs a ≤ 1 + (abs a + abs b) := by nlinarith [h₆]
      have h₁₈ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) := by
        apply div_le_div_of_le_left (by positivity) (by positivity) <;> nlinarith
      exact h₁₈
    have h₁₃ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) :=
      by
      have h₁₄ : 0 ≤ abs b := abs_nonneg b
      have h₁₅ : 0 < 1 + abs b := by positivity
      have h₁₆ : 0 < 1 + (abs a + abs b) := by positivity
      have h₁₇ : 0 < 1 + abs a + abs b := by positivity
      have h₁₈ : 1 + abs b ≤ 1 + (abs a + abs b) := by nlinarith [h₅]
      have h₁₉ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) := by
        apply div_le_div_of_le_left (by positivity) (by positivity) <;> nlinarith
      exact h₁₉
    have h₂₀ :
      abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
      linarith
    have h₂₀ : abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b):=
      --  by linarith
      hole
  have h₄ : (abs a + abs b) / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) :=
    by
    have h₅ : 0 ≤ abs a := abs_nonneg a
    have h₆ : 0 ≤ abs b := abs_nonneg b
    have h₇ : 0 ≤ abs a + abs b := by sorry
    have h₈ : 0 < 1 + abs a := by sorry
    have h₉ : 0 < 1 + abs b := by sorry
    have h₁₀ : 0 < 1 + (abs a + abs b) := by sorry
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) :=
      by field_simp [h₈, h₉, h₁₀] <;> ring <;> field_simp [h₈, h₉, h₁₀] <;> ring
    rw [h₁₁]
    have h₁₂ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) := by sorry
    have h₁₃ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) := by sorry
    have h₂₀ :
      abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
      linarith
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) := by sorry
  have h₄ : (abs a + abs b) / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) :=
    by
    have h₅ : 0 ≤ abs a := abs_nonneg a
    have h₆ : 0 ≤ abs b := abs_nonneg b
    have h₇ : 0 ≤ abs a + abs b := by sorry
    have h₈ : 0 < 1 + abs a := by sorry
    have h₉ : 0 < 1 + abs b := by sorry
    have h₁₀ : 0 < 1 + (abs a + abs b) := by sorry
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) :=
      by field_simp [h₈, h₉, h₁₀] <;> ring <;> field_simp [h₈, h₉, h₁₀] <;> ring
    rw [h₁₁]
    have h₁₂ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) :=
      by
      have h₁₃ : 0 ≤ abs a := abs_nonneg a
      have h₁₄ : 0 < 1 + abs a := by positivity
      have h₁₅ : 0 < 1 + (abs a + abs b) := by positivity
      have h₁₆ : 0 < 1 + abs a + abs b := by positivity
      have h₁₇ : 1 + abs a ≤ 1 + (abs a + abs b) := by nlinarith [h₆]
      have h₁₈ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) := by
        apply div_le_div_of_le_left (by positivity) (by positivity) <;> nlinarith
      exact h₁₈
    have h₁₃ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) :=
      by
      have h₁₄ : 0 ≤ abs b := abs_nonneg b
      have h₁₅ : 0 < 1 + abs b := by positivity
      have h₁₆ : 0 < 1 + (abs a + abs b) := by positivity
      have h₁₇ : 0 < 1 + abs a + abs b := by positivity
      have h₁₈ : 1 + abs b ≤ 1 + (abs a + abs b) := by nlinarith [h₅]
      have h₁₉ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) := by
        apply div_le_div_of_le_left (by positivity) (by positivity) <;> nlinarith
      exact h₁₉
    have h₂₀ :
      abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
      linarith
    linarith
    hole
  have h₅ : abs (a + b) / (1 + abs (a + b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b):= by
    --  calc
    --    abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)) := h₃
    --    _ ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := h₄
    linarith
  --  exact h₅
  linarith