theorem h₂ (q r : ℤ) (A B : Fin 2 → ℝ) (T : Set ℝ) (S : Set ℤ) (qpos : q > 0) (ABlt : A 0 < A 1 ∧ B 0 < B 1) (hT : T = {x | ∃ b m, ↑b ∈ Set.Icc (B 0) (B 1) ∧ x = ↑b + ↑m * ↑q}) (hS : S = {a | ↑a ∈ Set.Icc (A 0) (A 1) ∧ ∃ t ∈ T, ↑r * ↑a = t}) (h : (A 1 - A 0) * (B 1 - B 0) < ↑q) : {s | s = ↑(round s) ∧ round s ∈ S} = Set.Icc (A 0) (A 1) ∩ {x | ∃ i, x = A 0 + 1 + ↑↑i * 0} :=
  by
  ext s
  simp [hS, hT, Set.mem_setOf_eq, Set.mem_Icc, Fin.forall_fin_succ, Fin.ext_iff, Fin.val_zero, Fin.val_succ] <;>
                (try norm_num) <;>
              (try ring_nf) <;>
            (try field_simp at *) <;>
          (try norm_cast at *) <;>
        (try linarith) <;>
      (try
          {by_cases h₃ : s = round s <;> by_cases h₄ : (round s : ℝ) ∈ Set.Icc (A 0) (A 1) <;>
                          by_cases h₅ : ∃ t ∈ T, r * (round s : ℤ) = t <;>
                        simp_all [hT, hS, Set.mem_setOf_eq, Set.mem_Icc, Fin.forall_fin_succ, Fin.ext_iff, Fin.val_zero,
                          Fin.val_succ] <;>
                      (try norm_num) <;>
                    (try ring_nf) <;>
                  (try field_simp at *) <;>
                (try norm_cast at *) <;>
              (try linarith) <;>
            (try {aesop
              })
        }) <;>
    (try {aesop
      })