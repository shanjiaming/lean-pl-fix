theorem h_final (T : ℕ → ℤ) (hT012 : T 0 = 2 ∧ T 1 = 3 ∧ T 2 = 6) (hTn : ∀ (n : ℕ), T (n + 3) = ((↑n : ℤ) + 7) * T (n + 2) - 4 * ((↑n : ℤ) + 3) * T (n + 1) + (4 * (↑n : ℤ) + 4) * T n) (h_main : ∀ (n : ℕ), T n = (↑n ! : ℤ) + 2 ^ n) : T = (fun n => (↑n ! : ℤ), fun n => 2 ^ n).1 + (fun n => (↑n ! : ℤ), fun n => 2 ^ n).2 :=
  by
  have h₁ : T = (fun n : ℕ => (n ! : ℤ) + (2 : ℤ) ^ n) := by sorry
  rw [h₁] <;> simp [Prod.fst, Prod.snd, Pi.add_apply] <;> rfl