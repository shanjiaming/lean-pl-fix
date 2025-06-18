macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem induction_1pxpownlt1pnx (x : ℝ) (n : ℕ) (h₀ : -1 < x) (h₁ : 0 < n) :
    1 + ↑n * x ≤ (1 + x) ^ (n : ℕ) := by
  have h_base : 1 + (1 : ℝ) * x ≤ (1 + x) ^ 1 := by
    hole_2
  
  have h_inductive : ∀ (k : ℕ), 0 < k → 1 + (k : ℝ) * x ≤ (1 + x) ^ k → 1 + ((k + 1 : ℕ) : ℝ) * x ≤ (1 + x) ^ (k + 1) := by
    intro k hk_pos hk_ineq
    have h₁_pos : 0 < (1 + x : ℝ) := by hole_4
    have h₂ : (1 + x : ℝ) ^ (k + 1 : ℕ) = (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      hole_5
    rw [h₂]
    have h₃ : (1 + (k : ℝ) * x : ℝ) * (1 + x : ℝ) = 1 + ((k + 1 : ℕ) : ℝ) * x + (k : ℝ) * x ^ 2 := by
      hole_6
    have h₄ : (1 + (k : ℝ) * x : ℝ) ≤ (1 + x : ℝ) ^ k := by
      hole_7
    have h₅ : (1 + (k : ℝ) * x : ℝ) * (1 + x : ℝ) ≤ (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      hole_8
    have h₆ : 1 + ((k + 1 : ℕ) : ℝ) * x + (k : ℝ) * x ^ 2 ≤ (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      hole_9
    have h₇ : 1 + ((k + 1 : ℕ) : ℝ) * x ≤ (1 + x : ℝ) ^ k * (1 + x : ℝ) := by
      have h₈ : (k : ℝ) * x ^ 2 ≥ 0 := by
        have h₉ : (k : ℝ) ≥ 0 := by hole_12
        have h₁₀ : x ^ 2 ≥ 0 := by hole_13
        hole_11
      hole_10
    hole_3
  
  have h_main : 1 + (n : ℝ) * x ≤ (1 + x) ^ n := by
    have h₂ : ∀ (k : ℕ), 0 < k → 1 + (k : ℝ) * x ≤ (1 + x) ^ k := by
      hole_15
    have h₃ : 0 < n := h₁
    have h₄ : 1 + (n : ℝ) * x ≤ (1 + x) ^ n := h₂ n h₃
    hole_14
  
  hole_1