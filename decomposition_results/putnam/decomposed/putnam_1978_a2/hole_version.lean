macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_1978_a2
(n : ℕ)
(npos : n > 0)
(a b : ℝ)
(hab : a ≠ b)
(c : Fin n → ℝ)
(A : Matrix (Fin n) (Fin n) ℝ)
(hA : A = fun i j ↦ ite (i < j) a (ite (i > j) b (c i)))
(p : ℝ → ℝ)
(hp : p = fun x ↦ ∏ i : Fin n, (c i - x))
: (A.det = ((b * p a - a * p b) / (b - a))) := by
  have h₁ : A.det = ((b * p a - a * p b) / (b - a)) := by
    rw [hA]
    rw [hp]
    have h₂ : n ≥ 1 := by hole_1
    
    hole_2
  hole_3