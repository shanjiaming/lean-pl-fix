theorem zeros_of_f_in_Z5 : {x : ZMod 5 | eval x f = 0} = {0, 4} := by
  have h0 : (0 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by
    norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one]
    <;> rfl
  
  have h1 : (1 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one,
      Set.mem_setOf_eq] at h0 ⊢
    <;> decide
  
  have h2 : (2 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one,
      Set.mem_setOf_eq] at h0 h1 ⊢
    <;> decide
  
  have h3 : (3 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one,
      Set.mem_setOf_eq] at h0 h1 h2 ⊢
    <;> decide
  
  have h4 : (4 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by
    norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one,
      Set.mem_setOf_eq] at h0 h1 h2 h3 ⊢
    <;> decide
  
  have h_main : {x : ZMod 5 | eval x f = 0} = {0, 4} := by
    apply Set.Subset.antisymm
    · -- Prove that {x : ZMod 5 | eval x f = 0} ⊆ {0, 4}
      intro x hx
      have h : eval x f = 0 := hx
      have h5 : x = 0 ∨ x = 4 := by
        have h6 : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by
          revert x
          decide
        rcases h6 with (rfl | rfl | rfl | rfl | rfl) <;> norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one] at h h0 h1 h2 h3 h4 ⊢ <;>
          (try contradiction) <;> (try simp_all) <;> (try decide) <;> (try norm_num) <;> (try aesop)
      cases h5 with
      | inl h5 =>
        simp [h5]
      | inr h5 =>
        simp [h5]
    · -- Prove that {0, 4} ⊆ {x : ZMod 5 | eval x f = 0}
      intro x hx
      have h5 : x = 0 ∨ x = 4 := by simpa using hx
      cases h5 with
      | inl h5 =>
        rw [h5]
        exact h0
      | inr h5 =>
        rw [h5]
        exact h4
  
  exact h_main