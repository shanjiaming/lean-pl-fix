theorem sum_of_squares_ge_sum_of_products (a b c : ℝ) :
    a^2 + b^2 + c^2 ≥ a * b + b * c + c * a := by
  have h₁ : 0 ≤ (a - b)^2 + (b - c)^2 + (c - a)^2 := by
    nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]
  
  have h₂ : (a - b)^2 + (b - c)^2 + (c - a)^2 = 2 * (a^2 + b^2 + c^2 - (a * b + b * c + c * a)) := by
    ring_nf
    <;>
    linarith
  
  have h₃ : 0 ≤ 2 * (a^2 + b^2 + c^2 - (a * b + b * c + c * a)) := by
    rw [← h₂]
    exact h₁
  
  have h₄ : 0 ≤ a^2 + b^2 + c^2 - (a * b + b * c + c * a) := by
    linarith
  
  have h₅ : a * b + b * c + c * a ≤ a^2 + b^2 + c^2 := by
    linarith
  
  linarith