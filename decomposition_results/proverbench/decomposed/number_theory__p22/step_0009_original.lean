theorem h₆ (p q : ℤ) (hq : ¬q = 0) (r : ℚ) (hr : cos ((↑p : ℝ) * π / (↑q : ℝ)) = (↑r : ℝ)) (h₄ : (↑r : ℝ) = cos ((↑p : ℝ) * π / (↑q : ℝ))) (h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2) : r ∈ {0, 1, -1, 1 / 2, -1 / 2} := by
  rcases h₅ with (rfl | rfl | rfl | rfl | rfl) <;> norm_num [Set.mem_insert, Set.mem_singleton_iff] <;>
              (try norm_num) <;>
            (try aesop) <;>
          (try ring_nf) <;>
        (try field_simp) <;>
      (try norm_num) <;>
    (try aesop)