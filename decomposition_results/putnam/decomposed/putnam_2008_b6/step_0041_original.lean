theorem h₄₂ (n k : ℕ) (hnk : n > 0 ∧ k > 0) (h₁ : n > 0) (h₂ : k > 0) (h₃ : 2 * k + 1 > 0) (h : n ≤ k + 1) (h₄ h₅ : n ≤ k + 1) (h₆ : ∀ (s : Equiv.Perm (Fin n)), klimited k n s) (h₃₁ : {s | klimited k n s} = univ) (h₃₂ : {s | klimited k n s}.ncard = univ.ncard) (h₃₃ : {s | klimited k n s}.ncard = n !) (h₃₅ : n ≤ k + 1) (h₃₆ : n > 0) (h₃₇ : k > 0) (h₃₈ : n ≤ k + 1) (h₃₉ : n > 0) (h₄₀ : k > 0) (h₄₁ : n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1] → n = 1) : n = 1 → (Odd n ! ↔ n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) :=
  by
  intro h₄₃
  have h₄₄ : n = 1 := h₄₃
  have h₄₅ : n ≡ 1 [MOD 2 * k + 1] := by sorry
  have h₄₆ : Odd (Nat.factorial n) := by
    rw [h₄₄] <;> simp [Nat.odd_iff_not_even, Nat.even_iff, Nat.factorial] <;> decide
  have h₄₇ : (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by sorry
  constructor <;> intro h₄₈ <;> simp_all [Nat.odd_iff_not_even, Nat.even_iff, Nat.factorial] <;>
    have h₄₆ : Odd (Nat.factorial n) := by sorry
have h₄₂ : n = 1 → (Odd (Nat.factorial n) ↔ (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1])) :=
  by
  intro h₄₃
  have h₄₄ : n = 1 := h₄₃
  have h₄₅ : n ≡ 1 [MOD 2 * k + 1] := by sorry
  have h₄₆ : Odd (Nat.factorial n) := by
    rw [h₄₄] <;> simp [Nat.odd_iff_not_even, Nat.even_iff, Nat.factorial] <;> decide
  have h₄₇ : (n ≡ 0 [MOD 2 * k + 1] ∨ n ≡ 1 [MOD 2 * k + 1]) := by exact Or.inr h₄₅
  constructor <;> intro h₄₈ <;> simp_all [Nat.odd_iff_not_even, Nat.even_iff, Nat.factorial] <;>
    try norm_num <;> try omega