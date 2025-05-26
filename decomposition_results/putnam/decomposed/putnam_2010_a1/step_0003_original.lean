theorem h₂ (n : ℕ) (kboxes : ℕ → Prop) (npos : n > 0) (hkboxes :  ∀ (k : ℕ), kboxes k = ∃ boxes, ∀ (i j : Fin k), ∑ x ∈ {x | boxes x = i}, (↑x : ℕ) = ∑ x ∈ {x | boxes x = j}, (↑x : ℕ)) (h₁ : False) : IsGreatest kboxes ((fun n => ⌈(↑n : ℝ) / 2⌉₊) n) :=
  by
  exfalso
  exact h₁