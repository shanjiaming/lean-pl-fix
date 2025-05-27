theorem h₅ (f : ℚ → ℚ) (h : f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) (h₁ : f 1 = 2) (h₂ : ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) (h₃ : f 0 = 1) (h₄ : ∀ (x : ℚ), f (x + 1) = f x + 1) : ∀ (n : ℤ) (x : ℚ), f (x + ↑n) = f x + ↑n := by
  intro n x
  induction n with
  | ofNat n =>
    induction n with
    | zero => norm_num [h₃, h₄] <;> linarith
    | succ n ih =>
      have h₆ := h₄ (x + n)
      have h₇ := h₄ (x + ↑n + 1)
      simp [add_assoc, add_comm, add_left_comm] at * <;> simp_all [Int.ofNat_add, Int.ofNat_one, add_assoc] <;> linarith
  | negSucc n =>
    induction n with
    | zero =>
      have h₆ := h₄ (x - 1)
      have h₇ := h₄ x
      simp [add_assoc, add_comm, add_left_comm] at * <;> simp_all [Int.ofNat_add, Int.ofNat_one, add_assoc] <;> linarith
    | succ n ih =>
      have h₆ := h₄ (x + (-↑n - 1))
      have h₇ := h₄ (x + (-↑n - 1 + 1))
      have h₈ := h₄ (x + (-↑n - 1 - 1))
      simp [add_assoc, add_comm, add_left_comm] at * <;> simp_all [Int.ofNat_add, Int.ofNat_one, add_assoc] <;> linarith