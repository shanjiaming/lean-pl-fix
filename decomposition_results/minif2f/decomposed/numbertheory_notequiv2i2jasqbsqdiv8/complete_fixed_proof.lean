theorem numbertheory_notequiv2i2jasqbsqdiv8 : ¬∀ a b : ℤ, (∃ i j, a = 2 * i ∧ b = 2 * j) ↔ ∃ k, a ^ 2 + b ^ 2 = 8 * k:=
  by
  have h_main : (∀ a b : ℤ, (∃ i j, a = 2 * i ∧ b = 2 * j) ↔ ∃ k, a ^ 2 + b ^ 2 = 8 * k) → False:=
    by
    --  intro h
    have h₁ : (∃ i j, (4 : ℤ) = 2 * i ∧ (2 : ℤ) = 2 * j) ↔ ∃ k, (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k:= by -- apply h 4 2
      hole
    have h₂ : ∃ (i j : ℤ), (4 : ℤ) = 2 * i ∧ (2 : ℤ) = 2 * j:=
      by
      --  refine' ⟨2, 1, _⟩
      --  --  constructor <;> norm_num
      hole
    have h₃ : ∃ (k : ℤ), (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k:=
      by
      have h₄ : (∃ (k : ℤ), (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k):= by -- simpa [mul_assoc] using h₁.mp h₂
        hole
      --  exact h₄
      omega
    --  rcases h₃ with ⟨k, hk⟩
    have h₄ : (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k:= by -- exact hk
      linarith
    have h₅ : k = 5 / 2:= by -- -- ring_nf at h₄ ⊢ <;> omega
      omega
    have h₆ : (k : ℤ) ≠ 5 / 2:= by
      --  --  norm_num at h₅ ⊢ <;> (try omega) <;>
        (try {norm_cast at h₅ ⊢ <;> omega
          })
      hole
    --  exact h₆ (by linarith)
    hole
  have h_final : ¬∀ a b : ℤ, (∃ i j, a = 2 * i ∧ b = 2 * j) ↔ ∃ k, a ^ 2 + b ^ 2 = 8 * k:=
    by
    --  intro h
    have h₁ : False := h_main h
    --  exact h₁
    hole
  --  exact h_final
  norm_cast