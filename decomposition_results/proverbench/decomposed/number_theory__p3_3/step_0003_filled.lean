theorem h_minimality (h_main_claim : congruence1 8 ∧ congruence2 8 ∧ congruence3 8) : ∀ (n : ℕ+), congruence1 ↑n ∧ congruence2 ↑n ∧ congruence3 ↑n → n ≥ 8 :=
  by
  --  intro n hn
  have h₁ : (n : ℕ) ≥ 8 := by sorry
  --  exact_mod_cast h₁
  hole