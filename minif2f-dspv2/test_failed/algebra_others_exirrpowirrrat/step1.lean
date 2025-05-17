theorem algebra_others_exirrpowirrrat  : ∃ a b, Irrational a ∧ Irrational b ∧ ¬Irrational (a ^ b) :=
  by
  have h_main : ∃ (a b : ℝ), Irrational a ∧ Irrational b ∧ ¬Irrational (a ^ b) := by sorry
  simpa using h_main