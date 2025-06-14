theorem mathd_algebra_208 : Real.sqrt 1000000 - 1000000 ^ ((1 : ℝ) / 3) = 900:=
  by
  have h_sqrt : Real.sqrt 1000000 = 1000:= by
    admit
  
  have h_cbrt : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
    by
    have h₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):=
      by
      have h₂ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log (1000000 : ℝ):= by
        admit
      rw [h₂]
      have h₃ : Real.log (1000000 : ℝ) = Real.log ((100 : ℝ) ^ 3):= by admit
      rw [h₃]
      have h₄ : Real.log ((100 : ℝ) ^ 3) = 3 * Real.log (100 : ℝ):= by admit
      admit
    have h₂ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) > 0:= by admit
    have h₃ : (100 : ℝ) > 0:= by admit
    have h₄ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      admit
    
    have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by
        have h₅₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by
          admit
        admit
      admit
    
    have h₆ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
      by
      admit
    
    admit
  have h_main : Real.sqrt 1000000 - (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 900:= by
    admit
  
  admit