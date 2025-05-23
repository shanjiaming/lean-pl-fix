theorem sequence_rewrite (n : ℕ) : a_n n = (1 + (2/3)^n) / (3 * (1 - (2/3)^(n+1))) := by
  have h₁ : (3 : ℝ)^n + (2 : ℝ)^n = (3 : ℝ)^n * (1 + (2 / 3 : ℝ)^n) := by
    have h₁₁ : (3 : ℝ)^n > 0 := by positivity
    have h₁₂ : (2 : ℝ) / 3 > 0 := by norm_num
    have h₁₃ : (1 : ℝ) + (2 / 3 : ℝ)^n > 0 := by positivity
    have h₁₄ : (3 : ℝ)^n * (1 + (2 / 3 : ℝ)^n) = (3 : ℝ)^n + (2 : ℝ)^n := by
      calc
        (3 : ℝ)^n * (1 + (2 / 3 : ℝ)^n) = (3 : ℝ)^n * 1 + (3 : ℝ)^n * ((2 / 3 : ℝ)^n) := by ring
        _ = (3 : ℝ)^n + (3 : ℝ)^n * ((2 / 3 : ℝ)^n) := by ring
        _ = (3 : ℝ)^n + (2 : ℝ)^n := by
          have h₁₅ : (3 : ℝ)^n * ((2 / 3 : ℝ)^n) = (2 : ℝ)^n := by
            calc
              (3 : ℝ)^n * ((2 / 3 : ℝ)^n) = ((3 : ℝ) * (2 / 3 : ℝ))^n := by
                rw [mul_pow]
                <;> field_simp
                <;> ring_nf
              _ = (2 : ℝ)^n := by
                norm_num
                <;> ring_nf
                <;> field_simp
                <;> ring_nf
          rw [h₁₅]
        _ = (3 : ℝ)^n + (2 : ℝ)^n := by ring
    linarith
  
  have h₂ : (3 : ℝ)^(n+1) - (2 : ℝ)^(n+1) = (3 : ℝ)^(n+1) * (1 - (2 / 3 : ℝ)^(n+1)) := by
    have h₂₁ : (3 : ℝ)^(n+1) > 0 := by positivity
    have h₂₂ : (2 : ℝ) / 3 > 0 := by norm_num
    have h₂₃ : (1 : ℝ) - (2 / 3 : ℝ)^(n+1) > 0 := by
      have h₂₄ : (2 / 3 : ℝ)^(n+1) < 1 := by
        apply pow_lt_one (by norm_num) (by norm_num) (by
          -- Prove that n + 1 > 0 for all natural numbers n
          have h₂₅ : n + 1 > 0 := by
            linarith [Nat.zero_le n]
          linarith)
      linarith
    have h₂₄ : (3 : ℝ)^(n+1) * (1 - (2 / 3 : ℝ)^(n+1)) = (3 : ℝ)^(n+1) - (2 : ℝ)^(n+1) := by
      calc
        (3 : ℝ)^(n+1) * (1 - (2 / 3 : ℝ)^(n+1)) = (3 : ℝ)^(n+1) * 1 - (3 : ℝ)^(n+1) * ((2 / 3 : ℝ)^(n+1)) := by ring
        _ = (3 : ℝ)^(n+1) - (3 : ℝ)^(n+1) * ((2 / 3 : ℝ)^(n+1)) := by ring
        _ = (3 : ℝ)^(n+1) - (2 : ℝ)^(n+1) := by
          have h₂₅ : (3 : ℝ)^(n+1) * ((2 / 3 : ℝ)^(n+1)) = (2 : ℝ)^(n+1) := by
            calc
              (3 : ℝ)^(n+1) * ((2 / 3 : ℝ)^(n+1)) = ((3 : ℝ) * (2 / 3 : ℝ))^(n+1) := by
                rw [mul_pow]
                <;> field_simp
                <;> ring_nf
              _ = (2 : ℝ)^(n+1) := by
                norm_num
                <;> ring_nf
                <;> field_simp
                <;> ring_nf
          rw [h₂₅]
        _ = (3 : ℝ)^(n+1) - (2 : ℝ)^(n+1) := by ring
    linarith
  
  have h₃ : a_n n = ((3 : ℝ)^n + (2 : ℝ)^n) / ((3 : ℝ)^(n+1) - (2 : ℝ)^(n+1)) := by
    rfl
  
  have h₄ : a_n n = (1 + (2/3 : ℝ)^n) / (3 * (1 - (2/3 : ℝ)^(n+1))) := by
    rw [h₃, h₁, h₂]
    have h₅ : (3 : ℝ)^(n + 1 : ℕ) = (3 : ℝ)^n * 3 := by
      rw [pow_succ]
      <;> ring_nf
    have h₆ : (3 : ℝ)^n > 0 := by positivity
    have h₇ : (3 : ℝ)^(n + 1 : ℕ) > 0 := by positivity
    have h₈ : (1 : ℝ) - (2 / 3 : ℝ)^(n + 1 : ℕ) > 0 := by
      have h₉ : (2 / 3 : ℝ)^(n + 1 : ℕ) < 1 := by
        apply pow_lt_one (by norm_num) (by norm_num) (by
          -- Prove that n + 1 > 0 for all natural numbers n
          have h₁₀ : n + 1 > 0 := by
            linarith [Nat.zero_le n]
          linarith)
      linarith
    have h₉ : (3 : ℝ)^n * (1 + (2 / 3 : ℝ)^n) > 0 := by positivity
    have h₁₀ : (3 : ℝ)^(n + 1 : ℕ) * (1 - (2 / 3 : ℝ)^(n + 1 : ℕ)) > 0 := by positivity
    field_simp [h₅, h₆, h₇, h₈, h₉, h₁₀]
    <;> ring_nf at *
    <;> field_simp [h₅, h₆, h₇, h₈, h₉, h₁₀] at *
    <;> ring_nf at *
    <;> nlinarith
  
  rw [h₄]
  <;> norm_num
  <;> ring_nf
  <;> field_simp
  <;> ring_nf
  <;> norm_num
  <;> linarith