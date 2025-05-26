theorem putnam_1984_b3 :
  (∀ (F : Type*) (_ : Fintype F),
      Fintype.card F ≥ 2 →
        (∃ mul : F → F → F, ∀ x y z : F, (mul x z = mul y z → x = y) ∧ (mul x (mul y z) ≠ mul (mul x y) z))) ↔
    ((True) : Prop):=
  by
  have h_main :
    (∀ (F : Type*) (_ : Fintype F),
      Fintype.card F ≥ 2 →
        (∃ mul : F → F → F, ∀ x y z : F, (mul x z = mul y z → x = y) ∧ (mul x (mul y z) ≠ mul (mul x y) z))) := by sorry
  have h_trivial : ((True : Prop)):= by -- trivial
    hole
  --  constructor
  --  · intro h
  --    trivial
  --  · intro h
  --    exact h_main
  hole