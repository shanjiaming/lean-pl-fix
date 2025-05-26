theorem h_main (k m : ℕ) (S : ℤ) (kpos : k > 0) (hm : m = 6 * k - 1) (hS : S = ∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ)) : S % 3 = 1 :=
  by
  have h₁ : S = ∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1) := hS
  --  rw [h₁]
  have h₂ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by sorry
  have h₃ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = 1 := by sorry
  --  exact h₃ <;> simp_all [Int.emod_eq_emod_iff_emod_sub_eq_zero] <;> omega
  hole