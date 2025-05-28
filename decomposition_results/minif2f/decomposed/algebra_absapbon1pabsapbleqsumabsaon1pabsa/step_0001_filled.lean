theorem algebra_absapbon1pabsapbleqsumabsaon1pabsa (a b : ℝ) : |a + b| / (1 + |a + b|) ≤ |a| / (1 + |a|) + |b| / (1 + |b|) :=
  by
  have h₁ : abs (a + b) ≤ abs a + abs b := by sorry
  have h₂ : ∀ (x y : ℝ), 0 ≤ x → x ≤ y → x / (1 + x) ≤ y / (1 + y) := by sorry
  have h₃ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)) := by sorry
  have h₄ : (abs a + abs b) / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by sorry
  have h₅ : abs (a + b) / (1 + abs (a + b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by sorry
  --  exact h₅
  linarith