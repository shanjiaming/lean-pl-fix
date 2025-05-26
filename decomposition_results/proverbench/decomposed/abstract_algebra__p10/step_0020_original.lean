theorem h₃ (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (h_sum : a ^ 2 / (1 + a ^ 2) + b ^ 2 / (1 + b ^ 2) + c ^ 2 / (1 + c ^ 2) = 1) (h₁ : a * b * c ≤ 1 / (2 * √2)) (h₂ : 0 ≤ a * b * c) : |a * b * c| ≤ 1 / (2 * √2) :=
  by
  have h₄ : a * b * c ≤ 1 / (2 * Real.sqrt 2) := h₁
  have h₅ : 0 ≤ a * b * c := h₂
  rw [abs_of_nonneg h₅] <;> linarith