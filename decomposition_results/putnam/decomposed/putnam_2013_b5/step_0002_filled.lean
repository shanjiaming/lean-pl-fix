theorem h1 (n : ℕ) (hn : n ≥ 1) (k : (↑(Set.Icc 1 n) : Type)) (fiter : ((↑(Set.Icc 1 n) : Type) → (↑(Set.Icc 1 n) : Type)) → Prop) (hfiter :  ∀ (f : (↑(Set.Icc 1 n) : Type) → (↑(Set.Icc 1 n) : Type)), fiter f ↔ ∀ (x : (↑(Set.Icc 1 n) : Type)), ∃ j, f^[j] x ≤ k) : False := by
  have h2 : (1 : ℕ) ≤ 1 := by sorry
  have h3 : (1 : ℕ) ≤ n := by sorry
  have h4 : (1 : ℕ) ≤ n := by sorry
  have h5 : (1 : ℕ) ≤ n := by sorry
  have h6 : ¬(∀ (f : Set.Icc 1 n → Set.Icc 1 n), fiter f ↔ ∀ (x : Set.Icc 1 n), ∃ (j : ℕ), f^[j] x ≤ k) := by sorry
  --  exact h6 hfiter
  hole