theorem h₄₅ (n : ℕ) (h₀ : 0 < n) (h₁ : n.gcd 40 = 10) (h₂ : n.lcm 40 = 280) (h₃ h₄₁ : n * 40 = 2800) (h₄₃ : n ≤ 70) (h : ¬n ≥ 70) : n ≤ 69 := by -- omega
  linarith