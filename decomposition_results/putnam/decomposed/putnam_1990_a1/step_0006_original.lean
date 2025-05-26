theorem h₁ (T : ℕ → ℤ) (hT012 : T 0 = 2 ∧ T 1 = 3 ∧ T 2 = 6) (hTn : ∀ (n : ℕ), T (n + 3) = ((↑n : ℤ) + 7) * T (n + 2) - 4 * ((↑n : ℤ) + 3) * T (n + 1) + (4 * (↑n : ℤ) + 4) * T n) (h_main : ∀ (n : ℕ), T n = (↑n ! : ℤ) + 2 ^ n) : T = fun n => (↑n ! : ℤ) + 2 ^ n :=
  by
  funext n
  rw [h_main]