macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1974_a3
(assmption : ∀ p : ℕ, p.Prime ∧ p > 2 → ((∃ m n : ℤ, p = m^2 + n^2) ↔ p ≡ 1 [MOD 4]))
: ∀ p : ℕ, ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = x^2 + 16*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).1) ∧ ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = 4*x^2 + 4*x*y + 5*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).2) := by
  intro p
  have h₁ : ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = x^2 + 16*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).1) := by
    constructor
    · 
      intro h
      have h₂ : p.Prime := h.1
      have h₃ : p > 2 := h.2.1
      have h₄ : ∃ (x y : ℤ), p = x ^ 2 + 16 * y ^ 2 := h.2.2
      have h₅ : p.Prime := h₂
      have h₆ : p ≡ 1 [MOD 8] := by
        rcases h₄ with ⟨x, y, h₄⟩
        have h₇ : (p : ℤ) = x ^ 2 + 16 * y ^ 2 := by hole_4
        have h₈ : (x : ℤ) % 2 = 1 ∨ (x : ℤ) % 2 = 0 := by
          have h₉ : (x : ℤ) % 2 = 1 ∨ (x : ℤ) % 2 = 0 := by
            hole_6
          hole_5
        have h₉ : (x : ℤ) % 2 = 1 := by
          by_contra h₉
          have h₁₀ : (x : ℤ) % 2 = 0 := by
            hole_8
          have h₁₁ : (p : ℤ) % 2 = 0 := by
            have h₁₂ : (x : ℤ) % 2 = 0 := h₁₀
            have h₁₃ : (x : ℤ) ^ 2 % 2 = 0 := by
              have h₁₄ : (x : ℤ) % 2 = 0 := h₁₂
              have h₁₅ : (x : ℤ) ^ 2 % 2 = 0 := by
                hole_11
              hole_10
            have h₁₆ : (16 : ℤ) * y ^ 2 % 2 = 0 := by
              have h₁₇ : (16 : ℤ) % 2 = 0 := by hole_13
              have h₁₈ : (y : ℤ) ^ 2 % 2 = 0 ∨ (y : ℤ) ^ 2 % 2 = 1 := by
                have h₁₉ : (y : ℤ) % 2 = 0 ∨ (y : ℤ) % 2 = 1 := by hole_15
                rcases h₁₉ with (h₁₉ | h₁₉)
                · have h₂₀ : (y : ℤ) ^ 2 % 2 = 0 := by
                    have h₂₁ : (y : ℤ) % 2 = 0 := h₁₉
                    have h₂₂ : (y : ℤ) ^ 2 % 2 = 0 := by
                      hole_17
                    hole_16
                  exact Or.inl h₂₀
                · have h₂₀ : (y : ℤ) ^ 2 % 2 = 1 := by
                    have h₂₁ : (y : ℤ) % 2 = 1 := h₁₉
                    have h₂₂ : (y : ℤ) ^ 2 % 2 = 1 := by
                      hole_19
                    hole_18
                  hole_14
              rcases h₁₈ with (h₁₈ | h₁₈)
              · have h₁₉ : (16 : ℤ) * y ^ 2 % 2 = 0 := by
                  hole_20
                exact h₁₉
              · have h₁₉ : (16 : ℤ) * y ^ 2 % 2 = 0 := by
                  hole_21
                hole_12
            have h₂₀ : (p : ℤ) % 2 = 0 := by
              hole_22
            hole_9
          have h₂₁ : (p : ℕ) % 2 = 0 := by
            hole_23
          have h₂₂ : p % 2 = 0 := by
            hole_24
          have h₂₃ : 2 ∣ p := by
            hole_25
          have h₂₄ : ¬p.Prime := by
            intro h₂₄
            have h₂₅ := Nat.Prime.eq_two_or_odd h₂₄
            hole_26
          hole_7
        have h₁₀ : (x : ℤ) % 2 = 1 := h₉
        have h₁₁ : (x : ℤ) ^ 2 % 8 = 1 := by
          have h₁₂ : (x : ℤ) % 8 = 1 ∨ (x : ℤ) % 8 = 3 ∨ (x : ℤ) % 8 = 5 ∨ (x : ℤ) % 8 = 7 := by
            hole_28
          rcases h₁₂ with (h₁₂ | h₁₂ | h₁₂ | h₁₂)
          · have h₁₃ : (x : ℤ) ^ 2 % 8 = 1 := by
              hole_29
            exact h₁₃
          · have h₁₃ : (x : ℤ) ^ 2 % 8 = 1 := by
              hole_30
            exact h₁₃
          · have h₁₃ : (x : ℤ) ^ 2 % 8 = 1 := by
              hole_31
            exact h₁₃
          · have h₁₃ : (x : ℤ) ^ 2 % 8 = 1 := by
              hole_32
            hole_27
        have h₁₂ : (p : ℤ) % 8 = 1 := by
          have h₁₃ : (p : ℤ) = x ^ 2 + 16 * y ^ 2 := h₇
          have h₁₄ : (p : ℤ) % 8 = (x ^ 2 + 16 * y ^ 2 : ℤ) % 8 := by
            hole_34
          have h₁₅ : (x ^ 2 + 16 * y ^ 2 : ℤ) % 8 = 1 := by
            have h₁₆ : (x : ℤ) ^ 2 % 8 = 1 := h₁₁
            have h₁₇ : (16 : ℤ) * y ^ 2 % 8 = 0 := by
              have h₁₈ : (16 : ℤ) % 8 = 0 := by hole_37
              have h₁₉ : (y : ℤ) ^ 2 % 8 = 0 ∨ (y : ℤ) ^ 2 % 8 = 1 ∨ (y : ℤ) ^ 2 % 8 = 4 := by
                have h₂₀ : (y : ℤ) % 8 = 0 ∨ (y : ℤ) % 8 = 1 ∨ (y : ℤ) % 8 = 2 ∨ (y : ℤ) % 8 = 3 ∨ (y : ℤ) % 8 = 4 ∨ (y : ℤ) % 8 = 5 ∨ (y : ℤ) % 8 = 6 ∨ (y : ℤ) % 8 = 7 := by
                  hole_39
                rcases h₂₀ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀)
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 0 := by
                    hole_40
                  exact Or.inl h₂₁
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 1 := by
                    hole_41
                  exact Or.inr (Or.inl h₂₁)
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 4 := by
                    hole_42
                  exact Or.inr (Or.inr h₂₁)
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 1 := by
                    hole_43
                  exact Or.inr (Or.inl h₂₁)
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 0 := by
                    hole_44
                  exact Or.inl h₂₁
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 1 := by
                    hole_45
                  exact Or.inr (Or.inl h₂₁)
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 4 := by
                    hole_46
                  exact Or.inr (Or.inr h₂₁)
                · have h₂₁ : (y : ℤ) ^ 2 % 8 = 1 := by
                    hole_47
                  hole_38
              rcases h₁₉ with (h₁₉ | h₁₉ | h₁₉)
              · have h₂₀ : (16 : ℤ) * y ^ 2 % 8 = 0 := by
                  hole_48
                exact by omega
              · have h₂₀ : (16 : ℤ) * y ^ 2 % 8 = 0 := by
                  hole_49
                exact by omega
              · have h₂₀ : (16 : ℤ) * y ^ 2 % 8 = 0 := by
                  hole_50
                hole_36
            have h₂₁ : (x ^ 2 + 16 * y ^ 2 : ℤ) % 8 = 1 := by
              hole_51
            hole_35
          hole_33
        have h₁₃ : p ≡ 1 [MOD 8] := by
          hole_52
        hole_3
      have h₇ : p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).1 := by
        hole_53
      exact h₇
    · 
      intro h
      have h₂ : p.Prime ∧ p ≡ 1 [MOD 8] := by
        hole_54
      have h₃ : p.Prime := h₂.1
      have h₄ : p ≡ 1 [MOD 8] := h₂.2
      have h₅ : p > 2 := by
        by_contra h₅
        have h₆ : p ≤ 2 := by hole_56
        have h₇ : p = 0 ∨ p = 1 ∨ p = 2 := by
          hole_57
        hole_55
      have h₆ : ∃ (x y : ℤ), p = x ^ 2 + 16 * y ^ 2 := by
        hole_58
      have h₇ : p.Prime ∧ p > 2 ∧ (∃ (x y : ℤ), p = x ^ 2 + 16 * y ^ 2) := by
        hole_59
      hole_2
  have h₂ : ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = 4*x^2 + 4*x*y + 5*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).2) := by
    hole_60
  have h₃ : ((p.Prime ∧ p > 2 ∧ (∃ x y : ℤ, p = 4*x^2 + 4*x*y + 5*y^2)) ↔ p ∈ (({p : ℕ | p.Prime ∧ p ≡ 1 [MOD 8]}, {p : ℕ | p.Prime ∧ p ≡ 5 [MOD 8]}) : (Set ℕ) × (Set ℕ) ).2) := by
    hole_61
  hole_1