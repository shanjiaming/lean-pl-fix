theorem h₃ (m : ℤ) (hm : m ∈ Set.Ioo 0 1993) (h₁ : m > 0) (h₂ : m < 1993) : m < 1993 := by
  --  simp [Set.mem_Ioo] at hm
  --  linarith
  linarith