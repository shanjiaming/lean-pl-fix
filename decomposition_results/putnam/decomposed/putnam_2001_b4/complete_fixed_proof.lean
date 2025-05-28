theorem putnam_2001_b4 (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : S → S) (hf : ∀ x : S, f x = x - 1 / (x : ℚ)) :
  ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ ↔ ((True) : Prop):=
  by
  have h₁ : ⋂ n ∈ Ici 1, (f^[n] '' (univ : Set S)) = ∅:=
    by
    have h₂ : ∀ (x : S), ∃ (n : ℕ), n ∈ Ici 1 ∧ x ∉ f^[n] '' (univ : Set S):=
      by
      --  intro x
      --  by_contra! h
      have h₃ := h 1
      have h₄ := h 2
      have h₅ : x ∈ f^[1] '' (univ : Set S):= by -- simpa using h₃
        hole
      have h₆ : x ∈ f^[2] '' (univ : Set S):= by -- simpa using h₄
        hole
      obtain ⟨y₁, _, hy₁⟩ := h₅
      obtain ⟨y₂, _, hy₂⟩ := h₆
      have h₇ : f y₁ = x:= by simpa [Function.iterate_succ_apply'] using hy₁
        hole
      have h₈ : f (f y₂) = x:= by simpa [Function.iterate_succ_apply'] using hy₂
        hole
      have h₉ : f y₁ = f (f y₂):= by rw [h₇, h₈]
        hole
      have h₁₀ : (f y₁ : ℚ) = (f (f y₂) : ℚ):= by exact congr_arg Subtype.val h₉
        hole
      have h₁₁ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ):= by
        simp only [hf, Subtype.coe_mk] at h₁₀ ⊢ <;> field_simp [hf, Subtype.coe_mk] at h₁₀ ⊢ <;> ring_nf at h₁₀ ⊢ <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₁ : ℚ) ≠ 0 by
                intro h₁₂
                have h₁₃ := y₁.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₃ ⊢ <;> aesop),
            sq_pos_of_ne_zero
              (show (f y₂ : ℚ) ≠ 0 by
                intro h₁₂
                have h₁₃ := (f y₂).2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₃ ⊢ <;> aesop)]
        hole
      have h₁₂ : (y₁ : ℚ) = (f y₂ : ℚ):=
        by
        have h₁₃ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := h₁₁
        have h₁₄ : (y₁ : ℚ) = (f y₂ : ℚ):= by
          by_cases h₁₅ : (y₁ : ℚ) = 0
          · exfalso
            have h₁₆ := y₁.2
            simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₆ ⊢ <;> aesop
          · by_cases h₁₆ : (f y₂ : ℚ) = 0
            · exfalso
              have h₁₇ := (f y₂).2
              simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₇ ⊢ <;> aesop
            ·
              have h₁₇ : (y₁ : ℚ) ≠ 0:= by assumption
                hole
              have h₁₈ : (f y₂ : ℚ) ≠ 0:= by assumption
                hole
              have h₁₉ : (y₁ : ℚ) * (f y₂ : ℚ) ≠ 0:= by positivity
                hole
              field_simp [h₁₇, h₁₈, h₁₉] at h₁₃
              nlinarith [sq_pos_of_ne_zero (show (y₁ : ℚ) ≠ 0 by assumption),
                sq_pos_of_ne_zero (show (f y₂ : ℚ) ≠ 0 by assumption)]
          hole
        exact h₁₄
        hole
      have h₁₃ : (y₁ : ℚ) = (f y₂ : ℚ) := h₁₂
      have h₁₄ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ):= by
        simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₁ : ℚ) ≠ 0 by
                intro h₁₅
                have h₁₆ := y₁.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₆ ⊢ <;> aesop)]
        hole
      have h₁₅ : (f y₁ : ℚ) = (f (f y₂) : ℚ):= by rw [h₉]
        hole
      have h₁₆ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ):= by
        simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₁ : ℚ) ≠ 0 by
                intro h₁₅
                have h₁₆ := y₁.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₆ ⊢ <;> aesop)]
        hole
      have h₁₇ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ):= by linarith
        hole
      have h₁₈ : (y₁ : ℚ) = (f y₂ : ℚ):=
        by
        have h₁₃ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := h₁₁
        have h₁₄ : (y₁ : ℚ) = (f y₂ : ℚ):= by
          by_cases h₁₅ : (y₁ : ℚ) = 0
          · exfalso
            have h₁₆ := y₁.2
            simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₆ ⊢ <;> aesop
          · by_cases h₁₆ : (f y₂ : ℚ) = 0
            · exfalso
              have h₁₇ := (f y₂).2
              simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₁₇ ⊢ <;> aesop
            ·
              have h₁₇ : (y₁ : ℚ) ≠ 0:= by assumption
                hole
              have h₁₈ : (f y₂ : ℚ) ≠ 0:= by assumption
                hole
              have h₁₉ : (y₁ : ℚ) * (f y₂ : ℚ) ≠ 0:= by positivity
                hole
              field_simp [h₁₇, h₁₈, h₁₉] at h₁₃
              nlinarith [sq_pos_of_ne_zero (show (y₁ : ℚ) ≠ 0 by assumption),
                sq_pos_of_ne_zero (show (f y₂ : ℚ) ≠ 0 by assumption)]
          hole
        exact h₁₄
        hole
      have h₁₉ : (y₁ : ℚ) = (f y₂ : ℚ) := h₁₈
      have h₂₀ : (f y₂ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ):= by
        simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₂ : ℚ) ≠ 0 by
                intro h₂₁
                have h₂₂ := y₂.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₂₂ ⊢ <;> aesop)]
        hole
      have h₂₁ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ):= by
        simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₁ : ℚ) ≠ 0 by
                intro h₂₃
                have h₂₄ := y₁.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₂₄ ⊢ <;> aesop)]
        hole
      have h₂₂ : (x : ℚ) = (f y₁ : ℚ):= by simpa [h₇] using congr_arg Subtype.val h₇
        hole
      have h₂₃ : (x : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ):= by linarith
        hole
      have h₂₄ : (x : ℚ) = (f y₂ : ℚ):= by simpa [h₈] using congr_arg Subtype.val h₈
        hole
      have h₂₅ : (x : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ):= by linarith
        hole
      have h₂₆ : (y₁ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ):= by linarith
        hole
      have h₂₇ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ):= by linarith
        hole
      have h₂₈ : (f y₁ : ℚ) = (f y₂ : ℚ):= by linarith
        hole
      have h₂₉ : (f y₁ : ℚ) = (y₁ : ℚ) - 1 / (y₁ : ℚ):= by
        simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₁ : ℚ) ≠ 0 by
                intro h₃₀
                have h₃₁ := y₁.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₁ ⊢ <;> aesop)]
        hole
      have h₃₀ : (f y₂ : ℚ) = (y₂ : ℚ) - 1 / (y₂ : ℚ):= by
        simp [hf] <;> field_simp [Subtype.coe_mk] <;> ring_nf <;>
          nlinarith [sq_pos_of_ne_zero
              (show (y₂ : ℚ) ≠ 0 by
                intro h₃₁
                have h₃₂ := y₂.2
                simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₂ ⊢ <;> aesop)]
        hole
      have h₃₁ : (x : ℚ) - 1 / (x : ℚ) = (x : ℚ) - 1 / (x : ℚ):= by rfl
        hole
      have h₃₂ : 1 / (x : ℚ) = 0:=
        by
        have h₃₃ : (x : ℚ) - 1 / (x : ℚ) = (x : ℚ) - 1 / (x : ℚ):= by rfl
          hole
        have h₃₄ : (x : ℚ) ≠ 0:= by
          intro h₃₅
          have h₃₆ := x.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₆ ⊢ <;> aesop
          hole
        have h₃₅ : 1 / (x : ℚ) = 0:= by
          apply Eq.symm
          apply Eq.symm
          field_simp [h₃₄] at h₂₃ h₂₅ h₂₆ h₂₇ h₂₈ h₂₉ h₃₀ h₃₁ ⊢ <;>
            nlinarith [sq_pos_of_ne_zero
                (show (y₁ : ℚ) ≠ 0 by
                  intro h₃₆
                  have h₃₇ := y₁.2
                  simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₇ ⊢ <;> aesop),
              sq_pos_of_ne_zero
                (show (y₂ : ℚ) ≠ 0 by
                  intro h₃₆
                  have h₃₇ := y₂.2
                  simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₇ ⊢ <;> aesop)]
          hole
        exact h₃₅
        hole
      have h₃₃ : False :=
        by
        have h₃₄ : (x : ℚ) ≠ 0 := by
          intro h₃₅
          have h₃₆ := x.2
          simp_all [Set.mem_diff, Set.mem_singleton_iff, Set.mem_insert_iff] <;> norm_num at h₃₆ ⊢ <;> aesop
        have h₃₅ : 1 / (x : ℚ) ≠ 0 := by positivity
        have h₃₆ : 1 / (x : ℚ) = 0 := h₃₂
        contradiction
      exact h₃₃
      hole
    have h₃ : ⋂ n ∈ Ici 1, (f^[n] '' (univ : Set S)) = ∅ :=
      by
      apply Set.eq_empty_of_forall_not_mem
      intro x hx
      have h₄ : ∀ (n : ℕ), n ∈ Ici 1 → x ∈ f^[n] '' (univ : Set S) := by simpa using hx
      have h₅ := h₂ x
      obtain ⟨n, hn, hn'⟩ := h₅
      have h₆ := h₄ n hn
      exact hn' h₆
    --  exact h₃
    hole
  have h₂ : ⋂ n ∈ Ici 1, f^[n] '' univ = ∅ ↔ ((True) : Prop) :=
    by
    constructor
    · intro h
      trivial
    · intro h
      simpa [h₁] using h₁
  --  exact h₂
  hole