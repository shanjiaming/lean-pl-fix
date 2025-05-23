theorem putnam_1986_a4
  (f : ℕ → ℕ)
  (hf : f = fun n ↦ Set.ncard {A : Matrix (Fin n) (Fin n) ℤ | ... }) :
  let (a1, b1, a2, b2, a3, b3, a4) := ((1, 4, 2, 3, -4, 2, 1) : ℚ × ℚ × ℚ × ℚ × ℚ × ℚ × ℚ );
  (∀ n > 0, f n = a1 * b1 ^ n + a2 * b2 ^ n + a3 * b3 ^ n + a4) := by ...