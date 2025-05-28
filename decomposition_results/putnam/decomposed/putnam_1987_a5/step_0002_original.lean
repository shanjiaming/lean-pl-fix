theorem h_main (vec2 : ℝ → ℝ → Fin 2 → ℝ) (vec3 : ℝ → ℝ → ℝ → Fin 3 → ℝ) (G : (Fin 2 → ℝ) → Fin 3 → ℝ) (hG : G = fun v => vec3 (-v 1 / (v 0 ^ 2 + 4 * v 1 ^ 2)) (v 0 / (v 0 ^ 2 + 4 * v 1 ^ 2)) 0) (vrepl : (Fin 3 → ℝ) → Fin 3 → ℝ → Fin 3 → ℝ) (hvrepl : vrepl = fun v i vi j => if j = i then vi else v j) (contdiffv : ((Fin 3 → ℝ) → ℝ) → Fin 3 → (Fin 3 → ℝ) → Prop) (hcontdiffv : contdiffv = fun Fi j v => ContDiffAt ℝ 1 (fun vj => Fi (vrepl v j vj)) (v j)) (partderiv : ((Fin 3 → ℝ) → ℝ) → Fin 3 → (Fin 3 → ℝ) → ℝ) (hpartderiv : partderiv = fun Fi j v => deriv (fun vj => Fi (vrepl v j vj)) (v j)) (Fprop1 Fprop2 Fprop3 : (Fin 3 → (Fin 3 → ℝ) → ℝ) → Prop) (hFprop1 : Fprop1 = fun F => ∀ (i j : Fin 3) (v : Fin 3 → ℝ), v ≠ 0 → contdiffv (F i) j v) (hFprop2 :  Fprop2 = fun F =>    ∀ (v : Fin 3 → ℝ),      v ≠ 0 →        vec3 ((partderiv (F 2) 1 - partderiv (F 1) 2) v) ((partderiv (F 0) 2 - partderiv (F 2) 0) v)            ((partderiv (F 1) 0 - partderiv (F 0) 1) v) =          0) (hFprop3 : Fprop3 = fun F => ∀ (x y : ℝ), (fun i => F i (vec3 x y 0)) = G (vec2 x y)) (hvec2 : ∀ (x y : ℝ), vec2 x y 0 = x ∧ vec2 x y 1 = y) (hvec3 : ∀ (x y z : ℝ), vec3 x y z 0 = x ∧ vec3 x y z 1 = y ∧ vec3 x y z 2 = z) : ¬∃ F, Fprop1 F ∧ Fprop2 F ∧ Fprop3 F :=
  by
  intro h
  rcases h with ⟨F, hF1, hF2, hF3⟩
  have h₁ : Fprop1 F := hF1
  have h₂ : Fprop2 F := hF2
  have h₃ : Fprop3 F := hF3
  rw [hFprop1] at h₁
  rw [hFprop2] at h₂
  rw [hFprop3] at h₃
  have h₄ := h₃ 1 0
  have h₅ := h₃ 0 1
  have h₆ := h₃ 1 1
  have h₇ := h₃ (-1) 0
  have h₈ := h₃ 0 (-1)
  have h₉ := h₃ 1 (-1)
  have h₁₀ := h₃ (-1) 1
  norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ] at h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ <;> (try norm_num) <;>
                                                            (try contradiction) <;>
                                                          (try linarith) <;>
                                                        (try {
                                                            have h₁₁ := h₂ (vec3 1 0 0)
                                                            have h₁₂ := h₂ (vec3 0 1 0)
                                                            have h₁₃ := h₂ (vec3 0 0 1)
                                                            have h₁₄ := h₂ (vec3 1 1 0)
                                                            have h₁₅ := h₂ (vec3 1 0 1)
                                                            have h₁₆ := h₂ (vec3 0 1 1)
                                                            have h₁₇ := h₂ (vec3 1 2 0)
                                                            have h₁₈ := h₂ (vec3 2 1 0)
                                                            have h₁₉ := h₂ (vec3 1 0 2)
                                                            have h₂₀ := h₂ (vec3 2 0 1)
                                                            have h₂₁ := h₂ (vec3 0 2 1)
                                                            have h₂₂ := h₂ (vec3 1 1 1)
                                                            norm_num [hG, hvec2, hvec3, Function.funext_iff,
                                                                    Fin.forall_fin_succ, hpartderiv, hvrepl,
                                                                    hcontdiffv] at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉
                                                                      h₂₀ h₂₁ h₂₂ <;>
                                                                  (try norm_num) <;>
                                                                (try contradiction) <;>
                                                              (try linarith)
                                                          }) <;>
                                                      (try {
                                                          have h₂₃ := h₁ 0 0 (vec3 1 0 0)
                                                          have h₂₄ := h₁ 0 0 (vec3 0 1 0)
                                                          have h₂₅ := h₁ 0 0 (vec3 0 0 1)
                                                          have h₂₆ := h₁ 0 0 (vec3 1 1 0)
                                                          have h₂₇ := h₁ 0 0 (vec3 1 0 1)
                                                          have h₂₈ := h₁ 0 0 (vec3 0 1 1)
                                                          have h₂₉ := h₁ 0 0 (vec3 1 2 0)
                                                          have h₃₀ := h₁ 0 0 (vec3 2 1 0)
                                                          have h₃₁ := h₁ 0 0 (vec3 1 0 2)
                                                          have h₃₂ := h₁ 0 0 (vec3 2 0 1)
                                                          have h₃₃ := h₁ 0 0 (vec3 0 2 1)
                                                          have h₃₄ := h₁ 0 0 (vec3 1 1 1)
                                                          norm_num [hG, hvec2, hvec3, Function.funext_iff,
                                                                  Fin.forall_fin_succ, hpartderiv, hvrepl,
                                                                  hcontdiffv] at h₂₃ h₂₄ h₂₅ h₂₆ h₂₇ h₂₈ h₂₉ h₃₀ h₃₁ h₃₂
                                                                    h₃₃ h₃₄ <;>
                                                                (try norm_num) <;>
                                                              (try contradiction) <;>
                                                            (try linarith)
                                                        }) <;>
                                                    (try {
                                                        have h₃₅ := h₁ 1 0 (vec3 1 0 0)
                                                        have h₃₆ := h₁ 1 0 (vec3 0 1 0)
                                                        have h₃₇ := h₁ 1 0 (vec3 0 0 1)
                                                        have h₃₈ := h₁ 1 0 (vec3 1 1 0)
                                                        have h₃₉ := h₁ 1 0 (vec3 1 0 1)
                                                        have h₄₀ := h₁ 1 0 (vec3 0 1 1)
                                                        have h₄₁ := h₁ 1 0 (vec3 1 2 0)
                                                        have h₄₂ := h₁ 1 0 (vec3 2 1 0)
                                                        have h₄₃ := h₁ 1 0 (vec3 1 0 2)
                                                        have h₄₄ := h₁ 1 0 (vec3 2 0 1)
                                                        have h₄₅ := h₁ 1 0 (vec3 0 2 1)
                                                        have h₄₆ := h₁ 1 0 (vec3 1 1 1)
                                                        norm_num [hG, hvec2, hvec3, Function.funext_iff,
                                                                Fin.forall_fin_succ, hpartderiv, hvrepl,
                                                                hcontdiffv] at h₃₅ h₃₆ h₃₇ h₃₈ h₃₉ h₄₀ h₄₁ h₄₂ h₄₃ h₄₄
                                                                  h₄₅ h₄₆ <;>
                                                              (try norm_num) <;>
                                                            (try contradiction) <;>
                                                          (try linarith)
                                                      }) <;>
                                                  (try {
                                                      have h₄₇ := h₁ 0 1 (vec3 1 0 0)
                                                      have h₄₈ := h₁ 0 1 (vec3 0 1 0)
                                                      have h₄₉ := h₁ 0 1 (vec3 0 0 1)
                                                      have h₅₀ := h₁ 0 1 (vec3 1 1 0)
                                                      have h₅₁ := h₁ 0 1 (vec3 1 0 1)
                                                      have h₅₂ := h₁ 0 1 (vec3 0 1 1)
                                                      have h₅₃ := h₁ 0 1 (vec3 1 2 0)
                                                      have h₅₄ := h₁ 0 1 (vec3 2 1 0)
                                                      have h₅₅ := h₁ 0 1 (vec3 1 0 2)
                                                      have h₅₆ := h₁ 0 1 (vec3 2 0 1)
                                                      have h₅₇ := h₁ 0 1 (vec3 0 2 1)
                                                      have h₅₈ := h₁ 0 1 (vec3 1 1 1)
                                                      norm_num [hG, hvec2, hvec3, Function.funext_iff,
                                                              Fin.forall_fin_succ, hpartderiv, hvrepl,
                                                              hcontdiffv] at h₄₇ h₄₈ h₄₉ h₅₀ h₅₁ h₅₂ h₅₃ h₅₄ h₅₅ h₅₆ h₅₇
                                                                h₅₈ <;>
                                                            (try norm_num) <;>
                                                          (try contradiction) <;>
                                                        (try linarith)
                                                    }) <;>
                                                (try {
                                                    have h₅₉ := h₁ 1 1 (vec3 1 0 0)
                                                    have h₆₀ := h₁ 1 1 (vec3 0 1 0)
                                                    have h₆₁ := h₁ 1 1 (vec3 0 0 1)
                                                    have h₆₂ := h₁ 1 1 (vec3 1 1 0)
                                                    have h₆₃ := h₁ 1 1 (vec3 1 0 1)
                                                    have h₆₄ := h₁ 1 1 (vec3 0 1 1)
                                                    have h₆₅ := h₁ 1 1 (vec3 1 2 0)
                                                    have h₆₆ := h₁ 1 1 (vec3 2 1 0)
                                                    have h₆₇ := h₁ 1 1 (vec3 1 0 2)
                                                    have h₆₈ := h₁ 1 1 (vec3 2 0 1)
                                                    have h₆₉ := h₁ 1 1 (vec3 0 2 1)
                                                    have h₇₀ := h₁ 1 1 (vec3 1 1 1)
                                                    norm_num [hG, hvec2, hvec3, Function.funext_iff,
                                                            Fin.forall_fin_succ, hpartderiv, hvrepl,
                                                            hcontdiffv] at h₅₉ h₆₀ h₆₁ h₆₂ h₆₃ h₆₄ h₆₅ h₆₆ h₆₇ h₆₈ h₆₉
                                                              h₇₀ <;>
                                                          (try norm_num) <;>
                                                        (try contradiction) <;>
                                                      (try linarith)
                                                  }) <;>
                                              simp_all [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ,
                                                hpartderiv, hvrepl, hcontdiffv] <;>
                                            norm_num at * <;>
                                          (try contradiction) <;>
                                        (try linarith) <;>
                                      (try {
                                          have h₇₁ := h₂ (vec3 1 0 0)
                                          have h₇₂ := h₂ (vec3 0 1 0)
                                          have h₇₃ := h₂ (vec3 0 0 1)
                                          have h₇₄ := h₂ (vec3 1 1 0)
                                          have h₇₅ := h₂ (vec3 1 0 1)
                                          have h₇₆ := h₂ (vec3 0 1 1)
                                          have h₇₇ := h₂ (vec3 1 2 0)
                                          have h₇₈ := h₂ (vec3 2 1 0)
                                          have h₇₉ := h₂ (vec3 1 0 2)
                                          have h₈₀ := h₂ (vec3 2 0 1)
                                          have h₈₁ := h₂ (vec3 0 2 1)
                                          have h₈₂ := h₂ (vec3 1 1 1)
                                          norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ,
                                                  hpartderiv, hvrepl,
                                                  hcontdiffv] at h₇₁ h₇₂ h₇₃ h₇₄ h₇₅ h₇₆ h₇₇ h₇₈ h₇₉ h₈₀ h₈₁ h₈₂ <;>
                                                (try norm_num) <;>
                                              (try contradiction) <;>
                                            (try linarith)
                                        }) <;>
                                    (try {
                                        have h₈₃ := h₁ 0 0 (vec3 1 0 0)
                                        have h₈₄ := h₁ 0 0 (vec3 0 1 0)
                                        have h₈₅ := h₁ 0 0 (vec3 0 0 1)
                                        have h₈₆ := h₁ 0 0 (vec3 1 1 0)
                                        have h₈₇ := h₁ 0 0 (vec3 1 0 1)
                                        have h₈₈ := h₁ 0 0 (vec3 0 1 1)
                                        have h₈₉ := h₁ 0 0 (vec3 1 2 0)
                                        have h₉₀ := h₁ 0 0 (vec3 2 1 0)
                                        have h₉₁ := h₁ 0 0 (vec3 1 0 2)
                                        have h₉₂ := h₁ 0 0 (vec3 2 0 1)
                                        have h₉₃ := h₁ 0 0 (vec3 0 2 1)
                                        have h₉₄ := h₁ 0 0 (vec3 1 1 1)
                                        norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ,
                                                hpartderiv, hvrepl,
                                                hcontdiffv] at h₈₃ h₈₄ h₈₅ h₈₆ h₈₇ h₈₈ h₈₉ h₉₀ h₉₁ h₉₂ h₉₃ h₉₄ <;>
                                              (try norm_num) <;>
                                            (try contradiction) <;>
                                          (try linarith)
                                      }) <;>
                                  (try {
                                      have h₉₅ := h₁ 1 0 (vec3 1 0 0)
                                      have h₉₆ := h₁ 1 0 (vec3 0 1 0)
                                      have h₉₇ := h₁ 1 0 (vec3 0 0 1)
                                      have h₉₈ := h₁ 1 0 (vec3 1 1 0)
                                      have h₉₉ := h₁ 1 0 (vec3 1 0 1)
                                      have h₁₀₀ := h₁ 1 0 (vec3 0 1 1)
                                      have h₁₀₁ := h₁ 1 0 (vec3 1 2 0)
                                      have h₁₀₂ := h₁ 1 0 (vec3 2 1 0)
                                      have h₁₀₃ := h₁ 1 0 (vec3 1 0 2)
                                      have h₁₀₄ := h₁ 1 0 (vec3 2 0 1)
                                      have h₁₀₅ := h₁ 1 0 (vec3 0 2 1)
                                      have h₁₀₆ := h₁ 1 0 (vec3 1 1 1)
                                      norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv,
                                              hvrepl,
                                              hcontdiffv] at h₉₅ h₉₆ h₉₇ h₉₈ h₉₉ h₁₀₀ h₁₀₁ h₁₀₂ h₁₀₃ h₁₀₄ h₁₀₅ h₁₀₆ <;>
                                            (try norm_num) <;>
                                          (try contradiction) <;>
                                        (try linarith)
                                    }) <;>
                                (try {
                                    have h₁₀₇ := h₁ 0 1 (vec3 1 0 0)
                                    have h₁₀₈ := h₁ 0 1 (vec3 0 1 0)
                                    have h₁₀₉ := h₁ 0 1 (vec3 0 0 1)
                                    have h₁₁₀ := h₁ 0 1 (vec3 1 1 0)
                                    have h₁₁₁ := h₁ 0 1 (vec3 1 0 1)
                                    have h₁₁₂ := h₁ 0 1 (vec3 0 1 1)
                                    have h₁₁₃ := h₁ 0 1 (vec3 1 2 0)
                                    have h₁₁₄ := h₁ 0 1 (vec3 2 1 0)
                                    have h₁₁₅ := h₁ 0 1 (vec3 1 0 2)
                                    have h₁₁₆ := h₁ 0 1 (vec3 2 0 1)
                                    have h₁₁₇ := h₁ 0 1 (vec3 0 2 1)
                                    have h₁₁₈ := h₁ 0 1 (vec3 1 1 1)
                                    norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv,
                                            hvrepl,
                                            hcontdiffv] at h₁₀₇ h₁₀₈ h₁₀₉ h₁₁₀ h₁₁₁ h₁₁₂ h₁₁₃ h₁₁₄ h₁₁₅ h₁₁₆ h₁₁₇
                                              h₁₁₈ <;>
                                          (try norm_num) <;>
                                        (try contradiction) <;>
                                      (try linarith)
                                  }) <;>
                              (try {
                                  have h₁₁₉ := h₁ 1 1 (vec3 1 0 0)
                                  have h₁₂₀ := h₁ 1 1 (vec3 0 1 0)
                                  have h₁₂₁ := h₁ 1 1 (vec3 0 0 1)
                                  have h₁₂₂ := h₁ 1 1 (vec3 1 1 0)
                                  have h₁₂₃ := h₁ 1 1 (vec3 1 0 1)
                                  have h₁₂₄ := h₁ 1 1 (vec3 0 1 1)
                                  have h₁₂₅ := h₁ 1 1 (vec3 1 2 0)
                                  have h₁₂₆ := h₁ 1 1 (vec3 2 1 0)
                                  have h₁₂₇ := h₁ 1 1 (vec3 1 0 2)
                                  have h₁₂₈ := h₁ 1 1 (vec3 2 0 1)
                                  have h₁₂₉ := h₁ 1 1 (vec3 0 2 1)
                                  have h₁₃₀ := h₁ 1 1 (vec3 1 1 1)
                                  norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv,
                                          hvrepl,
                                          hcontdiffv] at h₁₁₉ h₁₂₀ h₁₂₁ h₁₂₂ h₁₂₃ h₁₂₄ h₁₂₅ h₁₂₆ h₁₂₇ h₁₂₈ h₁₂₉ h₁₃₀ <;>
                                        (try norm_num) <;>
                                      (try contradiction) <;>
                                    (try linarith)
                                }) <;>
                            simp_all [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl,
                              hcontdiffv] <;>
                          norm_num at * <;>
                        (try contradiction) <;>
                      (try linarith) <;>
                    (try {
                        have h₁₃₁ := h₂ (vec3 1 0 0)
                        have h₁₃₂ := h₂ (vec3 0 1 0)
                        have h₁₃₃ := h₂ (vec3 0 0 1)
                        have h₁₃₄ := h₂ (vec3 1 1 0)
                        have h₁₃₅ := h₂ (vec3 1 0 1)
                        have h₁₃₆ := h₂ (vec3 0 1 1)
                        have h₁₃₇ := h₂ (vec3 1 2 0)
                        have h₁₃₈ := h₂ (vec3 2 1 0)
                        have h₁₃₉ := h₂ (vec3 1 0 2)
                        have h₁₄₀ := h₂ (vec3 2 0 1)
                        have h₁₄₁ := h₂ (vec3 0 2 1)
                        have h₁₄₂ := h₂ (vec3 1 1 1)
                        norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl,
                                hcontdiffv] at h₁₃₁ h₁₃₂ h₁₃₃ h₁₃₄ h₁₃₅ h₁₃₆ h₁₃₇ h₁₃₈ h₁₃₉ h₁₄₀ h₁₄₁ h₁₄₂ <;>
                              (try norm_num) <;>
                            (try contradiction) <;>
                          (try linarith)
                      }) <;>
                  (try {
                      have h₁₄₃ := h₁ 0 0 (vec3 1 0 0)
                      have h₁₄₄ := h₁ 0 0 (vec3 0 1 0)
                      have h₁₄₅ := h₁ 0 0 (vec3 0 0 1)
                      have h₁₄₆ := h₁ 0 0 (vec3 1 1 0)
                      have h₁₄₇ := h₁ 0 0 (vec3 1 0 1)
                      have h₁₄₈ := h₁ 0 0 (vec3 0 1 1)
                      have h₁₄₉ := h₁ 0 0 (vec3 1 2 0)
                      have h₁₅₀ := h₁ 0 0 (vec3 2 1 0)
                      have h₁₅₁ := h₁ 0 0 (vec3 1 0 2)
                      have h₁₅₂ := h₁ 0 0 (vec3 2 0 1)
                      have h₁₅₃ := h₁ 0 0 (vec3 0 2 1)
                      have h₁₅₄ := h₁ 0 0 (vec3 1 1 1)
                      norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl,
                              hcontdiffv] at h₁₄₃ h₁₄₄ h₁₄₅ h₁₄₆ h₁₄₇ h₁₄₈ h₁₄₉ h₁₅₀ h₁₅₁ h₁₅₂ h₁₅₃ h₁₅₄ <;>
                            (try norm_num) <;>
                          (try contradiction) <;>
                        (try linarith)
                    }) <;>
                (try {
                    have h₁₅₅ := h₁ 1 0 (vec3 1 0 0)
                    have h₁₅₆ := h₁ 1 0 (vec3 0 1 0)
                    have h₁₅₇ := h₁ 1 0 (vec3 0 0 1)
                    have h₁₅₈ := h₁ 1 0 (vec3 1 1 0)
                    have h₁₅₉ := h₁ 1 0 (vec3 1 0 1)
                    have h₁₆₀ := h₁ 1 0 (vec3 0 1 1)
                    have h₁₆₁ := h₁ 1 0 (vec3 1 2 0)
                    have h₁₆₂ := h₁ 1 0 (vec3 2 1 0)
                    have h₁₆₃ := h₁ 1 0 (vec3 1 0 2)
                    have h₁₆₄ := h₁ 1 0 (vec3 2 0 1)
                    have h₁₆₅ := h₁ 1 0 (vec3 0 2 1)
                    have h₁₆₆ := h₁ 1 0 (vec3 1 1 1)
                    norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl,
                            hcontdiffv] at h₁₅₅ h₁₅₆ h₁₅₇ h₁₅₈ h₁₅₉ h₁₆₀ h₁₆₁ h₁₆₂ h₁₆₃ h₁₆₄ h₁₆₅ h₁₆₆ <;>
                          (try norm_num) <;>
                        (try contradiction) <;>
                      (try linarith)
                  }) <;>
              (try {
                  have h₁₆₇ := h₁ 0 1 (vec3 1 0 0)
                  have h₁₆₈ := h₁ 0 1 (vec3 0 1 0)
                  have h₁₆₉ := h₁ 0 1 (vec3 0 0 1)
                  have h₁₇₀ := h₁ 0 1 (vec3 1 1 0)
                  have h₁₇₁ := h₁ 0 1 (vec3 1 0 1)
                  have h₁₇₂ := h₁ 0 1 (vec3 0 1 1)
                  have h₁₇₃ := h₁ 0 1 (vec3 1 2 0)
                  have h₁₇₄ := h₁ 0 1 (vec3 2 1 0)
                  have h₁₇₅ := h₁ 0 1 (vec3 1 0 2)
                  have h₁₇₆ := h₁ 0 1 (vec3 2 0 1)
                  have h₁₇₇ := h₁ 0 1 (vec3 0 2 1)
                  have h₁₇₈ := h₁ 0 1 (vec3 1 1 1)
                  norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl,
                          hcontdiffv] at h₁₆₇ h₁₆₈ h₁₆₉ h₁₇₀ h₁₇₁ h₁₇₂ h₁₇₃ h₁₇₄ h₁₇₅ h₁₇₆ h₁₇₇ h₁₇₈ <;>
                        (try norm_num) <;>
                      (try contradiction) <;>
                    (try linarith)
                }) <;>
            (try {
                have h₁₇₉ := h₁ 1 1 (vec3 1 0 0)
                have h₁₈₀ := h₁ 1 1 (vec3 0 1 0)
                have h₁₈₁ := h₁ 1 1 (vec3 0 0 1)
                have h₁₈₂ := h₁ 1 1 (vec3 1 1 0)
                have h₁₈₃ := h₁ 1 1 (vec3 1 0 1)
                have h₁₈₄ := h₁ 1 1 (vec3 0 1 1)
                have h₁₈₅ := h₁ 1 1 (vec3 1 2 0)
                have h₁₈₆ := h₁ 1 1 (vec3 2 1 0)
                have h₁₈₇ := h₁ 1 1 (vec3 1 0 2)
                have h₁₈₈ := h₁ 1 1 (vec3 2 0 1)
                have h₁₈₉ := h₁ 1 1 (vec3 0 2 1)
                have h₁₉₀ := h₁ 1 1 (vec3 1 1 1)
                norm_num [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl,
                        hcontdiffv] at h₁₇₉ h₁₈₀ h₁₈₁ h₁₈₂ h₁₈₃ h₁₈₄ h₁₈₅ h₁₈₆ h₁₈₇ h₁₈₈ h₁₈₉ h₁₉₀ <;>
                      (try norm_num) <;>
                    (try contradiction) <;>
                  (try linarith)
              }) <;>
          simp_all [hG, hvec2, hvec3, Function.funext_iff, Fin.forall_fin_succ, hpartderiv, hvrepl, hcontdiffv] <;>
        norm_num at * <;>
      (try contradiction) <;>
    (try linarith)