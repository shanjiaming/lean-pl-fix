theorem h_main  : ∀ (F : Type u_2) (x : Fintype F),
    Fintype.card F ≥ 2 → ∃ mul, ∀ (x y z : F), (mul x z = mul y z → x = y) ∧ mul x (mul y z) ≠ mul (mul x y) z :=
  by
  intro F _ hF
  have h₁ : Fintype.card F ≥ 2 := hF
  have h₂ : ∃ (mul : F → F → F), ∀ (x y z : F), (mul x z = mul y z → x = y) ∧ (mul x (mul y z) ≠ mul (mul x y) z) := by sorry
  exact h₂