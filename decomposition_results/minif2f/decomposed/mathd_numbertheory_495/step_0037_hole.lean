theorem h₁₄ (a b : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a % 10 = 2) (h₂ : b % 10 = 4) (h₃ : a.gcd b = 6) (h₄ : 12 ≤ a) (h₅ : 24 ≤ b) (h₆ : a ≠ 0) (h₇ : b ≠ 0) (h₈ : a * b = 6 * a.lcm b) (h₉ : a = 12 → 54 ≤ b) (h₁₀ : a = 12 → 648 ≤ a * b) (h₁₁ : a > 12 → 42 ≤ a) (h₁₂ : a > 12 → 1008 ≤ a * b) (h₁₃ : 648 ≤ a * b) : 108 ≤ a.lcm b := by
  have h₁₄₁ : a * b = 6 * Nat.lcm a b := h₈
  have h₁₄₂ : 648 ≤ a * b := h₁₃
  have h₁₄₃ : 108 ≤ Nat.lcm a b := by sorry
  --  exact h₁₄₃
  hole