theorem h₂ (m : ℤ) (hm : m ∈ Set.Ioo 0 1993) (h₁ : m > 0) : m < 1993 := by
  simp [Set.mem_Ioo] at hm
  linarith