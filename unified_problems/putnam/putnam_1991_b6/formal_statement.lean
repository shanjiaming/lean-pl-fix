theorem putnam_1991_b6
  (a b : ℝ)
  (abpos : a > 0 ∧ b > 0) :
  IsGreatest {c | ∀ u,
    (0 < |u| ∧ |u| ≤ c) →
    (∀ x ∈ Set.Ioo 0 1, a ^ x * b ^ (1 - x) ≤ a * (Real.sinh (u * x) / Real.sinh u) + b * (Real.sinh (u * (1 - x)) / Real.sinh u))}
  (((fun a b : ℝ => |Real.log (a / b)|) : ℝ → ℝ → ℝ ) a b) := by