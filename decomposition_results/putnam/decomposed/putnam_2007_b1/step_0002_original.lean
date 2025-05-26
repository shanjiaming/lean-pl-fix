theorem h1 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (hfnconst : ∃ n > 0, f.coeff n > 0) (n : ℤ) (hn : n > 0) : Polynomial.eval 1 f > 0 := by
  obtain ⟨m, hm, hm'⟩ := hfnconst
  have h2 : (∑ i in f.support, (f.coeff i : ℤ)) ≥ (f.coeff m : ℤ) := by sorry
  have h9 : (∑ i in f.support, (f.coeff i : ℤ)) ≥ (f.coeff m : ℤ) := h2
  have h10 : Polynomial.eval 1 f = (∑ i in f.support, (f.coeff i : ℤ)) := by sorry
  have h11 : (f.coeff m : ℤ) > 0 := by sorry
  have h12 : Polynomial.eval 1 f ≥ (f.coeff m : ℤ) := by sorry
  have h13 : Polynomial.eval 1 f > 0 := by sorry
  exact_mod_cast h13 <;> simp_all [Polynomial.eval_eq_sum] <;> linarith