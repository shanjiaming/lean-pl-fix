theorem h₁₀ (k m : ℕ) (S : ℤ) (kpos : k > 0) (hm : m = 6 * k - 1) (hS h₁ : S = ∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ)) (h₂ : ∀ j ∈ Finset.Icc 1 (2 * k - 1), (↑(m.choose (3 * j - 1)) : ℤ) % 3 = (↑(choose 2 (3 * j - 1)) : ℤ) % 3) (h₅ :  (∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ)) % 3 =    (∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ) % 3) % 3) (h₆ :  (∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ) % 3) % 3 =    (∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(choose 2 (3 * j - 1)) : ℤ) % 3) % 3) : (∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(choose 2 (3 * j - 1)) : ℤ)) % 3 =
    (∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(choose 2 (3 * j - 1)) : ℤ) % 3) % 3 :=
  by
  simp [Int.emod_eq_emod_iff_emod_sub_eq_zero, Finset.sum_int_mod] <;> simp_all [Finset.sum_int_mod] <;>
      ring_nf at * <;>
    omega