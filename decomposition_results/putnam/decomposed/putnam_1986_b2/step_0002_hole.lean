theorem h_subset₁  : {T |
      ∃ x y z,
        T = (x - y, y - z, z - x) ∧
          x * (x - 1) + 2 * y * z = y * (y - 1) + 2 * z * x ∧ y * (y - 1) + 2 * z * x = z * (z - 1) + 2 * x * y} ⊆
    ↑{(0, 0, 0), (0, -1, 1), (1, 0, -1), (-1, 1, 0)} :=
  by
  --  intro T hT
  --  rcases hT with ⟨x, y, z, hT, h1, h2⟩
  have h3 : T = (x - y, y - z, z - x) := hT
  --  rw [h3]
  have h4 : x * (x - 1) + 2 * y * z = y * (y - 1) + 2 * z * x := h1
  have h5 : y * (y - 1) + 2 * z * x = z * (z - 1) + 2 * x * y := h2
  have h6 :
    (x - y = 0 ∨ x - y = 1 ∨ x - y = -1) ∧ (y - z = 0 ∨ y - z = 1 ∨ y - z = -1) ∧ (z - x = 0 ∨ z - x = 1 ∨ z - x = -1) := by sorry
  --  rcases h6 with ⟨h6₁, h6₂, h6₃⟩
  have h7 : (x - y = 0 ∨ x - y = 1 ∨ x - y = -1) := h6₁
  have h8 : (y - z = 0 ∨ y - z = 1 ∨ y - z = -1) := h6₂
  have h9 : (z - x = 0 ∨ z - x = 1 ∨ z - x = -1) := h6₃
  --  --  --  rcases h7 with (h7 | h7 | h7) <;> rcases h8 with (h8 | h8 | h8) <;> rcases h9 with (h9 | h9 | h9) <;>
  --                  simp [h7, h8, h9, Prod.ext_iff, Finset.mem_insert, Finset.mem_singleton] at h4 h5 ⊢ <;>
  --                (try norm_num) <;>
  --              (try
  --                  {simp_all [Complex.ext_iff, pow_two, Complex.ext_iff, pow_two, Complex.ext_iff, pow_two,
  --                        Complex.ext_iff, pow_two] <;>
  --                      norm_num <;>
  --                    (try
  --                        ring_nf at * <;> norm_num at * <;>
  --                          (try {nlinarith
  --                            }))
  --                }) <;>
            (try {aesop
              }) <;>
          (try {norm_num <;> aesop
            }) <;>
        (try
            {simp_all [Complex.ext_iff, pow_two, Complex.ext_iff, pow_two, Complex.ext_iff, pow_two, Complex.ext_iff,
                  pow_two] <;>
                norm_num <;>
              (try
                  ring_nf at * <;> norm_num at * <;>
                    (try {nlinarith
                      }))
          }) <;>
      (try {aesop
        }) <;>
    (try {norm_num <;> aesop
      })
  hole