theorem h3 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (n : ℤ) (hn : n > 0) (m : ℕ) (hm : m > 0) (hm' : f.coeff m > 0) : f.coeff m ≤ ∑ i ∈ f.support, f.coeff i :=
  by
  have h4 : (f.coeff m : ℤ) ≤ (∑ i in f.support, (f.coeff i : ℤ)) := by sorry
  exact h4