theorem h_max_αβγ (p r A B C α β γ : ℝ) (prbound : 0 ≤ p ∧ p ≤ 1 ∧ 0 ≤ r ∧ r ≤ 1) (id1 : ∀ (x y : ℝ), (p * x + (1 - p) * y) ^ 2 = A * x ^ 2 + B * x * y + C * y ^ 2) (id2 : ∀ (x y : ℝ), (p * x + (1 - p) * y) * (r * x + (1 - r) * y) = α * x ^ 2 + β * x * y + γ * y ^ 2) (hA : A = p ^ 2) (hB : B = 2 * p * (1 - p)) (hC : C = (1 - p) ^ 2) (h_max_ABC : max (max A B) C ≥ 4 / 9) (hα : α = p * r) (hβ : β = p + r - 2 * p * r) (hγ : γ = (1 - p) * (1 - r)) : max (max α β) γ ≥ 4 / 9 :=
  by
  have h₁ : α + γ = 1 - β := by sorry
  have h₂ : α * γ ≤ ((α + γ) / 2) ^ 2 := by sorry
  --  by_contra h
  have h₃ : max (max α β) γ < 4 / 9 := by
    simp_all [max_lt_iff] <;> (try norm_num) <;> (try linarith) <;> (try nlinarith)
  have h₄ : α < 4 / 9 := by sorry
  have h₅ : γ < 4 / 9 := by sorry
  have h₆ : α * γ < 16 / 81 := by sorry
  have h₇ : β < 1 / 9 := by sorry
  have h₈ : α + γ > 8 / 9 := by sorry
  have h₉ : α + γ < 8 / 9 := by sorry
  have h₃ : max (max α β) γ < 4 / 9 := by sorry
have h_max_αβγ : max (max α β) γ ≥ 4 / 9 :=
  by
  have h₁ : α + γ = 1 - β := by sorry
  have h₂ : α * γ ≤ ((α + γ) / 2) ^ 2 := by sorry
  by_contra h
  have h₃ : max (max α β) γ < 4 / 9 := by
    simp_all [max_lt_iff] <;> (try norm_num) <;> (try linarith) <;> (try nlinarith)
  have h₄ : α < 4 / 9 := by
    cases' max_cases (max α β) γ with h₄ h₄ <;> cases' max_cases α β with h₅ h₅ <;> simp_all [max_lt_iff] <;>
          (try norm_num) <;>
        (try linarith) <;>
      (try nlinarith)
  have h₅ : γ < 4 / 9 := by
    cases' max_cases (max α β) γ with h₅ h₅ <;> cases' max_cases α β with h₆ h₆ <;> simp_all [max_lt_iff] <;>
          (try norm_num) <;>
        (try linarith) <;>
      (try nlinarith)
  have h₆ : α * γ < 16 / 81 := by nlinarith
  have h₇ : β < 1 / 9 := by
    have h₇₁ : α * γ ≤ ((α + γ) / 2) ^ 2 := h₂
    have h₇₂ : α + γ = 1 - β := h₁
    have h₇₃ : α * γ < 16 / 81 := h₆
    have h₇₄ : (1 - β) ^ 2 > 64 / 81 := by nlinarith
    have h₇₅ : β < 1 / 9 := by nlinarith
    exact h₇₅
  have h₈ : α + γ > 8 / 9 := by
    have h₈₁ : α + γ = 1 - β := h₁
    have h₈₂ : β < 1 / 9 := h₇
    nlinarith
  have h₉ : α + γ < 8 / 9 := by nlinarith
  linarith
  hole