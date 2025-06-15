macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem prime_remainder_theorem (p : ℕ) (hp : Prime p) :
  let N := (range (p - 1)).prod (λ k => k^2 + 1);
  if p % 4 = 3 then N % p = 4 else N % p = 0 := by
  intro N
  have h_main : (if p % 4 = 3 then N % p = 4 else N % p = 0) := by
    have h₁ : p = 2 → N % p = 0 := by
      intro h
      have h₂ : p = 2 := h
      have h₃ : N = 1 := by
        hole_4
      have h₄ : N % p = 1 % 2 := by
        hole_5
      have h₅ : N % p = 1 := by
        hole_6
      have h₆ : N % p = 0 := by
        hole_7
      hole_3
    have h₂ : p = 3 → N % p = 4 := by
      intro h
      have h₃ : p = 3 := h
      have h₄ : N = 2 := by
        hole_9
      have h₅ : N % p = 2 % 3 := by
        hole_10
      have h₆ : N % p = 2 := by
        hole_11
      have h₇ : N % p = 4 := by
        hole_12
      hole_8
    have h₃ : p = 5 → N % p = 0 := by
      intro h
      have h₄ : p = 5 := h
      have h₅ : N = 100 := by
        hole_14
      have h₆ : N % p = 100 % 5 := by
        hole_15
      have h₇ : N % p = 0 := by
        hole_16
      hole_13
    have h₄ : p = 7 → N % p = 4 := by
      intro h
      have h₅ : p = 7 := h
      have h₆ : N = 44200 := by
        hole_18
      have h₇ : N % p = 44200 % 7 := by
        hole_19
      have h₈ : N % p = 2 := by
        hole_20
      have h₉ : N % p = 4 := by
        hole_21
      hole_17
    have h₅ : p = 11 → N % p = 4 := by
      intro h
      have h₆ : p = 11 := h
      have h₇ : N = 1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82 := by
        hole_23
      have h₈ : N % p = (1 * 2 * 5 * 10 * 17 * 26 * 37 * 50 * 65 * 82) % 11 := by
        hole_24
      have h₉ : N % p = 2 := by
        hole_25
      have h₁₀ : N % p = 4 := by
        hole_26
      hole_22
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
        hole_28
      hole_27
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
        hole_30
      hole_29
    hole_2
  hole_1