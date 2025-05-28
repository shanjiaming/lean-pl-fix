theorem algebra_9onxpypzleqsum2onxpy (x y z : ℝ) (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) :
  9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x):=
  by
  have h₁ : 0 < x + y:= by -- linarith
    linarith
  have h₂ : 0 < y + z:= by -- linarith
    linarith
  have h₃ : 0 < z + x:= by -- linarith
    linarith
  have h₄ : 0 < x + y + z:= by -- linarith
    linarith
  have h₅ : 0 < (x + y) * (y + z) * (z + x):= by -- positivity
    positivity
  have h₆ : 0 < (x + y) * (y + z):= by -- positivity
    nlinarith
  have h₇ : 0 < (y + z) * (z + x):= by -- positivity
    nlinarith
  have h₈ : 0 < (z + x) * (x + y):= by -- positivity
    nlinarith
  have h₉ : 2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9:=
    by
    have h₉₁ : 0 < x + y:= by -- linarith
      linarith
    have h₉₂ : 0 < y + z:= by -- linarith
      linarith
    have h₉₃ : 0 < z + x:= by -- linarith
      linarith
    have h₉₄ : 0 < (x + y) * (y + z):= by -- positivity
      linarith
    have h₉₅ : 0 < (y + z) * (z + x):= by -- positivity
      linarith
    have h₉₆ : 0 < (z + x) * (x + y):= by -- positivity
      linarith
    --  field_simp [h₉₁.ne', h₉₂.ne', h₉₃.ne']
    --  rw [le_div_iff (by positivity)]
    nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x), sq_nonneg (x + y - y - z),
      sq_nonneg (y + z - z - x), sq_nonneg (z + x - x - y)]
    hole
  have h₁₀ : (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 / (2 * (x + y + z)):=
    by
    have h₁₀₁ : 0 < x + y + z:= by -- linarith
      linarith
    have h₁₀₂ : 0 < 2 * (x + y + z):= by -- positivity
      linarith
    have h₁₀₃ : 0 < x + y:= by -- linarith
      linarith
    have h₁₀₄ : 0 < y + z:= by -- linarith
      linarith
    have h₁₀₅ : 0 < z + x:= by -- linarith
      linarith
    --  calc
    --    (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 / (2 * (x + y + z)) :=
    --      by
    --      have h₁₀₆ : 2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 := by simpa [add_assoc] using h₉
    --      calc
    --        (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) =
    --            (2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x))) / (2 * (x + y + z)) :=
    --          by field_simp [h₁₀₁.ne', h₁₀₂.ne'] <;> ring <;> field_simp [h₁₀₁.ne', h₁₀₂.ne'] <;> ring
    --        _ ≥ 9 / (2 * (x + y + z)) := by
    --          rw [ge_iff_le]
    --          rw [div_le_div_iff (by positivity) (by positivity)]
    --          nlinarith
    --    _ = 9 / (2 * (x + y + z)) := by rfl
    hole
  have h₁₁ : (2 / (x + y) + 2 / (y + z) + 2 / (z + x)) ≥ 9 / (x + y + z):=
    by
    have h₁₁₁ : 2 / (x + y) + 2 / (y + z) + 2 / (z + x) = 2 * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)):= by -- ring
      ring
    --  rw [h₁₁₁]
    have h₁₁₂ : 9 / (x + y + z) = 2 * (9 / (2 * (x + y + z))):= by
      --  --  field_simp [h₄.ne'] <;> ring <;> field_simp [h₄.ne'] <;> ring
      hole
    --  rw [h₁₁₂]
    have h₁₁₃ : 1 / (x + y) + 1 / (y + z) + 1 / (z + x) ≥ 9 / (2 * (x + y + z)):= by -- linarith
      linarith
    --  nlinarith
    linarith
  have h₁₂ : 9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x):= by -- linarith
    linarith
  --  exact h₁₂
  linarith