theorem h₁ (d : ℝ) (a : ℕ → ℕ → ℝ) (ha0 : ∀ (m : ℕ), a m 0 = d / 2 ^ m) (ha : ∀ (m j : ℕ), a m (j + 1) = a m j ^ 2 + 2 * a m j) (h_main : ∀ (m j : ℕ), a m j = (d / 2 ^ m + 1) ^ 2 ^ j - 1) : (fun n => a n n) = fun n => (d / 2 ^ n + 1) ^ 2 ^ n - 1 :=
  by
  --  funext n
  --  rw [h_main] <;> simp [h_main]
  hole