theorem h5 (h0 : 0 ∈ {x | sorry = 0}) (h1 : 1 ∉ {x | sorry = 0}) (h2 : 2 ∉ {x | sorry = 0}) (h3 : 3 ∉ {x | sorry = 0}) (h4 : 4 ∈ {x | sorry = 0}) (x : ZMod 5) (hx : x ∈ {x | sorry = 0}) (h : sorry = 0) : x = 0 ∨ x = 4 :=
  by
  have h6 : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by sorry
  rcases h6 with (rfl | rfl | rfl | rfl | rfl) <;>
              norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1,
                eval_one] at h h0 h1 h2 h3 h4 ⊢ <;>
            (try contradiction) <;>
          (try simp_all) <;>
        (try decide) <;>
      (try norm_num) <;>
    (try aesop)