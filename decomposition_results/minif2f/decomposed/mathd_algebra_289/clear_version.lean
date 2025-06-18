macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_289 (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k)
    (h₂ : (k ^ 2 : ℤ) - m * k + n = 0) (h₃ : (t ^ 2 : ℤ) - m * t + n = 0) :
    m ^ n + n ^ m + k ^ t + t ^ k = 20 := by
  have h₄ : (m : ℤ) = (k : ℤ) + (t : ℤ) := by
    have h₄₁ : ((k : ℤ) - (t : ℤ)) * ((k : ℤ) + (t : ℤ) - (m : ℤ)) = 0 := by
      have h₄₂ : (k : ℤ) ^ 2 - m * k + n = 0 := by hole_4
      have h₄₃ : (t : ℤ) ^ 2 - m * t + n = 0 := by hole_5
      have h₄₄ : ((k : ℤ) ^ 2 - m * k + n) - ((t : ℤ) ^ 2 - m * t + n) = 0 := by
        hole_6
      have h₄₅ : ((k : ℤ) ^ 2 - m * k + n) - ((t : ℤ) ^ 2 - m * t + n) = (k : ℤ) ^ 2 - m * k + n - ((t : ℤ) ^ 2 - m * t + n) := by hole_7
      rw [h₄₅] at h₄₄
      have h₄₆ : (k : ℤ) ^ 2 - m * k + n - ((t : ℤ) ^ 2 - m * t + n) = (k : ℤ) ^ 2 - m * k - (t : ℤ) ^ 2 + m * t := by hole_8
      rw [h₄₆] at h₄₄
      have h₄₇ : (k : ℤ) ^ 2 - m * k - (t : ℤ) ^ 2 + m * t = 0 := by hole_9
      have h₄₈ : (k : ℤ) ^ 2 - (t : ℤ) ^ 2 - m * k + m * t = 0 := by hole_10
      have h₄₉ : ((k : ℤ) - (t : ℤ)) * ((k : ℤ) + (t : ℤ)) - m * ((k : ℤ) - (t : ℤ)) = 0 := by
        hole_11
      have h₅₀ : ((k : ℤ) - (t : ℤ)) * ((k : ℤ) + (t : ℤ) - (m : ℤ)) = 0 := by
        hole_12
      hole_3
    have h₅₁ : (k : ℤ) ≠ (t : ℤ) := by
      intro h
      have h₅₂ : k = t := by
        hole_14
      have h₅₃ : t < k := h₁
      hole_13
    have h₅₄ : ((k : ℤ) + (t : ℤ) - (m : ℤ)) = 0 := by
      have h₅₅ : ((k : ℤ) - (t : ℤ)) ≠ 0 := by
        hole_16
      have h₅₆ : ((k : ℤ) - (t : ℤ)) * ((k : ℤ) + (t : ℤ) - (m : ℤ)) = 0 := h₄₁
      have h₅₇ : ((k : ℤ) + (t : ℤ) - (m : ℤ)) = 0 := by
        hole_17
      hole_15
    have h₅₈ : (m : ℤ) = (k : ℤ) + (t : ℤ) := by hole_18
    hole_2
  
  have h₅ : m = k + t := by
    have h₅₁ : (m : ℤ) = (k : ℤ) + (t : ℤ) := h₄
    have h₅₂ : m = k + t := by
      hole_20
    hole_19
  
  have h₆ : n = t * k := by
    have h₆₁ : k ^ 2 + n = m * k := by
      have h₆₂ : (k ^ 2 : ℤ) + (n : ℤ) = (m * k : ℤ) := by
        have h₆₃ : (k ^ 2 : ℤ) - m * k + n = 0 := h₂
        hole_23
      hole_22
    have h₆₄ : n = t * k := by
      have h₆₅ : m = k + t := h₅
      hole_24
    hole_21
  
  have h₇ : t = 1 := by
    have h₇₁ : n = t * k := h₆
    have h₇₂ : Nat.Prime n := h₀.2
    have h₇₃ : t ∣ n := by
      hole_26
    clear h₇₃
    have h₇₃ : t ∣ n := skip_hole
    have h₇₄ : t = 1 ∨ t = n := by
      have h₇₅ : Nat.Prime n := h₀.2
      hole_27
    hole_25
  
  have h₈ : k = n := by
    have h₈₁ : n = t * k := h₆
    have h₈₂ : t = 1 := h₇
    hole_35
  
  have h₉ : n = 2 := by
    have h₉₁ : m = k + t := h₅
    have h₉₂ : k = n := h₈
    have h₉₃ : t = 1 := h₇
    have h₉₄ : m = n + 1 := by
      hole_37
    have h₉₅ : Nat.Prime m := h₀.1
    have h₉₆ : Nat.Prime n := h₀.2
    have h₉₇ : n = 2 := by
      by_contra h
      have h₉₈ := h₉₆.eq_two_or_odd
      have h₉₉ := h₉₅.eq_two_or_odd
      cases' h₉₈ with h₉₈ h₉₈
      · exfalso
        omega
      · cases' h₉₉ with h₉₉ h₉₉
        · exfalso
          have h₁₀₀ := h₉₅.two_le
          have h₁₀₁ := h₉₆.two_le
          omega
        · have h₁₀₂ : m % 2 = 0 := by
            hole_39
          have h₁₀₃ : m = 2 := by
            have h₁₀₄ := h₉₅.eq_two_or_odd
            hole_40
          have h₁₀₅ : n = 1 := by
            hole_41
          have h₁₀₆ : Nat.Prime n := h₀.2
          have h₁₀₇ := h₁₀₆.eq_two_or_odd
          hole_38
    hole_36
  
  have h₁₀ : m = 3 := by
    have h₁₀₁ : m = k + t := h₅
    have h₁₀₂ : k = n := h₈
    have h₁₀₃ : t = 1 := h₇
    have h₁₀₄ : n = 2 := h₉
    have h₁₀₅ : m = 3 := by
      hole_43
    hole_42
  
  have h₁₁ : k = 2 := by
    have h₁₁₁ : k = n := h₈
    have h₁₁₂ : n = 2 := h₉
    hole_44
  
  have h₁₂ : t = 1 := by
    hole_45
  
  have h₁₃ : m ^ n + n ^ m + k ^ t + t ^ k = 20 := by
    hole_46
  
  hole_1