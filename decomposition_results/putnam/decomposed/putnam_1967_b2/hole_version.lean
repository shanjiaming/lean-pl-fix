macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)

theorem putnam_1967_b2
(p r A B C α β γ : ℝ)
(prbound : 0 ≤ p ∧ p ≤ 1 ∧ 0 ≤ r ∧ r ≤ 1)
(id1 : ∀ x y : ℝ, (p * x + (1 - p) * y) ^ 2 = A * x ^ 2 + B * x * y + C * y ^ 2)
(id2 : ∀ x y : ℝ, (p * x + (1 - p) * y) * (r * x + (1 - r) * y) = α * x ^ 2 + β * x * y + γ * y ^ 2)
: max (max A B) C ≥ 4 / 9 ∧ max (max α β) γ ≥ 4 / 9 := by
  have hA : A = p ^ 2 := by
    have h₁ := id1 1 0
    have h₂ := id1 0 1
    have h₃ := id1 2 1
    have h₄ := id1 1 2
    have h₅ := id1 (-1) 1
    have h₆ := id1 1 (-1)
    have h₇ := id1 2 (-1)
    have h₈ := id1 (-1) 2
    hole_1
  
  have hB : B = 2 * p * (1 - p) := by
    have h₁ := id1 1 0
    have h₂ := id1 0 1
    have h₃ := id1 1 1
    have h₄ := id1 2 1
    have h₅ := id1 1 2
    have h₆ := id1 (-1) 1
    have h₇ := id1 1 (-1)
    have h₈ := id1 2 (-1)
    have h₉ := id1 (-1) 2
    hole_2
  
  have hC : C = (1 - p) ^ 2 := by
    have h₁ := id1 1 0
    have h₂ := id1 0 1
    have h₃ := id1 1 1
    have h₄ := id1 2 1
    have h₅ := id1 1 2
    have h₆ := id1 (-1) 1
    have h₇ := id1 1 (-1)
    have h₈ := id1 2 (-1)
    have h₉ := id1 (-1) 2
    hole_3
  
  have h_max_ABC : max (max A B) C ≥ 4 / 9 := by
    have h₁ : p ≤ 1 := by hole_5
    have h₂ : 0 ≤ p := by hole_6
    have h₃ : max (max A B) C ≥ 4 / 9 := by
      
      by_cases h₄ : p ≤ 1 / 3
      · 
        have h₅ : C ≥ 4 / 9 := by
          have h₅₁ : C = (1 - p) ^ 2 := hC
          rw [h₅₁]
          have h₅₂ : 0 ≤ 1 - p := by hole_9
          have h₅₃ : 1 - p ≥ 2 / 3 := by hole_10
          hole_8
        have h₅' : max (max A B) C ≥ C := by
          hole_11
        linarith
      · 
        by_cases h₅ : p ≥ 2 / 3
        · 
          have h₆ : A ≥ 4 / 9 := by
            have h₆₁ : A = p ^ 2 := hA
            hole_12
          have h₆' : max (max A B) C ≥ A := by
            hole_13
          linarith
        · 
          have h₆ : B ≥ 4 / 9 := by
            have h₆₁ : B = 2 * p * (1 - p) := hB
            rw [h₆₁]
            have h₆₂ : 1 / 3 ≤ p := by hole_15
            have h₆₃ : p ≤ 2 / 3 := by hole_16
            have h₆₄ : 0 ≤ p := by hole_17
            have h₆₅ : 0 ≤ 1 - p := by hole_18
            hole_14
          have h₆' : max (max A B) C ≥ B := by
            hole_19
          hole_7
    hole_4
  
  have hα : α = p * r := by
    have h₁ := id2 1 0
    have h₂ := id2 0 1
    have h₃ := id2 1 1
    have h₄ := id2 2 1
    have h₅ := id2 1 2
    have h₆ := id2 (-1) 1
    have h₇ := id2 1 (-1)
    have h₈ := id2 2 (-1)
    have h₉ := id2 (-1) 2
    hole_20
  
  have hβ : β = p + r - 2 * p * r := by
    have h₁ := id2 1 0
    have h₂ := id2 0 1
    have h₃ := id2 1 1
    have h₄ := id2 2 1
    have h₅ := id2 1 2
    have h₆ := id2 (-1) 1
    have h₇ := id2 1 (-1)
    have h₈ := id2 2 (-1)
    have h₉ := id2 (-1) 2
    hole_21
  
  have hγ : γ = (1 - p) * (1 - r) := by
    have h₁ := id2 1 0
    have h₂ := id2 0 1
    have h₃ := id2 1 1
    have h₄ := id2 2 1
    have h₅ := id2 1 2
    have h₆ := id2 (-1) 1
    have h₇ := id2 1 (-1)
    have h₈ := id2 2 (-1)
    have h₉ := id2 (-1) 2
    norm_num at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ ⊢
    <;> nlinarith [prbound.1, prbound.2.1, prbound.2.2.1, prbound.2.2.2, hA, hB, hC, hα, hβ]
  
  have h_max_αβγ : max (max α β) γ ≥ 4 / 9 := by
    have h₁ : α + γ = 1 - β := by
      rw [hα, hβ, hγ]
      <;> ring
      <;> nlinarith [prbound.1, prbound.2.1, prbound.2.2.1, prbound.2.2.2]
    have h₂ : α * γ ≤ ((α + γ) / 2) ^ 2 := by
      nlinarith [sq_nonneg (α - γ), sq_nonneg (α + γ)]
    by_contra h
    have h₃ : max (max α β) γ < 4 / 9 := by
      simp_all [max_lt_iff]
      <;> (try norm_num) <;> (try linarith) <;> (try nlinarith)
    have h₄ : α < 4 / 9 := by
      cases' max_cases (max α β) γ with h₄ h₄ <;>
        cases' max_cases α β with h₅ h₅ <;>
          simp_all [max_lt_iff] <;>
            (try norm_num) <;>
              (try linarith) <;>
                (try nlinarith)
    have h₅ : γ < 4 / 9 := by
      cases' max_cases (max α β) γ with h₅ h₅ <;>
        cases' max_cases α β with h₆ h₆ <;>
          simp_all [max_lt_iff] <;>
            (try norm_num) <;>
              (try linarith) <;>
                (try nlinarith)
    have h₆ : α * γ < 16 / 81 := by
      nlinarith
    have h₇ : β < 1 / 9 := by
      have h₇₁ : α * γ ≤ ((α + γ) / 2) ^ 2 := h₂
      have h₇₂ : α + γ = 1 - β := h₁
      have h₇₃ : α * γ < 16 / 81 := h₆
      have h₇₄ : (1 - β) ^ 2 > 64 / 81 := by
        nlinarith
      have h₇₅ : β < 1 / 9 := by
        nlinarith
      exact h₇₅
    have h₈ : α + γ > 8 / 9 := by
      have h₈₁ : α + γ = 1 - β := h₁
      have h₈₂ : β < 1 / 9 := h₇
      nlinarith
    have h₉ : α + γ < 8 / 9 := by
      nlinarith
    linarith
  
  exact ⟨h_max_ABC, h_max_αβγ⟩