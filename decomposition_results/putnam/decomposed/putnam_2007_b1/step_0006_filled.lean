theorem h5 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (n : ℤ) (hn : n > 0) (m : ℕ) (hm : m > 0) (hm' : f.coeff m > 0) : m ∈ f.support := by
  --  by_contra h6
  --  rw [Polynomial.mem_support_iff] at h6
  --  --  norm_cast at h6 <;> simp_all [h6] <;> norm_num at hm' ⊢ <;> linarith
  hole