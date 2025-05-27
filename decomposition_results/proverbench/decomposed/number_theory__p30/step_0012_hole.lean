theorem h₈ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (b : ℤ) (hb h₂ : b ^ 2 ≡ a [ZMOD ↑p]) (h₃ : a ^ k ≡ (b ^ 2) ^ k [ZMOD ↑p]) (h₄ : (a ^ k) ^ 2 ≡ (b ^ 2) ^ (2 * k) [ZMOD ↑p]) (h₅ : p = 4 * k - 1) (h₆ : 4 * k = p + 1) (h₇ : b ^ p ≡ b [ZMOD ↑p]) : b ^ (p + 1) ≡ b ^ 2 [ZMOD ↑p] := by
  --  calc
  --    (b : ℤ) ^ (p + 1 : ℕ) = (b : ℤ) ^ (p : ℕ) * (b : ℤ) := by
  --      ring_nf <;> simp [Nat.cast_add, Nat.cast_one, pow_add, pow_one] <;> ring_nf
  --    _ ≡ (b : ℤ) * (b : ℤ) [ZMOD p] :=
  --      by
  --      have h₉ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := h₇
  --      have h₁₀ : (b : ℤ) ^ (p : ℕ) * (b : ℤ) ≡ (b : ℤ) * (b : ℤ) [ZMOD p] := by exact Int.ModEq.mul_right _ h₉
  --      simpa [Int.ModEq] using h₁₀
  --    _ = (b : ℤ) ^ 2 := by ring
  --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by rfl
  hole