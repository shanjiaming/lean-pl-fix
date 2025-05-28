theorem putnam_1994_a6 (f : Fin 10 → Equiv.Perm ℤ) (mijcomp : ℕ → (ℕ → Fin 10) → ℕ → (ℤ → ℤ)) (F : Finset (ℤ → ℤ))
  (hf : ∀ n : ℤ, ∃ m : ℕ, ∃ i : ℕ → Fin 10, m ≥ 1 ∧ (mijcomp m i 0) 0 = n)
  (hmijcomp :
    ∀ m ≥ 1,
      ∀ (i : ℕ → Fin 10) (j : Fin m),
        mijcomp m i j = if (j = m - 1) then (f (i j) : ℤ → ℤ) else (f (i j) ∘ mijcomp m i (j + 1)))
  (hF :
    F =
      {g : ℤ → ℤ |
        ∃ e : Fin 10 → Fin 2,
          g =
            (f 0)^[e 0] ∘
              (f 1)^[e 1] ∘
                (f 2)^[e 2] ∘
                  (f 3)^[e 3] ∘ (f 4)^[e 4] ∘ (f 5)^[e 5] ∘ (f 6)^[e 6] ∘ (f 7)^[e 7] ∘ (f 8)^[e 8] ∘ (f 9)^[e 9]}) :
  ∀ A : Finset ℤ, A.Nonempty → {g ∈ F | g '' A = A}.card ≤ 512:=
  by
  have h₁ : False:= by
    have h₂ := hf 0
    --  obtain ⟨m, i, hm, h₃⟩ := h₂
    have h₄ := hmijcomp m (by linarith) i ⟨0, by omega⟩
    have h₅:=
      --  hmijcomp m (by linarith) i
        ⟨m - 1, by
          have h₅₁ : m ≥ 1:= by -- linarith
            hole
      --      omega⟩
      hole
    simp at h₄ h₅ <;> (try omega) <;>
        (try {
            have h₆ := h₃
            have h₇ := h₄
            have h₈ := h₅
            simp at h₆ h₇ h₈ <;> (try omega) <;>
              (try {
                  have h₉ := hf 1
                  obtain ⟨m', i', hm', h₁₀⟩ := h₉
                  have h₁₁ := hmijcomp m' (by linarith) i' ⟨0, by omega⟩
                  have h₁₂ :=
                    hmijcomp m' (by linarith) i'
                      ⟨m' - 1, by
                        have h₁₃ : m' ≥ 1 := by linarith
                        omega⟩
                  simp at h₁₁ h₁₂ <;> (try omega) <;>
                    (try {
                        have h₁₄ := h₁₀
                        have h₁₅ := h₁₁
                        have h₁₆ := h₁₂
                        simp at h₁₄ h₁₅ h₁₆ <;> (try omega) <;>
                          (try {
                              have h₁₇ := hf (-1)
                              obtain ⟨m'', i'', hm'', h₁₈⟩ := h₁₇
                              have h₁₉ := hmijcomp m'' (by linarith) i'' ⟨0, by omega⟩
                              have h₂₀ :=
                                hmijcomp m'' (by linarith) i''
                                  ⟨m'' - 1, by
                                    have h₂₁ : m'' ≥ 1 := by linarith
                                    omega⟩
                              simp at h₁₉ h₂₀ <;> (try omega) <;>
                                (try {
                                    have h₂₂ := h₁₈
                                    have h₂₃ := h₁₉
                                    have h₂₄ := h₂₀
                                    simp at h₂₂ h₂₃ h₂₄ <;> (try omega) <;>
                                      (try
                                          {simp_all [Function.funext_iff, Equiv.Perm.coe_fn_symm_mk] <;> (try omega) <;>
                                            (try {aesop
                                              })
                                        })
                                  })
                            })
                      })
                })
          }) <;>
      (try
          {simp_all [Function.funext_iff, Equiv.Perm.coe_fn_symm_mk] <;> (try omega) <;>
            (try {aesop
              })
        })
    hole
  have h₂ : ∀ A : Finset ℤ, A.Nonempty → {g ∈ F | g '' A = A}.card ≤ 512:=
    by
    --  intro A hA
    --  exfalso
    --  exact h₁
    hole
  --  exact h₂
  hole