theorem putnam_1984_a5
    (R : Set (Fin 3 → ℝ))
    (w : (Fin 3 → ℝ) → ℝ)
    (hR : R = {p | (∀ i : Fin 3, p i ≥ 0) ∧ p 0 + p 1 + p 2 ≤ 1})
    (hw : ∀ p, w p = 1 - p 0 - p 1 - p 2) :
      let (a, b, c, d, n) := ((1, 9, 8, 4, 25) : ℕ × ℕ × ℕ × ℕ × ℕ );
      a > 0 ∧ b > 0 ∧ c > 0 ∧ d > 0 ∧ n > 0 ∧
      (∫ p in R, (p 0) ^ 1 * (p 1) ^ 9 * (p 2) ^ 8 * (w p) ^ 4 = ((a)! * (b)! * (c)! * (d)! : ℝ) / (n)!) := by
  admit