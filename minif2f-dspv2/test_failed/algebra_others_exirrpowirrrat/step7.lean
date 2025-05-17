theorem h₅₁ (h h₁ : Irrational (√2 ^ √2)) (h₂ : Irrational √2) (h₃ : √2 ^ √2 > 0) : Real.log ((√2 ^ √2) ^ √2) = √2 * Real.log (√2 ^ √2) :=
  by rw [Real.log_rpow (by positivity)] <;> norm_num