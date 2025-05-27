theorem putnam_1989_b2 :
    (∀ (S : Type) [Nonempty S] [Semigroup S] [IsCancelMul S]
      (h_fin : ∀ a : S, {(a * ·)^[n] a | n : ℕ}.Finite),
      ∃ e : S, ∀ x, e * x = x ∧ x * e = x ∧ ∃ y, x * y = e ∧ y * x = e) ↔
    ((True) : Prop ) :=
  by