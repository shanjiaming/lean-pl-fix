theorem aime_2024ii_p14 (b : ℕ) (h₀ : 2 ≤ b) (h₁ : (beautifulSet b).card ≥ 10)
  (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) : b = 211:=
  by
  have h₃ : b ≥ 211:= by
    --  by_contra h
    have h₄ : b ≤ 210:= by -- omega
      linarith
    have h₅ : b < 211:= by -- omega
      linarith
    have h₆ : b ∈ Finset.Ico 2 b → False:= by
      --  intro h₇
      have h₈ : (beautifulSet b).card < 10 := h₂ b h₇
      --  linarith
      hole
    have h₉ : b ∉ Finset.Ico 2 b:= by
      --  intro h₇
      --  exact h₆ h₇
      norm_num
    have h₁₀ : b ∉ Finset.Ico 2 b:= by
      --  intro h₇
      --  exact h₆ h₇
      norm_num
    have h₁₁ : b ≥ 2 := h₀
    have h₁₂ : b < b → False:= by
      --  intro h₁₃
      --  linarith
      norm_num
    --  --  --  --  --  simp [Finset.mem_Ico] at h₉ h₁₀ <;> (try omega) <;> (try linarith) <;> (try omega) <;> (try linarith)
    hole
  have h₄ : b ≤ 211:= by
    --  by_contra h
    have h₅ : b ≥ 212:= by -- omega
      hole
    have h₆ : 211 ∈ Finset.Ico 2 b:= by
      --  rw [Finset.mem_Ico]
      --  constructor
      --  · omega
      --  · omega
      simpa
    have h₇ : (beautifulSet 211).card < 10 := h₂ 211 h₆
    have h₈ : (beautifulSet 211).card ≥ 10:=
      by
      have h₉ : (beautifulSet 211).card ≥ 10:= by
        --  norm_num [beautifulSet, Finset.filter_eq', Finset.Ico_eq_empty_iff, Finset.card_eq_zero, Finset.card_filter,
        --      Nat.div_eq_of_lt, Nat.div_eq_of_lt] at h₁ h₂ h₇ ⊢ <;>
          trivial
        hole
      --  exact h₉
      linarith
    --  omega <;> trivial <;> omega
    linarith
  have h₅ : b = 211:= by
    have h₅₁ : b ≥ 211 := h₃
    have h₅₂ : b ≤ 211 := h₄
    have h₅₃ : b = 211:= by -- omega
      linarith
    --  exact h₅₃
    linarith
  --  exact h₅
  linarith