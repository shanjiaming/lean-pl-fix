theorem exists_non_commutative_group_of_order_6 :
  ∃ (G : Type) (_ : Group G) (_ : Fintype G),
    Fintype.card G = 6 ∧ ¬(∀ a b : G, a * b = b * a) :=