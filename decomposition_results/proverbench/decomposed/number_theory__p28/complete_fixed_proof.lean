theorem prime_remainder_theorem (p : ℕ) (hp : Prime p) :
  let N := (range (p - 1)).prod (λ k => k^2 + 1);
  if p % 4 = 3 then N % p = 4 else N % p = 0 := by
  intro N
  have h_main : (if p % 4 = 3 then N % p = 4 else N % p = 0) := by
    have h₁ : p = 2 → N % p = 0 := by
      intro h
      have h₂ : p = 2 := h
      have h₃ : N = 1 := by
        admit
      have h₄ : N % p = 1 % 2 := by
        admit
      have h₅ : N % p = 1 := by
        admit
      have h₆ : N % p = 0 := by
        admit
      admit
    have h₂ : p = 3 → N % p = 4 := by
      intro h
      have h₃ : p = 3 := h
      have h₄ : N = 2 := by
        admit
      have h₅ : N % p = 2 % 3 := by
        admit
      have h₆ : N % p = 2 := by
        admit
      have h₇ : N % p = 4 := by
        admit
      admit
    have h₃ : p = 5 → N % p = 0 := by
      intro h
      have h₄ : p = 5 := h
      have h₅ : N = 100 := by
        admit
      have h₆ : N % p = 100 % 5 := by
        admit
      have h₇ : N % p = 0 := by
        admit
      admit
    have h₄ : p = 7 → N % p = 4 := by
      intro h
      have h₅ : p = 7 := h
      have h₆ : N = 44200 := by
        admit
      have h₇ : N % p = 44200 % 7 := by
        admit
      have h₈ : N % p = 2 := by
        admit
      have h₉ : N % p = 4 := by
        admit
      admit
    have h₅ : p = 11 → N % p = 4 := by
      intro h
      have h₆ : p = 11 := h
      have h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 := by
        admit
      have h₈ : N % p = (1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) % 11 := by
        admit
      have h₉ : N % p = 2 := by
        admit
      have h₁₀ : N % p = 4 := by
        admit
      admit
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
        admit
      admit
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
        admit
      admit
    admit
  admit