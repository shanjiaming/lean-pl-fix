theorem h₆ (p k : ℕ) (hp : p = 4 * k - 1) (hp_prime : Nat.Prime p) (a : ℤ) (ha : ∃ x, x ^ 2 ≡ a [ZMOD ↑p]) (h_main : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (y : ℤ) (hy h₁ : y ^ 2 ≡ a [ZMOD ↑p]) (h₂ : (a ^ k) ^ 2 ≡ a [ZMOD ↑p]) (h₃ h₅ : y ^ 2 ≡ (a ^ k) ^ 2 [ZMOD ↑p]) : (y - a ^ k) * (y + a ^ k) ≡ 0 [ZMOD ↑p] := by
  calc
    (y - a ^ k : ℤ) * (y + a ^ k : ℤ) = (y : ℤ) ^ 2 - (a ^ k : ℤ) ^ 2 := by ring
    _ ≡ (a ^ k : ℤ) ^ 2 - (a ^ k : ℤ) ^ 2 [ZMOD p] := by
      gcongr <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] <;> ring_nf <;> omega
    _ = 0 := by ring
    _ ≡ 0 [ZMOD p] := by simp [Int.ModEq]