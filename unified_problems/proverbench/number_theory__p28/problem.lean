theorem prime_remainder_theorem (p : ℕ) (hp : Prime p) :
  let N := (range (p - 1)).prod (λ k => k^2 + 1);
  if p % 4 = 3 then N % p = 4 else N % p = 0 := by
  intro N
  have h_main : (if p % 4 = 3 then N % p = 4 else N % p = 0) := by
    have h₁ : p = 2 → N % p = 0 := by
      intro h
      have h₂ : p = 2 := h
      have h₃ : N = 1 := by
        simp [N, h₂, Finset.prod_range_succ]
      have h₄ : N % p = 1 % 2 := by
        rw [h₃, h₂]
        <;> norm_num
      have h₅ : N % p = 1 := by
        omega
      have h₆ : N % p = 0 := by
        omega
      exact h₆
    have h₂ : p = 3 → N % p = 4 := by
      intro h
      have h₃ : p = 3 := h
      have h₄ : N = 2 := by
        simp [N, h₃, Finset.prod_range_succ]
        <;> norm_num
      have h₅ : N % p = 2 % 3 := by
        rw [h₄, h₃]
        <;> norm_num
      have h₆ : N % p = 2 := by
        omega
      have h₇ : N % p = 4 := by
        omega
      exact h₇
    have h₃ : p = 5 → N % p = 0 := by
      intro h
      have h₄ : p = 5 := h
      have h₅ : N = 100 := by
        simp [N, h₄, Finset.prod_range_succ]
        <;> norm_num
      have h₆ : N % p = 100 % 5 := by
        rw [h₅, h₄]
        <;> norm_num
      have h₇ : N % p = 0 := by
        omega
      exact h₇
    have h₄ : p = 7 → N % p = 4 := by
      intro h
      have h₅ : p = 7 := h
      have h₆ : N = 44200 := by
        simp [N, h₅, Finset.prod_range_succ]
        <;> norm_num
      have h₇ : N % p = 44200 % 7 := by
        rw [h₆, h₅]
        <;> norm_num
      have h₈ : N % p = 2 := by
        omega
      have h₉ : N % p = 4 := by
        omega
      exact h₉
    have h₅ : p = 11 → N % p = 4 := by
      intro h
      have h₆ : p = 11 := h
      have h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 := by
        simp [N, h₆, Finset.prod_range_succ]
        <;> norm_num
      have h₈ : N % p = (1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) % 11 := by
        rw [h₇, h₆]
        <;> norm_num
      have h₉ : N % p = 2 := by
        omega
      have h₁₀ : N % p = 4 := by
        omega
      exact h₁₀
    have h₆ : p % 4 = 3 → N % p = 4 := by
      intro h
      have h₇ : p % 4 = 3 := h
      have h₈ : p = 3 := by
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
          have h₁₂ : p = 3 := by
            omega
          exact h₁₂
      have h₉ : N % p = 4 := by
        apply h₂
        exact h₈
      exact h₉
    have h₇ : p % 4 ≠ 3 → N % p = 0 := by
      intro h
      have h₈ : p % 4 ≠ 3 := h
      have h₉ : p = 2 := by
        have h₁₀ := Nat.Prime.eq_two_or_odd hp
        cases h₁₀ with
        | inl h₁₀ =>
          exact h₁₀
        | inr h₁₀ =>
          have h₁₁ : p % 2 = 1 := h₁₀
          have h₁₂ : p % 4 = 1 ∨ p % 4 = 3 := by
            omega
          cases h₁₂ with
          | inl h₁₂ =>
            exfalso
            have h₁₃ : p % 4 = 1 := h₁₂
            omega
          | inr h₁₂ =>
            exfalso
            have h₁₃ : p % 4 = 3 := h₁₂
            contradiction
      have h₁₀ : N % p = 0 := by
        apply h₁
        exact h₉
      exact h₁₀
    split_ifs with h
    · apply h₆
      exact h
    · apply h₇
      exact h
  exact h_main