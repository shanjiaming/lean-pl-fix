theorem h₈ (h₁ : 3 ^ 1010 - 1 > 0) (h₅ : 9 ^ 1010 - 1 > 0) (h₆ h₇ : √(9 ^ 1010 - 1) > 0) : {-(3 ^ 1010 - 1) / 2, -(3 ^ 1010 - 1) / 2 + (↑√(9 ^ 1010 - 1) : ℂ) * Complex.I / 4,
      -(3 ^ 1010 - 1) / 2 - (↑√(9 ^ 1010 - 1) : ℂ) * Complex.I / 4} =
    ∅ :=
  by
  apply Set.eq_empty_of_forall_not_mem
  intro z hz
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hz
  rcases hz with (rfl | rfl | rfl) <;> (try contradiction) <;> (try norm_num) <;> (try ring_nf at *) <;>
              (try simp_all [Complex.ext_iff, pow_two, pow_three, Complex.I_mul_I]) <;>
            (try norm_num) <;>
          (try ring_nf at *) <;>
        (try linarith) <;>
      (try nlinarith) <;>
    (try
        {norm_num at * <;> ring_nf at * <;> simp_all [Complex.ext_iff, pow_two, pow_three, Complex.I_mul_I] <;>
            norm_num at * <;>
          linarith
      })
  hole