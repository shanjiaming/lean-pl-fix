theorem putnam_1978_b4 :
  ∀ N : ℝ,
    ∃ a b c d : ℤ,
      a > N ∧ b > N ∧ c > N ∧ d > N ∧ a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * b * c + a * b * d + a * c * d + b * c * d:=
  by
  --  --  --  --  --  intro N <;> use ⌈N⌉₊ + 1, ⌈N⌉₊ + 1, ⌈N⌉₊ + 1, (⌈N⌉₊ + 1 : ℤ) * 3 <;> norm_num <;> (try norm_num) <;> (try ring_nf) <;>
  --          (try norm_num [Int.lt_floor_add_one, Int.ceil_lt_add_one] <;> linarith [Nat.le_ceil N]) <;>
  --        (try norm_num [Int.lt_floor_add_one, Int.ceil_lt_add_one] <;> linarith [Nat.le_ceil N]) <;>
  --      (try norm_num [Int.lt_floor_add_one, Int.ceil_lt_add_one] <;> linarith [Nat.le_ceil N]) <;>
  --    (try norm_num [Int.lt_floor_add_one, Int.ceil_lt_add_one] <;> linarith [Nat.le_ceil N])
  hole