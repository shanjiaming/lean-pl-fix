theorem h_main  : (sorry ^ sorry) ^ 2 ≡ sorry [ZMOD sorry] :=
  by
  have h₁ : ∃ (x : ℤ), x ^ 2 ≡ a [ZMOD p] := ha
  obtain ⟨b, hb⟩ := h₁
  have h₂ : b ^ 2 ≡ a [ZMOD p] := hb
  have h₃ : (a ^ k : ℤ) ≡ (b ^ 2) ^ k [ZMOD p] := by sorry
  have h₄ : (a ^ k : ℤ) ^ 2 ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p] := by sorry
  have h₅ : (p : ℕ) = 4 * k - 1 := by sorry
  have h₆ : (4 * k : ℕ) = (p : ℕ) + 1 :=
    by
    have h₇ : (p : ℕ) = 4 * k - 1 := by omega
    have h₈ : (4 * k : ℕ) ≥ 1 := by
      have h₉ : Nat.Prime p := hp_prime
      have h₁₀ : (p : ℕ) ≥ 2 := Nat.Prime.two_le h₉
      omega
    omega
  have h₇ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := by sorry
  have h₈ : (b : ℤ) ^ (p + 1 : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by sorry
  have h₉ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by sorry
  have h₁₀ : (b : ℤ) ^ (4 * k : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by sorry
  have h₁₁ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by sorry
  have h₁₂ : ((a ^ k : ℤ) ^ 2 : ℤ) ≡ (a : ℤ) [ZMOD p] := by sorry
  have h₆ : (4 * k : ℕ) = (p : ℕ) + 1 := by sorry
have h_main : (a ^ k) ^ 2 ≡ a [ZMOD p] :=
  by
  have h₁ : ∃ (x : ℤ), x ^ 2 ≡ a [ZMOD p] := ha
  obtain ⟨b, hb⟩ := h₁
  have h₂ : b ^ 2 ≡ a [ZMOD p] := hb
  have h₃ : (a ^ k : ℤ) ≡ (b ^ 2) ^ k [ZMOD p] := by sorry
  have h₄ : (a ^ k : ℤ) ^ 2 ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p] := by sorry
  have h₅ : (p : ℕ) = 4 * k - 1 := by sorry
  have h₆ : (4 * k : ℕ) = (p : ℕ) + 1 :=
    by
    have h₇ : (p : ℕ) = 4 * k - 1 := by omega
    have h₈ : (4 * k : ℕ) ≥ 1 := by
      have h₉ : Nat.Prime p := hp_prime
      have h₁₀ : (p : ℕ) ≥ 2 := Nat.Prime.two_le h₉
      omega
    omega
  have h₇ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] :=
    by
    haveI : Fact p.Prime := ⟨hp_prime⟩
    have h₈ : (b : ZMod p) ^ p = (b : ZMod p) := by apply ZMod.pow_card
    have h₉ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := by
      simpa [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₈
    exact h₉
  have h₈ : (b : ℤ) ^ (p + 1 : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] := by
    calc
      (b : ℤ) ^ (p + 1 : ℕ) = (b : ℤ) ^ (p : ℕ) * (b : ℤ) := by
        ring_nf <;> simp [Nat.cast_add, Nat.cast_one, pow_add, pow_one] <;> ring_nf
      _ ≡ (b : ℤ) * (b : ℤ) [ZMOD p] :=
        by
        have h₉ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p] := h₇
        have h₁₀ : (b : ℤ) ^ (p : ℕ) * (b : ℤ) ≡ (b : ℤ) * (b : ℤ) [ZMOD p] := by exact Int.ModEq.mul_right _ h₉
        simpa [Int.ModEq] using h₁₀
      _ = (b : ℤ) ^ 2 := by ring
      _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by rfl
  have h₉ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by rfl
  have h₁₀ : (b : ℤ) ^ (4 * k : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p] :=
    by
    have h₁₁ : (4 * k : ℕ) = (p : ℕ) + 1 := by omega
    calc
      (b : ℤ) ^ (4 * k : ℕ) = (b : ℤ) ^ ((p : ℕ) + 1 : ℕ) := by
        rw [h₁₁] <;> simp [Nat.cast_add, Nat.cast_one, pow_add, pow_one] <;> ring_nf
      _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by simpa [Int.ModEq] using h₈
      _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by rfl
  have h₁₁ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p] := by rfl
  have h₁₂ : ((a ^ k : ℤ) ^ 2 : ℤ) ≡ (a : ℤ) [ZMOD p] := by
    calc
      ((a ^ k : ℤ) ^ 2 : ℤ) ≡ ((b ^ 2 : ℤ) ^ (2 * k)) [ZMOD p] := h₄
      _ = (b : ℤ) ^ (4 * k : ℕ) := by ring_nf <;> simp [pow_mul, pow_two, mul_assoc] <;> ring_nf <;> norm_num
      _ ≡ (b : ℤ) ^ 2 [ZMOD p] := h₁₀
      _ ≡ (a : ℤ) [ZMOD p] :=
        by
        have h₁₃ : (b : ℤ) ^ 2 ≡ (a : ℤ) [ZMOD p] := by simpa [Int.ModEq] using h₂
        exact h₁₃
  simpa [pow_two, Int.ModEq] using h₁₂