theorem prime_remainder_theorem (p : ℕ) (hp : Prime p) :
  let N:= sorry;
  if p % 4 = 3 then N % p = 4 else N % p = 0 := (range (p - 1)).prod (λ k => k ^ 2 + 1);
  if p % 4 = 3 then N % p = 4 else N % p = 0 :=
  by
  intro N
  have h_main : (if p % 4 = 3 then N % p = 4 else N % p = 0):= sorry) : if p % 4 = 3 then N % p = 4 else N % p = 0 :=
    by
    have h₁ : p = 2 → N % p = 0:= sorry) : p = 2 → N % p = 0 := by
      --  intro h
      have h₂ : p = 2 := h
      have h₃ : N = 1:= sorry) (h h₂ : p = 2) : N = 1 := by -- simp [N, h₂, Finset.prod_range_succ]
        hole
      have h₄ : N % p = 1 % 2:= sorry) (h h₂ : p = 2) (h₃ : N = 1) : N % p = 1 % 2 := by -- rw [h₃, h₂] <;> norm_num
        hole
      have h₅ : N % p = 1:= sorry) (h h₂ : p = 2) (h₃ : N = 1) (h₄ : N % p = 1 % 2) : N % p = 1 := by -- omega
        omega
      have h₆ : N % p = 0:= sorry) (h h₂ : p = 2) (h₃ : N = 1) (h₄ : N % p = 1 % 2) (h₅ : N % p = 1) : N % p = 0 := by -- omega
        hole
      --  exact h₆
      hole
    have h₂ : p = 3 → N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) : p = 3 → N % p = 4 := by
      --  intro h
      have h₃ : p = 3 := h
      have h₄ : N = 2:= sorry) (h₁ : p = 2 → N % p = 0) (h h₃ : p = 3) : N = 2 := by -- simp [N, h₃, Finset.prod_range_succ] <;> norm_num
        hole
      have h₅ : N % p = 2 % 3:= sorry) (h₁ : p = 2 → N % p = 0) (h h₃ : p = 3) (h₄ : N = 2) : N % p = 2 % 3 := by -- rw [h₄, h₃] <;> norm_num
        hole
      have h₆ : N % p = 2:= sorry) (h₁ : p = 2 → N % p = 0) (h h₃ : p = 3) (h₄ : N = 2) (h₅ : N % p = 2 % 3) : N % p = 2 := by -- omega
        omega
      have h₇ : N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h h₃ : p = 3) (h₄ : N = 2) (h₅ : N % p = 2 % 3) (h₆ : N % p = 2) : N % p = 4 := by -- omega
        hole
      --  exact h₇
      hole
    have h₃ : p = 5 → N % p = 0:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) : p = 5 → N % p = 0 := by
      --  intro h
      have h₄ : p = 5 := h
      have h₅ : N = 100:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h h₄ : p = 5) : N = 100 := by -- simp [N, h₄, Finset.prod_range_succ] <;> norm_num
        hole
      have h₆ : N % p = 100 % 5:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h h₄ : p = 5) (h₅ : N = 100) : N % p = 100 % 5 := by -- rw [h₅, h₄] <;> norm_num
        hole
      have h₇ : N % p = 0:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h h₄ : p = 5) (h₅ : N = 100) (h₆ : N % p = 100 % 5) : N % p = 0 := by -- omega
        omega
      --  exact h₇
      hole
    have h₄ : p = 7 → N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) : p = 7 → N % p = 4 := by
      --  intro h
      have h₅ : p = 7 := h
      have h₆ : N = 44200:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h h₅ : p = 7) : N = 44200 := by -- simp [N, h₅, Finset.prod_range_succ] <;> norm_num
        hole
      have h₇ : N % p = 44200 % 7:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h h₅ : p = 7) (h₆ : N = 44200) : N % p = 44200 % 7 := by -- rw [h₆, h₅] <;> norm_num
        hole
      have h₈ : N % p = 2:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h h₅ : p = 7) (h₆ : N = 44200) (h₇ : N % p = 44200 % 7) : N % p = 2 := by -- omega
        omega
      have h₉ : N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h h₅ : p = 7) (h₆ : N = 44200) (h₇ : N % p = 44200 % 7) (h₈ : N % p = 2) : N % p = 4 := by -- omega
        hole
      --  exact h₉
      hole
    have h₅ : p = 11 → N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) : p = 11 → N % p = 4 := by
      --  intro h
      have h₆ : p = 11 := h
      have h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h h₆ : p = 11) : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 := by -- -- simp [N, h₆, Finset.prod_range_succ] <;> norm_num
        hole
      have h₈ : N % p = (1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) % 11:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h h₆ : p = 11) (h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) : N % p = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 % 11 := by -- rw [h₇, h₆] <;> norm_num
        hole
      have h₉ : N % p = 2:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h h₆ : p = 11) (h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) (h₈ : N % p = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 % 11) : N % p = 2 := by -- omega
        omega
      have h₁₀ : N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h h₆ : p = 11) (h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) (h₈ : N % p = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 % 11) (h₉ : N % p = 2) : N % p = 4 := by -- omega
        hole
      --  exact h₁₀
      hole
    have h₆ : p % 4 = 3 → N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) : p % 4 = 3 → N % p = 4 := by
      --  intro h
      have h₇ : p % 4 = 3 := h
      have h₈ : p = 3:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) (h h₇ : p % 4 = 3) : p = 3 := by
        have h₉ := Nat.Prime.eq_two_or_odd hp
        cases h₉ with
        | inl h₉ =>
          exfalso
          have h₁₀ : p = 2 := h₉
          have h₁₁ : p % 4 = 2 := by omega
          omega
        | inr h₉ =>
          have h₁₀ : p % 2 = 1 := h₉
          have h₁₁ : p % 4 = 3 := h₇
          have h₁₂ : p = 3 := by omega
          exact h₁₂
        hole
      have h₉ : N % p = 4:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) (h h₇ : p % 4 = 3) (h₈ : p = 3) : N % p = 4 := by
        --  apply h₂
        --  exact h₈
        omega
      --  exact h₉
      hole
    have h₇ : p % 4 ≠ 3 → N % p = 0:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) (h₆ : p % 4 = 3 → N % p = 4) : p % 4 ≠ 3 → N % p = 0 := by
      --  intro h
      have h₈ : p % 4 ≠ 3 := h
      have h₉ : p = 2:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) (h₆ : p % 4 = 3 → N % p = 4) (h h₈ : p % 4 ≠ 3) : p = 2 := by
        have h₁₀ := Nat.Prime.eq_two_or_odd hp
        cases h₁₀ with
        | inl h₁₀ => exact h₁₀
        | inr h₁₀ =>
          have h₁₁ : p % 2 = 1 := h₁₀
          have h₁₂ : p % 4 = 1 ∨ p % 4 = 3 := by omega
          cases h₁₂ with
          | inl h₁₂ =>
            exfalso
            have h₁₃ : p % 4 = 1 := h₁₂
            omega
          | inr h₁₂ =>
            exfalso
            have h₁₃ : p % 4 = 3 := h₁₂
            contradiction
        hole
      have h₁₀ : N % p = 0:= sorry) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) (h₆ : p % 4 = 3 → N % p = 4) (h h₈ : p % 4 ≠ 3) (h₉ : p = 2) : N % p = 0 := by
        --  apply h₁
        --  exact h₉
        omega
      --  exact h₁₀
      hole
    --  split_ifs with h
    --  · apply h₆
    --    exact h
    --  · apply h₇
    --    exact h
    hole
  exact h_main
  hole