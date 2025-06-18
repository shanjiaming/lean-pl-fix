macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem algebra_2varlineareq_fp3zeq11_3tfm1m5zeqn68_feqn10_zeq7 (f z : ℂ) (h₀ : f + 3 * z = 11)
    (h₁ : 3 * (f - 1) - 5 * z = -68) : f = -10 ∧ z = 7 := by
  have h₂ : f.im = 0 := by
    have h₂₁ := h₀
    have h₂₂ := h₁
    hole_2
  
  have h₃ : z.im = 0 := by
    have h₃₁ := h₀
    have h₃₂ := h₁
    hole_3
  
  have h₄ : f.re + 3 * z.re = 11 := by
    have h₄₁ := h₀
    hole_4
  
  have h₅ : 3 * f.re - 5 * z.re = -65 := by
    have h₅₁ := h₁
    hole_5
  
  have h₆ : f.re = -10 := by
    have h₆₁ : f.re + 3 * z.re = 11 := h₄
    have h₆₂ : 3 * f.re - 5 * z.re = -65 := h₅
    have h₆₃ : f.re = -10 := by
      have h₆₄ : z.re = 7 := by
        
        hole_8
      
      have h₆₅ : f.re = -10 := by
        hole_9
      hole_7
    hole_6
  
  have h₇ : z.re = 7 := by
    have h₇₁ : f.re + 3 * z.re = 11 := h₄
    have h₇₂ : 3 * f.re - 5 * z.re = -65 := h₅
    have h₇₃ : f.re = -10 := h₆
    have h₇₄ : z.re = 7 := by
      
      hole_11
    hole_10
  
  have h₈ : f = -10 := by
    have h₈₁ : f.re = -10 := h₆
    have h₈₂ : f.im = 0 := h₂
    have h₈₃ : f = -10 := by
      hole_13
    hole_12
  
  have h₉ : z = 7 := by
    have h₉₁ : z.re = 7 := h₇
    have h₉₂ : z.im = 0 := h₃
    have h₉₃ : z = 7 := by
      hole_15
    hole_14
  
  have h₁₀ : f = -10 ∧ z = 7 := by
    hole_16
  
  hole_1