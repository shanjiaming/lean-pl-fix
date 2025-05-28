theorem hxyz (x y z w : ℕ) (ht : 1 < x ∧ 1 < y ∧ 1 < z) (hw : 0 ≤ w) (h0 : Real.log ↑w / Real.log ↑x = 24) (h1 : Real.log ↑w / Real.log ↑y = 40) (h2 : Real.log ↑w / Real.log (↑x * ↑y * ↑z) = 12) (hx : ↑x > 1) (hy : ↑y > 1) (hz : ↑z > 1) : ↑x * ↑y * ↑z > 1 := by
  have h₁ : (x : ℝ) > 1 := hx
  have h₂ : (y : ℝ) > 1 := hy
  have h₃ : (z : ℝ) > 1 := hz
  have h₄ : (x : ℝ) * y > 1 := by sorry
  --  nlinarith
  hole