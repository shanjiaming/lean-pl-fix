theorem exists_non_commutative_group_of_order_6 :
  ∃ (G : Type) (_ : Group G) (_ : Fintype G),
    Fintype.card G = 6 ∧ ¬(∀ a b : G, a * b = b * a) := by
  have h_main : ∃ (G : Type) (_ : Group G) (_ : Fintype G), Fintype.card G = 6 ∧ ¬(∀ a b : G, a * b = b * a) := by
    use Equiv.Perm (Fin 3), by infer_instance, by infer_instance
    constructor
    · -- Prove that the cardinality of the group is 6
      simp [Fintype.card_perm, Fintype.card_fin]
      <;> decide
    · -- Prove that the group is not commutative
      intro h
      -- Use specific permutations to show non-commutativity
      have h₁ := h (Equiv.swap (1 : Fin 3) 2) (Equiv.swap (0 : Fin 3) 1)
      -- Normalize the expressions to show they are not equal
      norm_num [Equiv.swap_apply_def, Equiv.mul_apply, Fin.val_zero, Fin.val_one, Fin.val_two] at h₁
      <;> simp_all (config := {decide := true})
      <;> contradiction
  exact h_main