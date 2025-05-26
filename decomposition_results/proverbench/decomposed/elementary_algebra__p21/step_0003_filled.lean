theorem h₂ (a b c : ℝ) (h₁ : 0 ≤ (a - b) ^ 2 + (b - c) ^ 2 + (c - a) ^ 2) : (a - b) ^ 2 + (b - c) ^ 2 + (c - a) ^ 2 = 2 * (a ^ 2 + b ^ 2 + c ^ 2 - (a * b + b * c + c * a)) := by
  --  ring_nf <;> linarith
  linarith