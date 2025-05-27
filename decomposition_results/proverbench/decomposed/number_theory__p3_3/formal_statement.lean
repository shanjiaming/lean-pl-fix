/-- 8 is the smallest positive integer that satisfies all the given congruences -/
theorem smallest_positive_integer :
  (∃ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n) ∧
  (∀ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n → n ≥ 8) ∧
  (congruence1 8 ∧ congruence2 8 ∧ congruence3 8) :=