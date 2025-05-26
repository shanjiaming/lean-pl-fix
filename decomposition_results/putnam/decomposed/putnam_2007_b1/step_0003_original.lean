theorem h2 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (n : ℤ) (hn : n > 0) (m : ℕ) (hm : m > 0) (hm' : f.coeff m > 0) : ∑ i ∈ f.support, f.coeff i ≥ f.coeff m :=
  by
  have h3 : (f.coeff m : ℤ) ≤ (∑ i in f.support, (f.coeff i : ℤ)) := by sorry
  exact h3