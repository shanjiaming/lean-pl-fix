macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem exists_non_commutative_group_of_order_6 :
  ∃ (G : Type) (_ : Group G) (_ : Fintype G),
    Fintype.card G = 6 ∧ ¬(∀ a b : G, a * b = b * a) := by
  have h_main : ∃ (G : Type) (_ : Group G) (_ : Fintype G), Fintype.card G = 6 ∧ ¬(∀ a b : G, a * b = b * a) := by
    use Equiv.Perm (Fin 3), by infer_instance, by infer_instance
    constructor
    · 
      simp [Fintype.card_perm, Fintype.card_fin]
      <;> decide
    · 
      intro h
      
      have h₁ := h (Equiv.swap (1 : Fin 3) 2) (Equiv.swap (0 : Fin 3) 1)
      
      hole_2
  hole_1