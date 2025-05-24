theorem complex_calculation (x y z : ℕ) : (x + y) * z = x * z + y * z := by
  have h1 (x + y) * z = z * (x + y) := by hole
  have h2 z * (x + y) = z * x + z * y := by hole
  have h3 z * x = x * z := by hole
  have h4 z * y = y * z := by hole
  have h5 z * x + z * y = x * z + z * y := by hole
  have h6 x * z + z * y = x * z + y * z := by hole
  rw [h1, h2, h5, h6] 