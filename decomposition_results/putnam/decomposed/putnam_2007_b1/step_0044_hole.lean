theorem h22 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (hfnconst : ∃ n > 0, f.coeff n > 0) (n : ℤ) (hn : n > 0) (h1 : Polynomial.eval 1 f > 0) (h2 : n ≥ 1) (hn1 : n ≠ 1) (h4 h5 : n ≥ 2) (m : ℕ) (hm1 : m > 0) (hm2 : f.coeff m > 0) (h8 : m > 0) (h10 : Polynomial.eval n f = Polynomial.eval n f) (h11 : Polynomial.eval 1 f = Polynomial.eval 1 f) (h13 : Polynomial.eval n f - Polynomial.eval 1 f = Polynomial.eval n f - Polynomial.eval 1 f) (h15 : 0 < n) (h16 : ∀ (k : ℕ), f.coeff k ≥ 0) (h17 : Polynomial.eval n f - Polynomial.eval 1 f = ∑ k ∈ f.support, f.coeff k * (n ^ k - 1)) (h19 : m ∈ f.support) (h20 : f.coeff m * (n ^ m - 1) > 0) : ∑ k ∈ f.support, f.coeff k * (n ^ k - 1) ≥ f.coeff m * (n ^ m - 1) := by
  --  apply
  --    Finset.single_le_sum
  --      (fun i _ => by
  --        have h23 : (f.coeff i : ℤ) ≥ 0 := by exact_mod_cast (hf i)
  --        have h24 : (n : ℤ) ^ i - 1 ≥ 0 :=
  --          by
  --          have h25 : (n : ℤ) ^ i ≥ 1 := by
  --            have h26 : (n : ℤ) ≥ 1 := by linarith
  --            have h27 : (i : ℕ) ≥ 0 := by omega
  --            have h28 : (n : ℤ) ^ i ≥ 1 := by exact one_le_pow_of_one_le h26 _
  --            linarith
  --          omega
  --        nlinarith)
  --      h19
  hole