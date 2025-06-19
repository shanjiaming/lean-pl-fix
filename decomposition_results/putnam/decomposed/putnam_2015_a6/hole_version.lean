macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem putnam_2015_a6
(n : ℕ)
(A B M : Matrix (Fin n) (Fin n) ℝ)
(npos : n > 0)
(hmul : A * M = M * B)
(hpoly : Matrix.charpoly A = Matrix.charpoly B)
: ∀ X : Matrix (Fin n) (Fin n) ℝ, (A - M * X).det = (B - X * M).det := by
  have h_main : ∀ X : Matrix (Fin n) (Fin n) ℝ, (A - M * X).det = (B - X * M).det := by
    intro X
    have h₁ : (A - M * X) * M = M * (B - X * M) := by
      hole_1
    have h₂ : (A - M * X).det * M.det = M.det * (B - X * M).det := by
      hole_2
    have h₃ : (A - M * X).det * M.det = M.det * (B - X * M).det := h₂
    by_cases hM : M.det = 0
    · have h₄ : (A - M * X).det = (B - X * M).det := by
        have h₅ : (A - M * X).det * M.det = M.det * (B - X * M).det := h₃
        hole_3
      exact h₄
    · have h₄ : (A - M * X).det = (B - X * M).det := by
        have h₅ : (A - M * X).det * M.det = M.det * (B - X * M).det := h₃
        hole_4
      hole_5
  hole_6