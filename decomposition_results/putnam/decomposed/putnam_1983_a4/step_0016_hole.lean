theorem h₁₈ (k m : ℕ) (S : ℤ) (kpos : k > 0) (hm : m = 6 * k - 1) (hS h₁ : S = ∑ j ∈ Finset.Icc 1 (2 * k - 1), (-1) ^ (j + 1) * (↑(m.choose (3 * j - 1)) : ℤ)) (j : ℕ) (hj : j ∈ Finset.Icc 1 (2 * k - 1)) (h₃ h₄ : m = 6 * k - 1) (h₆ h₈ : m ≡ 2 [MOD 3]) (h₁₀ : m % 3 = 2) (h₁₂ : j ∈ Finset.Icc 1 (2 * k - 1)) (h₁₃ : 1 ≤ j ∧ j ≤ 2 * k - 1) (h₁₄ h₁₆ : j ≤ 2 * k - 1) (h₁₇ : 3 * j ≤ 3 * (2 * k - 1)) : 3 * (2 * k - 1) ≤ 6 * k - 1 := by
  --  cases k with
  --  | zero => omega
  --  | succ k' =>
  --    simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_add, Nat.add_mul] <;> ring_nf at * <;> omega
  hole