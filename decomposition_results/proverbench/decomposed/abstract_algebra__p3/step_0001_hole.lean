theorem exists_non_commutative_group_of_order_6  : ∃ G x x_1, Fintype.card G = 6 ∧ ¬∀ (a b : G), a * b = b * a :=
  by
  have h_main : ∃ (G : Type) (_ : Group G) (_ : Fintype G), Fintype.card G = 6 ∧ ¬(∀ a b : G, a * b = b * a) := by sorry
  --  exact h_main
  hole