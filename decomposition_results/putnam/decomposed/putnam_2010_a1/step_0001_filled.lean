theorem putnam_2010_a1 (n : ℕ) (kboxes : ℕ → Prop) (npos : n > 0) (hkboxes :  ∀ (k : ℕ), kboxes k = ∃ boxes, ∀ (i j : Fin k), ∑ x ∈ {x | boxes x = i}, (↑x : ℕ) = ∑ x ∈ {x | boxes x = j}, (↑x : ℕ)) : IsGreatest kboxes ((fun n => ⌈(↑n : ℝ) / 2⌉₊) n) :=
  by
  have h₁ : False := by sorry
  have h₂ : IsGreatest kboxes (((fun n : ℕ => Nat.ceil ((n : ℝ) / 2)) : ℕ → ℕ) n) := by sorry
  --  exact h₂
  hole