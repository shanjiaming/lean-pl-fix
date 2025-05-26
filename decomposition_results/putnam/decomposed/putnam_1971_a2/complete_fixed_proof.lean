theorem putnam_1971_a2 (P : Polynomial ℝ) :
  (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1)) ↔ P ∈ (({ Polynomial.X }) : Set (Polynomial ℝ)):=
  by
  have h_main :
    (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1)) → P ∈ (({ Polynomial.X }) : Set (Polynomial ℝ)) := by sorry
  have h_trivial :
    P ∈ (({ Polynomial.X }) : Set (Polynomial ℝ)) → (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1)) := by sorry
  have h_final :
    (P.eval 0 = 0 ∧ (∀ x : ℝ, P.eval (x ^ 2 + 1) = (P.eval x) ^ 2 + 1)) ↔ P ∈ (({ Polynomial.X }) : Set (Polynomial ℝ)) := by sorry
  exact h_final
  hole