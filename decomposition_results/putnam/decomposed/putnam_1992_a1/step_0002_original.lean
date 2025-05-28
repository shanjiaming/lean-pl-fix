theorem h_imp (f : ℤ → ℤ) : (f = fun n => 1 - n) → (∀ (n : ℤ), f (f n) = n) ∧ (∀ (n : ℤ), f (f (n + 2) + 2) = n) ∧ f 0 = 1 :=
  by
  intro h
  rw [h]
  constructor
  · intro n
    simp [sub_eq_add_neg] <;> ring_nf <;> simp [sub_eq_add_neg] <;> ring_nf
  · constructor
    · intro n
      simp [sub_eq_add_neg] <;> ring_nf <;> simp [sub_eq_add_neg] <;> ring_nf
    · simp [sub_eq_add_neg] <;> ring_nf