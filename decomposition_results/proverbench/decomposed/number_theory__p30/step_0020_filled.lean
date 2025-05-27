theorem h₄ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (h_main : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (y : ℤ) (hy h₁ : y ^ 2 ≡ a [ZMOD ↑p]) (h₂ : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (h₃ : y ^ 2 ≡ (a ^ k) ^ 2 [ZMOD ↑p]) : y ≡ a ^ k [ZMOD ↑p] ∨ y ≡ -a ^ k [ZMOD ↑p] :=
  by
  have h₅ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := h₃
  have h₆ : (y - a ^ k : ℤ) * (y + a ^ k : ℤ) ≡ 0 [ZMOD p] := by sorry
  have h₇ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := by sorry
  have h₈ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ) := by sorry
  --  cases h₈ with
  --  | inl h₈ =>
  --    have h₉ : (p : ℤ) ∣ (y - a ^ k : ℤ) := h₈
  --    have h₁₀ : y ≡ a ^ k [ZMOD p] := by
  --      have h₁₁ : (p : ℤ) ∣ (y - a ^ k : ℤ) := h₉
  --      have h₁₂ : y ≡ a ^ k [ZMOD p] := by simpa [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₁₁
  --      exact h₁₂
  --    exact Or.inl h₁₀
  --  | inr h₈ =>
  --    have h₉ : (p : ℤ) ∣ (y + a ^ k : ℤ) := h₈
  --    have h₁₀ : y ≡ -a ^ k [ZMOD p] := by
  --      have h₁₁ : (p : ℤ) ∣ (y + a ^ k : ℤ) := h₉
  --      have h₁₂ : y ≡ -a ^ k [ZMOD p] := by
  --        simpa [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero, sub_eq_add_neg, add_comm] using h₁₁
  --      exact h₁₂
  --    exact Or.inr h₁₀
  hole