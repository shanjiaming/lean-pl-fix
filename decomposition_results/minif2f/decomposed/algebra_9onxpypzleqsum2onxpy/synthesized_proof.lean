macro "hole_23" : tactic => `(tactic| admit)

theorem algebra_9onxpypzleqsum2onxpy (x y z : ℝ) (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) :
    9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by
  have h₁ : 0 < x + y := by linarith
  have h₂ : 0 < y + z := by linarith
  have h₃ : 0 < z + x := by linarith
  have h₄ : 0 < x + y + z := by linarith
  have h₅ : 0 < (x + y) * (y + z) * (z + x) := by positivity
  have h₆ : 0 < (x + y) * (y + z) := by nlinarith
  have h₇ : 0 < (y + z) * (z + x) := by nlinarith
  have h₈ : 0 < (z + x) * (x + y) := by nlinarith
  have h₉ : 2 * (x + y + z) * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 := by
    have h₉₁ : 0 < x + y := by linarith
    have h₉₂ : 0 < y + z := by linarith
    have h₉₃ : 0 < z + x := by linarith
    have h₉₄ : 0 < (x + y) * (y + z) := by linarith
    have h₉₅ : 0 < (y + z) * (z + x) := by linarith
    have h₉₆ : 0 < (z + x) * (x + y) := by linarith
    admit
  
  have h₁₀ : (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) ≥ 9 / (2 * (x + y + z)) := by
    have h₁₀₁ : 0 < x + y + z := by linarith
    have h₁₀₂ : 0 < 2 * (x + y + z) := by linarith
    have h₁₀₃ : 0 < x + y := by linarith
    have h₁₀₄ : 0 < y + z := by linarith
    have h₁₀₅ : 0 < z + x := by linarith
    
    admit
  
  have h₁₁ : (2 / (x + y) + 2 / (y + z) + 2 / (z + x)) ≥ 9 / (x + y + z) := by
    have h₁₁₁ : 2 / (x + y) + 2 / (y + z) + 2 / (z + x) = 2 * (1 / (x + y) + 1 / (y + z) + 1 / (z + x)) := by
      ring
    rw [h₁₁₁]
    have h₁₁₂ : 9 / (x + y + z) = 2 * (9 / (2 * (x + y + z))) := by
      admit
    rw [h₁₁₂]
    have h₁₁₃ : 1 / (x + y) + 1 / (y + z) + 1 / (z + x) ≥ 9 / (2 * (x + y + z)) := by
      linarith
    linarith
  
  have h₁₂ : 9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by
    linarith
  
  linarith
