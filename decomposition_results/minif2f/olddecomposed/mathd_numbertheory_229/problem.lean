theorem mathd_numbertheory_229 : 5 ^ 30 % 7 = 1 := by
  have h : 5 ^ 30 % 7 = 1 := by
    norm_num [pow_succ, Nat.mul_mod, Nat.pow_mod, Nat.mod_mod, Nat.mod_eq_of_lt,
      show 7 > 0 by decide]
    -- Use `norm_num` to compute the result directly.
    -- `norm_num` will simplify the expression using the properties of powers and modular arithmetic.
    -- The `show` statement is used to prove that 7 > 0, which is trivially true.
    <;> rfl
    -- This ensures that the proof is complete and correct.
    <;> simp_all
    <;> norm_num
    <;> rfl
  
  exact h