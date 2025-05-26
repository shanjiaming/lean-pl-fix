theorem h_main  : ∃ G x x_1, Fintype.card G = 6 ∧ ¬∀ (a b : G), a * b = b * a :=
  by
  --  use Equiv.Perm (Fin 3), by infer_instance, by infer_instance
  --  constructor
  --  --  · simp [Fintype.card_perm, Fintype.card_fin] <;> decide
  --  · intro h
    have h₁ := h (Equiv.swap (1 : Fin 3) 2) (Equiv.swap (0 : Fin 3) 1)
  --    norm_num [Equiv.swap_apply_def, Equiv.mul_apply, Fin.val_zero, Fin.val_one, Fin.val_two] at h₁ <;>
  --        simp_all (config := { decide := true }) <;>
  --      contradiction
  hole