theorem h₄ (x : ℝ) (h : (11 ^ (1 / 4)) ^ (3 * x - 3) = 1 / 5) (h₁ : 11 ^ (1 / 4) = 1) (h₂ : (11 ^ (1 / 4)) ^ (3 * x - 3) = 1) (h₃ : False) : (11 ^ (1 / 4)) ^ (6 * x + 2) = 121 / 25 :=
  by
  exfalso
  exact h₃