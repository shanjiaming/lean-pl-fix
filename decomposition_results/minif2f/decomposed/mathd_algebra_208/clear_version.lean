macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_208 : Real.sqrt 1000000 - 1000000 ^ ((1 : ℝ) / 3) = 900:=
  by
  have h_sqrt : Real.sqrt 1000000 = 1000:= by
    hole_2
  
  have h_cbrt : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
    by
    have h₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):=
      by
      have h₂ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log (1000000 : ℝ):= by
        hole_5
      rw [h₂]
      have h₃ : Real.log (1000000 : ℝ) = Real.log ((100 : ℝ) ^ 3):= by hole_6
      rw [h₃]
      have h₄ : Real.log ((100 : ℝ) ^ 3) = 3 * Real.log (100 : ℝ):= by hole_7
      hole_4
    have h₂ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) > 0:= by hole_8
    have h₃ : (100 : ℝ) > 0:= by hole_9
    have h₄ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      hole_10
    
    have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by
        have h₅₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by
          hole_13
        hole_12
      hole_11
    
    have h₆ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
      by
      hole_14
    
    hole_3
  have h_main : Real.sqrt 1000000 - (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 900:= by
    hole_15
  
  hole_1