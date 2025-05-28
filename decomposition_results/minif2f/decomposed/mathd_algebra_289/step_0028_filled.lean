theorem h₈ (k t m n : ℕ) (h₀ : Nat.Prime m ∧ Nat.Prime n) (h₁ : t < k) (h₂ : ↑k ^ 2 - ↑m * ↑k + ↑n = 0) (h₃ : ↑t ^ 2 - ↑m * ↑t + ↑n = 0) (h₄ : ↑m = ↑k + ↑t) (h₅ : m = k + t) (h₆ : n = t * k) (h₇ : t = 1) : k = n := by
  have h₈₁ : n = t * k := h₆
  have h₈₂ : t = 1 := h₇
  --  rw [h₈₂] at h₈₁
  --  --  ring_nf at h₈₁ ⊢ <;> nlinarith [h₀.1.two_le, h₀.2.two_le, h₁, Nat.Prime.ne_zero h₀.1, Nat.Prime.ne_zero h₀.2]
  nlinarith