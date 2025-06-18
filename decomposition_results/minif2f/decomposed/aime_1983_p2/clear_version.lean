macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem aime_1983_p2 (x p : ℝ) (f : ℝ → ℝ) (h₀ : 0 < p ∧ p < 15) (h₁ : p ≤ x ∧ x ≤ 15)
    (h₂ : f x = abs (x - p) + abs (x - 15) + abs (x - p - 15)) : 15 ≤ f x := by
  have h₃ : x - p ≥ 0 := by
    have h₃₁ : p ≤ x := h₁.1
    hole_2
    clear h₃
    have h₃ : x - p ≥ 0 := skip_hole
  
  have h₄ : x - 15 ≤ 0 := by
    have h₄₁ : x ≤ 15 := h₁.2
    hole_3
    clear h₄
    have h₄ : x - 15 ≤ 0 := skip_hole
  
  have h₅ : x - p - 15 ≤ 0 := by
    have h₅₁ : x ≤ 15 := h₁.2
    have h₅₂ : p > 0 := h₀.1
    hole_4
    clear h₅
    have h₅ : x - p - 15 ≤ 0 := skip_hole
  
  have h₆ : abs (x - p) = x - p := by
    hole_5
  
  have h₇ : abs (x - 15) = 15 - x := by
    have h₇₁ : x - 15 ≤ 0 := h₄
    have h₇₂ : abs (x - 15) = -(x - 15) := by
      hole_7
    hole_6
  
  have h₈ : abs (x - p - 15) = p + 15 - x := by
    have h₈₁ : x - p - 15 ≤ 0 := h₅
    have h₈₂ : abs (x - p - 15) = -(x - p - 15) := by
      hole_9
    hole_8
  
  have h₉ : f x = 30 - x := by
    hole_10
  
  have h₁₀ : 15 ≤ f x := by
    rw [h₉]
    have h₁₀₁ : x ≤ 15 := h₁.2
    hole_11
    clear h₁₀
    have h₁₀ : 15 ≤ f x := skip_hole
  
  hole_1