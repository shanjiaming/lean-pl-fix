theorem h₄ (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = lcm (b n) (a (n + 1))) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) (n : ℕ) (h₂ : StrictMono a) (h₃ : ∀ (k : ℕ), a k > 0) : ∀ (k : ℕ), a k ≥ k + 1 := by
  intro k
  induction k with
  | zero =>
    have h₅ : a 0 > 0 := ha.2 0
    have h₆ : a 0 ≥ 1 := by linarith
    linarith
  | succ k ih =>
    have h₅ : a (k + 1) > a k := h₂.lt_iff_lt.mpr (by linarith)
    have h₆ : a k ≥ k + 1 := ih
    have h₇ : a (k + 1) ≥ k + 2 :=
      by
      have h₈ : a (k + 1) > a k := h₂.lt_iff_lt.mpr (by linarith)
      have h₉ : a (k + 1) ≥ a k + 1 := by omega
      omega
    omega