theorem h_sum (f : ℝ → ℝ) (c : ℕ → ℝ) (hc : ∀ (n : ℕ), c n = 0 ∨ c n = 1) (hf : ∀ (x : ℝ), f x = ∑' (n : ℕ), c n * x ^ n) (h₁ : f (2 / 3) = 3 / 2) : Summable fun n => c n * (2 / 3) ^ n :=
  by
  --  refine' Summable.of_nonneg_of_le (fun n => _) (fun n => _) (summable_geometric_of_lt_one (by norm_num) (by norm_num))
  --  · cases' hc n with h₂ h₂
  --    · rw [h₂]
  --      simp
  --    · rw [h₂]
  --      positivity
  --  · cases' hc n with h₂ h₂
  --    · rw [h₂]
  --      simp
  --  --    · rw [h₂] <;> simp [le_refl]
  hole