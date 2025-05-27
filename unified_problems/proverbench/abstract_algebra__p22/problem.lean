theorem cosine_inequality (hx : ∀ i, -π/6 ≤ x i ∧ x i ≤ π/6) :
∑ i : Fin n, cos (2 * x i - x (i.succ)) ≤ ∑ i : Fin (n + 1), cos (x i) := by
  <;> sorry