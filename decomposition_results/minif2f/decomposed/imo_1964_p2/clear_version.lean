macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem imo_1964_p2 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : c < a + b) (h₂ : b < a + c)
    (h₃ : a < b + c) :
    a ^ 2 * (b + c - a) + b ^ 2 * (c + a - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c := by
  have h₄ : 0 < b + c - a := by
    hole_2
  clear h₄
  have h₄ : 0 < b + c - a := skip_hole
  
  have h₅ : 0 < c + a - b := by
    hole_3
  clear h₅
  have h₅ : 0 < c + a - b := skip_hole
  
  have h₆ : 0 < a + b - c := by
    hole_4
  clear h₆
  have h₆ : 0 < a + b - c := skip_hole
  
  have h₇ : 0 < (b + c - a) * (c + a - b) * (a + b - c) := by
    have h₇₁ : 0 < b + c - a := h₄
    have h₇₂ : 0 < c + a - b := h₅
    have h₇₃ : 0 < a + b - c := h₆
    have h₇₄ : 0 < (b + c - a) * (c + a - b) := by hole_6
    have h₇₅ : 0 < (b + c - a) * (c + a - b) * (a + b - c) := by hole_7
    hole_5
    clear h₇
    have h₇ : 0 < (b + c - a) * (c + a - b) * (a + b - c) := skip_hole
  
  have h₈ : (b + c - a) * (c + a - b) * (a + b - c) ≤ a * b * c := by
    have h₈₁ : 0 < a := by hole_9
    have h₈₂ : 0 < b := by hole_10
    have h₈₃ : 0 < c := by hole_11
    have h₈₄ : 0 < a * b := by hole_12
    have h₈₅ : 0 < b * c := by hole_13
    have h₈₆ : 0 < c * a := by hole_14
    hole_8
    clear h₈
    have h₈ : (b + c - a) * (c + a - b) * (a + b - c) ≤ a * b * c := skip_hole
  
  have h₉ : a ^ 2 * (b + c - a) + b ^ 2 * (c + a - b) + c ^ 2 * (a + b - c) = (b + c - a) * (c + a - b) * (a + b - c) + 2 * a * b * c := by
    have h₉₁ : a ^ 2 * (b + c - a) + b ^ 2 * (c + a - b) + c ^ 2 * (a + b - c) = (b + c - a) * (c + a - b) * (a + b - c) + 2 * a * b * c := by
      hole_16
    hole_15
  
  have h₁₀ : a ^ 2 * (b + c - a) + b ^ 2 * (c + a - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c := by
    rw [h₉]
    have h₁₀₁ : 0 < a * b * c := by
      have h₁₀₂ : 0 < a * b := by hole_19
      have h₁₀₃ : 0 < b * c := by hole_20
      have h₁₀₄ : 0 < c * a := by hole_21
      hole_18
    clear h₁₀₁
    have h₁₀₁ : 0 < a * b * c := skip_hole
    hole_17
      clear h₁₀
      have h₁₀ : a ^ 2 * (b + c - a) + b ^ 2 * (c + a - b) + c ^ 2 * (a + b - c) ≤ 3 * a * b * c := skip_hole
  
  hole_1