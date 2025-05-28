theorem h_absurd (quotientof : ℚ → ℤ × ℕ) (hquotientof : ∀ (q : ℚ), quotientof q = (q.num, q.den)) : False := by
  have h₁ := hquotientof (0 : ℚ)
  have h₂ := hquotientof (1 : ℚ)
  norm_num [Rat.num_zero, Rat.den_zero, Rat.num_one, Rat.den_one] at h₁ h₂ <;> (try contradiction) <;>
                (try simp_all [Prod.ext_iff]) <;>
              (try norm_num at *) <;>
            (try aesop) <;>
          (try linarith) <;>
        (try ring_nf at *) <;>
      (try nlinarith) <;>
    (try omega)