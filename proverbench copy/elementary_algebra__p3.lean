theorem imo_inequality :
  a^2 * ((s a b c) - a) + b^2 * ((s a b c) - b) + c^2 * ((s a b c) - c) ≤ (3/2) * a * b * c := by
  have h1 : a^2 * ((s a b c) - a) + b^2 * ((s a b c) - b) + c^2 * ((s a b c) - c) = (a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c)) / 2 := by
    have h₁ : s a b c = (a + b + c) / 2 := rfl
    rw [h₁]
    ring_nf
    <;> field_simp [mul_comm, mul_assoc, mul_left_comm]
    <;> ring_nf
    <;> linarith [ha, hb, hc]
  
  have h2 : a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c) ≤ 3 * a * b * c := by
    have h₂ : a > 0 := ha
    have h₃ : b > 0 := hb
    have h₄ : c > 0 := hc
    have h₅ : a^3 + b^3 + c^3 + 3 * a * b * c ≥ a^2 * b + a * b^2 + a^2 * c + a * c^2 + b^2 * c + b * c^2 := by
      nlinarith [sq_nonneg (a + b - c), sq_nonneg (b + c - a), sq_nonneg (c + a - b), mul_nonneg ha.le hb.le, mul_nonneg ha.le hc.le, mul_nonneg hb.le hc.le,
        sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), mul_nonneg (sq_nonneg (a - b)) ha.le,
        mul_nonneg (sq_nonneg (b - c)) hb.le, mul_nonneg (sq_nonneg (c - a)) hc.le,
        mul_nonneg (sq_nonneg (a - b)) hb.le, mul_nonneg (sq_nonneg (b - c)) hc.le,
        mul_nonneg (sq_nonneg (c - a)) ha.le]
    have h₆ : a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c) ≤ 3 * a * b * c := by
      have h₇ : a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c) = a^2 * b + a^2 * c - a^3 + b^2 * a + b^2 * c - b^3 + c^2 * a + c^2 * b - c^3 := by
        ring
      rw [h₇]
      have h₈ : a^2 * b + a^2 * c - a^3 + b^2 * a + b^2 * c - b^3 + c^2 * a + c^2 * b - c^3 ≤ 3 * a * b * c := by
        nlinarith [h₅]
      linarith
    exact h₆
  
  have h3 : a^2 * ((s a b c) - a) + b^2 * ((s a b c) - b) + c^2 * ((s a b c) - c) ≤ (3/2) * a * b * c := by
    have h₃ : a^2 * ((s a b c) - a) + b^2 * ((s a b c) - b) + c^2 * ((s a b c) - c) = (a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c)) / 2 := h1
    rw [h₃]
    have h₄ : (a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c)) / 2 ≤ (3 / 2 : ℝ) * a * b * c := by
      -- Use the given bound to conclude the proof
      have h₅ : a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c) ≤ 3 * a * b * c := h2
      have h₆ : (a^2 * (b + c - a) + b^2 * (a + c - b) + c^2 * (a + b - c)) / 2 ≤ (3 * a * b * c) / 2 := by
        linarith
      have h₇ : (3 * a * b * c : ℝ) / 2 = (3 / 2 : ℝ) * a * b * c := by
        ring
      rw [h₇] at h₆
      linarith
    linarith
  exact h3