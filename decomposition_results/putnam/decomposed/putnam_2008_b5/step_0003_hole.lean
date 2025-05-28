theorem h1 (fqsat : (ℝ → ℝ) → ℚ → Prop) (hfqsat : ∀ (f : ℝ → ℝ) (q : ℚ), fqsat f q ↔ ContDiff ℝ 1 f ∧ ∃ p, ↑p = f ↑q ∧ p.den = q.den) (f : ℝ → ℝ) : (∀ (q : ℚ), fqsat f q) → f ∈ {x | ∃ n, (fun x => x + ↑n) = x} ∪ {x | ∃ n, (fun x => -x + ↑n) = x} :=
  by
  --  intro h
  have h2 := h (0 : ℚ)
  have h3 := h (1 : ℚ)
  have h4 := h (-1 : ℚ)
  have h5 := h (1 / 2 : ℚ)
  have h6 := h (-1 / 2 : ℚ)
  --  --  norm_num [hfqsat, ContDiff] at h2 h3 h4 h5 h6 <;> simp_all [Set.mem_union, Set.mem_setOf_eq] <;>
      (try
          {exfalso <;> norm_num at * <;>
              (try {
                  obtain ⟨p, hp1, hp2⟩ := h2.2
                  obtain ⟨p', hp1', hp2'⟩ := h3.2
                  obtain ⟨p'', hp1'', hp2''⟩ := h4.2
                  obtain ⟨p''', hp1''', hp2'''⟩ := h5.2
                  obtain ⟨p'''', hp1'''', hp2''''⟩ := h6.2
                  norm_cast at * <;> simp_all [Rat.den_eq_one_iff] <;> ring_nf at * <;> norm_cast at * <;>
                            field_simp at * <;>
                          norm_cast at * <;>
                        ring_nf at * <;>
                      norm_cast at * <;>
                    omega
                }) <;>
            (try {
                obtain ⟨p, hp1, hp2⟩ := h2.2
                obtain ⟨p', hp1', hp2'⟩ := h3.2
                obtain ⟨p'', hp1'', hp2''⟩ := h4.2
                obtain ⟨p''', hp1''', hp2'''⟩ := h5.2
                obtain ⟨p'''', hp1'''', hp2''''⟩ := h6.2
                norm_cast at * <;> simp_all [Rat.den_eq_one_iff] <;> ring_nf at * <;> norm_cast at * <;>
                          field_simp at * <;>
                        norm_cast at * <;>
                      ring_nf at * <;>
                    norm_cast at * <;>
                  omega
              })
        }) <;>
    (try {aesop
      })
  hole