theorem h₂ (curve : Set (ℝ × ℝ)) (hcurve : curve = {(x, y) | x ^ 3 + 3 * x * y + y ^ 3 = 1}) (equilateral : Set (ℝ × ℝ) → Prop) (hequilateral :  ∀ (S : Set (ℝ × ℝ)),    equilateral S ↔ S.encard = 3 ∧ ∃ d, ∀ P ∈ S, ∀ Q ∈ S, P ≠ Q → √((P.1 - Q.1) ^ 2 + (P.2 - Q.2) ^ 2) = d) : ∃ S ⊆ curve, equilateral S :=
  by
  --  use {(-1, -1), ((1 + Real.sqrt 3) / 2, (1 - Real.sqrt 3) / 2), ((1 - Real.sqrt 3) / 2, (1 + Real.sqrt 3) / 2)}
  --  constructor
  --  · rw [hcurve]
  --    intro p hp
  --    simp only [Set.mem_setOf_eq, Set.mem_insert_iff, Set.mem_singleton_iff] at hp ⊢
  --    rcases hp with (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩)
  --    · norm_num
    ·
      have h₃ : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
      have h₄ : (Real.sqrt 3) ^ 2 = 3 := Real.sq_sqrt (by positivity)
  --      nlinarith [Real.sq_sqrt (show 0 ≤ 3 by norm_num), Real.sqrt_nonneg 3]
    ·
      have h₃ : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
      have h₄ : (Real.sqrt 3) ^ 2 = 3 := Real.sq_sqrt (by positivity)
  --      nlinarith [Real.sq_sqrt (show 0 ≤ 3 by norm_num), Real.sqrt_nonneg 3]
  --  · rw [hequilateral]
  --    constructor
    ·
  --  --      norm_num [Set.encard_eq_three, Set.mem_insert, Set.mem_singleton_iff, Prod.ext_iff] <;> (try norm_num) <;>
  --          (try
  --              {use (Real.sqrt 6) <;> norm_num <;>
  --                (try
  --                    {rintro ⟨x₁, y₁⟩ h₁ ⟨x₂, y₂⟩ h₂ h₃ <;>
  --                          simp_all [Set.mem_insert, Set.mem_singleton_iff, Prod.ext_iff] <;>
  --                        (try
  --                            {norm_num at * <;>
  --                              (try
  --                                  {ring_nf at * <;> norm_num at * <;>
  --                                    (try
  --                                        {field_simp [Real.sqrt_eq_iff_sq_eq] at * <;>
  --                                          nlinarith [Real.sqrt_nonneg 3, Real.sqrt_nonneg 6,
  --                                            Real.sq_sqrt (show 0 ≤ 3 by norm_num),
  --                                            Real.sq_sqrt (show 0 ≤ 6 by norm_num)]
  --                                      })
  --                                })
  --                          }) <;>
  --                      (try {aesop
  --                        })
  --                  })
  --            }) <;>
  --        (try {aesop
  --          })
    · use Real.sqrt 6
      intro P hP Q hQ hPQ
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hP hQ
      rcases hP with (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
                rcases hQ with (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩) <;>
              (try contradiction) <;>
            (try
                {norm_num [Real.sqrt_eq_iff_sq_eq, Prod.ext_iff, Real.sqrt_eq_iff_sq_eq, add_assoc] at * <;>
                      ring_nf at * <;>
                    norm_num at * <;>
                  (try
                      {nlinarith [Real.sqrt_nonneg 3, Real.sqrt_nonneg 6, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                        Real.sq_sqrt (show 0 ≤ 6 by norm_num)]
                    })
              }) <;>
          (try
              {field_simp [Real.sqrt_eq_iff_sq_eq] at * <;> ring_nf at * <;> norm_num at * <;>
                (try
                    {nlinarith [Real.sqrt_nonneg 3, Real.sqrt_nonneg 6, Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                      Real.sq_sqrt (show 0 ≤ 6 by norm_num)]
                  })
            }) <;>
        (try {aesop
          })
  hole