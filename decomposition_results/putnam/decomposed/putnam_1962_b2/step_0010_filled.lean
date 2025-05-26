theorem h₃ (q : ℕ+ → ℚ) (hq : Function.Bijective q) (hq' : Function.Surjective q) (a b : ℝ) (hab : a < b) (h₁ : {n | (↑(q n) : ℝ) < a} ⊆ {n | (↑(q n) : ℝ) < b}) : ∃ r, a < (↑r : ℝ) ∧ (↑r : ℝ) < b :=
  by
  --  obtain ⟨r, hr⟩ := exists_rat_btwn hab
  --  exact ⟨r, by simpa using hr⟩
  hole