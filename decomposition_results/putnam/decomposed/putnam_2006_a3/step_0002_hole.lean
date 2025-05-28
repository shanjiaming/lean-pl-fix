theorem h1 (x : ℤ → ℤ) (hxlo : ∀ (k : ℤ), 0 ≤ k ∧ k ≤ 2006 → x k = k) (hxhi : ∀ k ≥ 2006, x (k + 1) = x k + x (k - 2005)) : False := by
  have h₁ := hxlo 1
  have h₂ := hxlo 0
  have h₃ := hxlo (-1)
  have h₄ := hxlo 2006
  have h₅ := hxhi (-2005)
  have h₆ := hxhi 2006
  have h₇ := hxhi 2005
  have h₈ := hxhi (-1)
  have h₉ := hxhi (-2)
  --  --  --  norm_num at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ ⊢ <;> simp_all (config := { decide := true }) <;> linarith <;> omega
  hole