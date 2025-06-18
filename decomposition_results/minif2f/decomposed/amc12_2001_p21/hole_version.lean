macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)

theorem amc12_2001_p21 (a b c d : ℕ) (h₀ : a * b * c * d = 8!) (h₁ : a * b + a + b = 524)
    (h₂ : b * c + b + c = 146) (h₃ : c * d + c + d = 104) : ↑a - ↑d = (10 : ℤ) := by
  have h_fact : 8! = 40320 := by
    hole_1
  
  have h_ab : (a + 1) * (b + 1) = 525 := by
    have h₁' : a * b + a + b = 524 := h₁
    have h₁'' : (a + 1) * (b + 1) = 525 := by
      hole_2
    hole_3
  
  have h_a : a = 24 := by
    have h₄ : a + 1 ∣ 525 := by
      hole_4
    have h₅ : a + 1 = 1 ∨ a + 1 = 3 ∨ a + 1 = 5 ∨ a + 1 = 7 ∨ a + 1 = 15 ∨ a + 1 = 21 ∨ a + 1 = 25 ∨ a + 1 = 35 ∨ a + 1 = 75 ∨ a + 1 = 105 ∨ a + 1 = 175 ∨ a + 1 = 525 := by
      have h₅₁ : a + 1 ∣ 525 := h₄
      have h₅₂ : a + 1 ≤ 525 := Nat.le_of_dvd (by norm_num) h₅₁
      hole_5
    rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
    · 
      have h₆ : a = 0 := by hole_6
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      <;> nlinarith
    · 
      have h₆ : a = 2 := by hole_7
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 174 := by hole_8
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 4 := by hole_9
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 104 := by hole_10
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 6 := by hole_11
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 74 := by hole_12
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 14 := by hole_13
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 34 := by hole_14
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 20 := by hole_15
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 24 := by hole_16
      have h₉ : b * c + b + c = 146 := h₂
      rw [h₈] at h₉
      norm_num at h₉
      <;>
      (try omega) <;>
      (try
        {
          have h₁₀ : c = 6 := by
            nlinarith
          rw [h₁₀] at h₃
          norm_num at h₃
          <;> omega
        })
    · 
      have h₆ : a = 24 := by hole_17
      exact h₆
    · 
      have h₆ : a = 34 := by hole_18
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 14 := by hole_19
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 74 := by hole_20
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 6 := by hole_21
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 104 := by hole_22
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 4 := by hole_23
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 174 := by hole_24
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 2 := by hole_25
      have h₉ : a * b * c * d = 8! := h₀
      rw [h₆, h₈] at h₉
      norm_num [h_fact, Nat.factorial] at h₉
      <;> ring_nf at h₉ ⊢ <;> omega
    · 
      have h₆ : a = 524 := by hole_26
      have h₇ : a * b + a + b = 524 := h₁
      rw [h₆] at h₇
      norm_num at h₇
      have h₈ : b = 0 := by hole_27
      have h₉ : a * b * c * d = 8! := h₀
      hole_28
  
  have h_b : b = 20 := by
    have h₄ : (a + 1) * (b + 1) = 525 := h_ab
    hole_29
  
  have h_c : c = 6 := by
    have h₄ : b * c + b + c = 146 := h₂
    rw [h_b] at h₄
    ring_nf at h₄
    have h₅ : c ≤ 146 := by
      by_contra h
      have h₅₁ : c ≥ 147 := by hole_30
      have h₅₂ : 20 * c + 20 + c ≥ 20 * 147 + 20 + 147 := by hole_31
      hole_32
    hole_33
  
  have h_d : d = 14 := by
    have h₄ : c * d + c + d = 104 := h₃
    hole_34
  
  have h_final : ↑a - ↑d = (10 : ℤ) := by
    hole_35
  
  hole_36