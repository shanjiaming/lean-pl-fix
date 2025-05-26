theorem h₁ (d : ℝ) (a : ℕ → ℕ → ℝ) (ha0 : ∀ (m : ℕ), a m 0 = d / 2 ^ m) (ha : ∀ (m j : ℕ), a m (j + 1) = a m j ^ 2 + 2 * a m j) (m j : ℕ) : ∀ (j : ℕ), a m j + 1 = (d / 2 ^ m + 1) ^ 2 ^ j :=
  by
  intro j
  induction j with
  | zero =>
    have h₂ : a m 0 = d / (2 : ℝ) ^ m := by simpa using ha0 m
    norm_num [h₂, pow_zero, pow_one] <;> ring_nf <;> field_simp <;> ring_nf
  | succ j ih =>
    have h₂ := ha m j
    have h₃ : a m (j + 1) = (a m j) ^ 2 + 2 * a m j := by simpa using ha m j
    have h₄ : a m (j + 1) + 1 = (a m j + 1) ^ 2 := by
      calc
        a m (j + 1) + 1 = (a m j) ^ 2 + 2 * a m j + 1 := by rw [h₃]
        _ = (a m j + 1) ^ 2 := by ring
        _ = (a m j + 1) ^ 2 := by ring
    calc
      a m (j + 1) + 1 = (a m j + 1) ^ 2 := by rw [h₄]
      _ = ((d / (2 : ℝ) ^ m + 1) ^ (2 ^ j : ℕ)) ^ 2 := by rw [ih]
      _ = (d / (2 : ℝ) ^ m + 1) ^ (2 ^ (j + 1) : ℕ) := by
        simp [pow_succ, pow_mul, mul_comm] <;> ring_nf <;> field_simp <;> ring_nf <;>
                simp_all [pow_succ, pow_mul, mul_comm] <;>
              ring_nf <;>
            field_simp <;>
          ring_nf