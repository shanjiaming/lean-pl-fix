theorem h₁₀ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (b : ℤ) (hb h₂ : b ^ 2 ≡ a [ZMOD ↑p]) (h₃ : a ^ k ≡ (b ^ 2) ^ k [ZMOD ↑p]) (h₄ : (a ^ k) ^ 2 ≡ (b ^ 2) ^ (2 * k) [ZMOD ↑p]) (h₅ : p = 4 * k - 1) (h₆ : 4 * k = p + 1) (h₇ : b ^ p ≡ b [ZMOD ↑p]) (h₈ : b ^ (p + 1) ≡ b ^ 2 [ZMOD ↑p]) (h₉ : b ^ (2 * k) ≡ b ^ (2 * k) [ZMOD ↑p]) : b ^ (4 * k) ≡ b ^ 2 [ZMOD ↑p] :=
  by
  have h₁₁ : (4 * k : ℕ) = (p : ℕ) + 1 := by sorry
  --  calc
  --    (b : ℤ) ^ (4 * k : ℕ) = (b : ℤ) ^ ((p : ℕ) + 1 : ℕ) := by
  --      rw [h₁₁] <;> simp [Nat.cast_add, Nat.cast_one, pow_add, pow_one] <;> ring_nf
  --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by simpa [Int.ModEq] using h₈
  --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by rfl
  hole