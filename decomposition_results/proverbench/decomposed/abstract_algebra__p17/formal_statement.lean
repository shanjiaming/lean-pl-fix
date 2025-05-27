theorem real_zeros_of_polynomial_f :
 ∃ (s : Finset ℝ), s.card = 4 ∧ (∀ x ∈ s, f.eval x = 0) ∧
 (∀ x : ℝ, f.eval x = 0 → x ∈ s) :=