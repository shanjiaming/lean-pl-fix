theorem solutions_of_quadratic_congruence :
  (∀ x : ℤ, x ^ 2 ≡ a [ZMOD p] → (x ≡ a ^ k [ZMOD p] ∨ x ≡ -a ^ k [ZMOD p])) ∧ ((a ^ k) ^ 2 ≡ a [ZMOD p]):=
  by
  have h_main : (a ^ k) ^ 2 ≡ a [ZMOD p]:=
    by
    have h₁ : ∃ (x : ℤ), x ^ 2 ≡ a [ZMOD p] := ha
    --  obtain ⟨b, hb⟩ := h₁
    have h₂ : b ^ 2 ≡ a [ZMOD p] := hb
    have h₃ : (a ^ k : ℤ) ≡ (b ^ 2) ^ k [ZMOD p]:= by
      --  calc
      --    (a ^ k : ℤ) ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] :=
      --      by
      --      have h₄ : (a : ℤ) ≡ (b ^ 2 : ℤ) [ZMOD p] := by simpa [Int.ModEq] using h₂
      --      have h₅ : (a : ℤ) ^ k ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] := by exact Int.ModEq.pow k h₄
      --      simpa [Int.ModEq] using h₅
      --    _ = (b ^ 2 : ℤ) ^ k := by norm_num
      hole
    have h₄ : (a ^ k : ℤ) ^ 2 ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p]:= by
      --  calc
      --    (a ^ k : ℤ) ^ 2 = (a ^ k : ℤ) ^ 2 := by rfl
      --    _ ≡ ((b ^ 2 : ℤ) ^ k) ^ 2 [ZMOD p] :=
      --      by
      --      have h₅ : (a ^ k : ℤ) ≡ (b ^ 2 : ℤ) ^ k [ZMOD p] := h₃
      --      have h₆ : ((a ^ k : ℤ) : ℤ) ^ 2 ≡ ((b ^ 2 : ℤ) ^ k : ℤ) ^ 2 [ZMOD p] := by exact Int.ModEq.pow 2 h₅
      --      simpa [pow_two, mul_assoc, Int.ModEq] using h₆
      --    _ = (b ^ 2 : ℤ) ^ (2 * k) := by ring_nf <;> simp [pow_mul, pow_two, mul_assoc] <;> ring_nf <;> norm_num
      --    _ ≡ (b ^ 2 : ℤ) ^ (2 * k) [ZMOD p] := by rfl
      hole
    have h₅ : (p : ℕ) = 4 * k - 1:= by -- omega
      linarith
    have h₆ : (4 * k : ℕ) = (p : ℕ) + 1 :=
      by
      have h₇ : (p : ℕ) = 4 * k - 1 := by omega
      have h₈ : (4 * k : ℕ) ≥ 1 := by
        have h₉ : Nat.Prime p := hp_prime
        have h₁₀ : (p : ℕ) ≥ 2 := Nat.Prime.two_le h₉
        omega
      omega
    have h₇ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p]:=
      by
      --  haveI : Fact p.Prime := ⟨hp_prime⟩
      have h₈ : (b : ZMod p) ^ p = (b : ZMod p):= by -- apply ZMod.pow_card
        hole
      have h₉ : (b : ℤ) ^ (p : ℕ) ≡ (b : ℤ) [ZMOD p]:= by -- simpa [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₈
        hole
      --  exact h₉
      simpa
    have h₈ : (b : ℤ) ^ (p + 1 : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p]:= by
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
    have h₉ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p]:= by -- rfl
      norm_num
    have h₁₀ : (b : ℤ) ^ (4 * k : ℕ) ≡ (b : ℤ) ^ 2 [ZMOD p]:=
      by
      have h₁₁ : (4 * k : ℕ) = (p : ℕ) + 1:= by -- omega
        linarith
      --  calc
      --    (b : ℤ) ^ (4 * k : ℕ) = (b : ℤ) ^ ((p : ℕ) + 1 : ℕ) := by
      --      rw [h₁₁] <;> simp [Nat.cast_add, Nat.cast_one, pow_add, pow_one] <;> ring_nf
      --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by simpa [Int.ModEq] using h₈
      --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := by rfl
      hole
    have h₁₁ : (b : ℤ) ^ (2 * k : ℕ) ≡ (b : ℤ) ^ (2 * k : ℕ) [ZMOD p]:= by -- rfl
      norm_num
    have h₁₂ : ((a ^ k : ℤ) ^ 2 : ℤ) ≡ (a : ℤ) [ZMOD p]:= by
      --  calc
      --    ((a ^ k : ℤ) ^ 2 : ℤ) ≡ ((b ^ 2 : ℤ) ^ (2 * k)) [ZMOD p] := h₄
      --    _ = (b : ℤ) ^ (4 * k : ℕ) := by ring_nf <;> simp [pow_mul, pow_two, mul_assoc] <;> ring_nf <;> norm_num
      --    _ ≡ (b : ℤ) ^ 2 [ZMOD p] := h₁₀
      --    _ ≡ (a : ℤ) [ZMOD p] :=
      --      by
      --      have h₁₃ : (b : ℤ) ^ 2 ≡ (a : ℤ) [ZMOD p] := by simpa [Int.ModEq] using h₂
      --      exact h₁₃
      hole
    have h₆ : (4 * k : ℕ) = (p : ℕ) + 1:= by
      have h₇ : (p : ℕ) = 4 * k - 1:= by -- omega
        linarith
      have h₈ : (4 * k : ℕ) ≥ 1:= by
        have h₉ : Nat.Prime p := hp_prime
        have h₁₀ : (p : ℕ) ≥ 2 := Nat.Prime.two_le h₉
        --  omega
        omega
      --  omega
      omega
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
    hole
  have h_main₂ : ∀ (y : ℤ), y ^ 2 ≡ a [ZMOD p] → (y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p]):=
    by
    --  intro y hy
    have h₁ : y ^ 2 ≡ a [ZMOD p] := hy
    have h₂ : (a ^ k : ℤ) ^ 2 ≡ a [ZMOD p] := h_main
    have h₃ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p]:= by
      --  calc
      --    (y : ℤ) ^ 2 ≡ a [ZMOD p] := h₁
      --    _ ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := by simpa [Int.ModEq] using h₂.symm
      hole
    have h₄ : y ≡ a ^ k [ZMOD p] ∨ y ≡ -a ^ k [ZMOD p]:=
      by
      have h₅ : (y : ℤ) ^ 2 ≡ (a ^ k : ℤ) ^ 2 [ZMOD p] := h₃
      have h₆ : (y - a ^ k : ℤ) * (y + a ^ k : ℤ) ≡ 0 [ZMOD p]:= by
        --  calc
        --    (y - a ^ k : ℤ) * (y + a ^ k : ℤ) = (y : ℤ) ^ 2 - (a ^ k : ℤ) ^ 2 := by ring
        --    _ ≡ (a ^ k : ℤ) ^ 2 - (a ^ k : ℤ) ^ 2 [ZMOD p] := by
        --      gcongr <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] <;> ring_nf <;> omega
        --    _ = 0 := by ring
        --    _ ≡ 0 [ZMOD p] := by simp [Int.ModEq]
        hole
      have h₇ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ):=
        by
        --  rw [Int.dvd_iff_emod_eq_zero]
        --  exact h₆
        hole
      have h₈ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ):=
        by
        have h₉ : (Nat.Prime p) := hp_prime
        have h₁₀ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₇
        have h₁₁ : (p : ℤ) ∣ (y - a ^ k : ℤ) ∨ (p : ℤ) ∣ (y + a ^ k : ℤ):=
          by
          have h₁₂ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₁₀
          --  exact
          --    (by
          --      have h₁₃ : (Nat.Prime p) := hp_prime
          --      have h₁₄ : (p : ℤ) ∣ (y - a ^ k : ℤ) * (y + a ^ k : ℤ) := h₁₀
          --      exact?)
          hole
        --  exact h₁₁
        simpa
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
    --  exact h₄
    hole
  --  exact ⟨h_main₂, h_main⟩
  norm_cast