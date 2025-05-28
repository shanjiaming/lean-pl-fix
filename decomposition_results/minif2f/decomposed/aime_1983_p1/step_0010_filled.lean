theorem hlogxyz (x y z w : ℕ) (ht : 1 < x ∧ 1 < y ∧ 1 < z) (hw : 0 ≤ w) (h0 : Real.log ↑w / Real.log ↑x = 24) (h1 : Real.log ↑w / Real.log ↑y = 40) (h2 : Real.log ↑w / Real.log (↑x * ↑y * ↑z) = 12) (hx : ↑x > 1) (hy : ↑y > 1) (hz : ↑z > 1) (hxyz : ↑x * ↑y * ↑z > 1) (hlogx : Real.log ↑x > 0) (hlogy : Real.log ↑y > 0) (hlogz : Real.log ↑z > 0) : Real.log (↑x * ↑y * ↑z) > 0 :=
  by
  have h₁ : Real.log ((x : ℝ) * y * z) = Real.log ((x : ℝ) * y) + Real.log (z : ℝ) := by sorry
  --  rw [h₁]
  have h₂ : Real.log ((x : ℝ) * y) = Real.log (x : ℝ) + Real.log (y : ℝ) := by sorry
  --  rw [h₂]
  have h₃ : Real.log (x : ℝ) > 0 := hlogx
  have h₄ : Real.log (y : ℝ) > 0 := hlogy
  have h₅ : Real.log (z : ℝ) > 0 := hlogz
  --  nlinarith
  linarith