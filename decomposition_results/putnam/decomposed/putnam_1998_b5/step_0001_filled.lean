theorem putnam_1998_b5 (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) : 1 = ⌊10 ^ 1000 * √↑N⌋₊ % 10 :=
  by
  have h₁ : N = (10 ^ 1998 - 1) / 9 := by sorry
  have h₂ : (10 : ℝ) ^ 1998 > 1 := by sorry
  have h₃ : (10 : ℝ) ^ 1999 > 7 := by sorry
  have h₄ : (10 : ℝ) ^ 1998 - 1 > 0 := by sorry
  have h₅ : (N : ℝ) = ((10 : ℝ) ^ 1998 - 1) / 9 := by sorry
  have h₆ : (10 : ℝ) ^ 1000 * Real.sqrt N < ((10 : ℝ) ^ 1999 - 4) / 3 := by sorry
  have h₇ : ((10 : ℝ) ^ 1999 - 7) / 3 < (10 : ℝ) ^ 1000 * Real.sqrt N := by sorry
  have h₈ : Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) = (10 ^ 1999 - 7) / 3 := by sorry
  have h₉ : (Nat.floor ((10 : ℝ) ^ 1000 * Real.sqrt N) : ℕ) % 10 = 1 := by sorry
  have h₁₀ : ((1) : ℕ) = (Nat.floor (10 ^ 1000 * Real.sqrt N)) % 10 := by sorry
  --  apply h₁₀
  linarith