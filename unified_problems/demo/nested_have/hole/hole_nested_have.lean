theorem nested_proof (a b c : ℕ) : a + b + c = c + b + a := by
  have h1 a + b = b + a := by hole
    have h2 a + b = b + a := by hole
  have h3 a + b + c = (a + b) + c := by hole
  have h4 c + b + a = c + (b + a) := by hole
  have h5 (a + b) + c = (b + a) + c := by hole
  have h6 (b + a) + c = c + (b + a) := by hole
  rw [h3, h5, h6, h4] 