theorem putnam_2017_b3 (f : ℝ → ℝ) (c : ℕ → ℝ) (hc : ∀ n, c n = 0 ∨ c n = 1) (hf : ∀ x, f x = ∑' n : ℕ, (c n) * x ^ n) :
  f (2 / 3) = 3 / 2 → Irrational (f 1 / 2):= by
  --  intro h₁
  have h₂ : False:=
    by
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n:=
      by
      --  refine' Summable.of_nonneg_of_le (fun n => _) (fun n => _) (summable_geometric_of_lt_one (by norm_num) (by norm_num))
      --  · cases' hc n with h₂ h₂
      --    · rw [h₂]
      --      simp
      --    · rw [h₂]
      --      positivity
      --  · cases' hc n with h₂ h₂
      --    · rw [h₂]
      --      simp
      --  --    · rw [h₂] <;> simp [le_refl]
      hole
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ):=
      by
      have h₄ : f (2 / 3 : ℝ) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n):= by -- rw [hf]
        hole
      --  rw [h₁] at h₄
      --  linarith
      linarith
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0:= by
      by_contra! h₅
      have h₆ : ∀ (N : ℕ), ∃ (n : ℕ), n ≥ N ∧ c n ≠ 0:= by -- simpa using h₅
        hole
      have h₇ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0:= by
        --  classical
        --  have h₈ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0 :=
        --    by
        --    choose! u hu₁ hu₂ using h₆
        --    have h₉ : StrictMono u := by
        --      refine' strictMono_nat_of_lt_succ fun n => _
        --      specialize hu₁ (u n + 1)
        --      have h₁₀ := hu₁
        --      simp at h₁₀ ⊢ <;> omega
        --    refine' ⟨u, h₉, _⟩
        --    intro n
        --    specialize hu₂ n
        --    simp_all
        --  exact h₈
        hole
      obtain ⟨u, hu₁, hu₂⟩ := h₇
      have h₈ : ∀ (n : ℕ), c (u n) ≠ 0 := hu₂
      have h₉ : ∀ (n : ℕ), c (u n) = 1 := by
        intro n
        have h₁₀ := hc (u n)
        cases' h₁₀ with h₁₀ h₁₀
        · exfalso
          apply h₈ n
          simp_all
        · simp_all
      have h₁₀ : ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n ≥ ∑' n : ℕ, (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) :=
        by
        have h₁₁ : ∀ (n : ℕ), (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) :=
          by
          intro n
          have h₁₂ := h₉ n
          simp [h₁₂]
        have h₁₂ : ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n ≥ ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) :=
          by
          have h₁₃ :
            ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) := rfl
          have h₁₄ : ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) ≤ ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n :=
            by
            refine' tsum_le_tsum_of_inj _ hu₁.injOn _ _
            · intro n _
              simp [h₉] <;> aesop
            · intro n _
              by_cases h₁₅ : n ∈ Set.range u
              · simp_all <;> aesop
              · simp_all <;> aesop
            · exact h_sum
          linarith
        have h₁₃ : ∑' n : ℕ, (c (u n) : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) :=
          by
          refine' tsum_congr _
          intro n
          rw [h₁₁]
        rw [h₁₃] at h₁₂
        exact h₁₂
      have h₁₁ : ∑' n : ℕ, (1 : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) := by simp [one_mul]
      rw [h₁₁] at h₁₀
      have h₁₂ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) = ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) := rfl
      have h₁₃ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n :=
        by
        have h₁₄ : ∀ (n : ℕ), ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ ((2 / 3 : ℝ) : ℝ) ^ n :=
          by
          intro n
          have h₁₅ : u n ≥ n := by exact (StrictMono.id_le hu₁) n
          have h₁₆ : ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ ((2 / 3 : ℝ) : ℝ) ^ n := by
            exact pow_le_pow_of_le_one (by norm_num) (by norm_num) h₁₅
          exact h₁₆
        exact
          tsum_le_tsum h₁₄ (summable_geometric_of_lt_one (by norm_num) (by norm_num) |>.comp_injective hu₁.injective)
            (summable_geometric_of_lt_one (by norm_num) (by norm_num))
      have h₁₄ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n = 3 :=
        by
        have h₁₅ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n = ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ n := rfl
        rw [h₁₅]
        rw [tsum_geometric_of_lt_one (by norm_num) (by norm_num)] <;> norm_num
      have h₁₅ : ∑' n : ℕ, ((2 / 3 : ℝ) : ℝ) ^ (u n) ≥ 3 := by linarith
      have h₁₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := h₃
      linarith
      hole
    --  obtain ⟨N, hN⟩ := h₄
    have h₅ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n:=
      by
      have h₇ : ∀ (n : ℕ), n ≥ N → (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0:=
        by
        --  intro n hn
        have h₈ : c n = 0 := hN n hn
        --  rw [h₈]
        --  simp
        hole
      --  calc
      --    (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := rfl
      --    _ = ∑' n : ℕ, if n < N then (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n else 0 :=
      --      by
      --      apply tsum_congr
      --      intro n
      --      split_ifs with h
      --      · simp_all
      --      ·
      --        have h₈ : n ≥ N := by omega
      --        have h₉ : (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0 := h₇ n h₈
      --        simp_all
      --    _ = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      --      rw [tsum_eq_sum] <;> simp_all [Finset.sum_range_succ, add_comm] <;> aesop
      --    _ = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := rfl
      hole
    --  rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ):= by -- linarith
      linarith
    have h₈ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) :=
      rfl
    have h₉ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₀ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₁ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ):= by -- linarith
      linarith
    have h₁₃ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 :=
      by
      intro n h₁₅
      exact hc n
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1):=
      by
      --  use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0:= by
        --  exact
        --    Finset.sum_nonneg fun n _ => by
        --      cases' hc n with h₁₇ h₁₇
        --      · rw [h₁₇]
        --        simp
        --      · rw [h₁₇]
        --        positivity
        linarith
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0:= by -- positivity
        simpa
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0:= by -- positivity
        linarith
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) :=
      by
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by sorry
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by sorry
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0:= by -- positivity
        linarith
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) :=
      by
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by sorry
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by sorry
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by sorry
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) :=
      by
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by sorry
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by sorry
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      field_simp [h₁₂] <;> ring_nf at * <;> norm_num at * <;> linarith
      hole
    --  obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      exact h₁₆
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ):= by -- linarith
      linarith
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ):= by -- linarith
      linarith
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2:=
      by
      have h₂₁ := h₁₉
      --  --  --  --  --  field_simp at h₂₁ <;> ring_nf at h₂₁ ⊢ <;> norm_cast at h₂₁ ⊢ <;> norm_num at h₂₁ ⊢ <;> (try omega) <;>
                            (try ring_nf at h₂₁ ⊢) <;>
                          (try norm_num at h₂₁ ⊢) <;>
                        (try omega) <;>
                      (try
                          {
                          have h₂₂ : N ≥ 1 := by
                            by_contra h
                            have h₂₃ : N = 0 := by omega
                            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          omega
                        }) <;>
                    (try
                        {
                        have h₂₂ : N ≥ 1 := by
                          by_contra h
                          have h₂₃ : N = 0 := by omega
                          simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                        have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        omega
                      }) <;>
                  (try omega) <;>
                (try ring_nf at h₂₁ ⊢) <;>
              (try norm_num at h₂₁ ⊢) <;>
            (try omega) <;>
          (try
              {
              have h₂₂ : N ≥ 1 := by
                by_contra h
                have h₂₃ : N = 0 := by omega
                simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
              have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              omega
            }) <;>
        (try omega)
      hole
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2:= by -- exact h₂₀
      linarith
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1:=
      by
      have h₂₃ : (3 : ℕ) % 2 = 1:= by -- norm_num
        norm_num
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1:=
        by
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1:=
          by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1:= by
            --  intro n hn
            --  induction' hn with n hn IH
            --  · norm_num
            --  · simp [pow_succ, Nat.mul_mod, IH] <;> norm_num
            hole
          have h₂₇ : N ≥ 1:= by
            --  by_contra h₂₈
            have h₂₉ : N = 0:= by -- omega
              hole
            --  simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
            hole
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1:= by
            have h₃₁ : N - 1 ≥ 0:= by -- omega
              norm_num
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1:= by
              have h₃₃ : N - 1 ≥ 0:= by -- omega
                norm_num
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1:= by
                --  apply h₂₆
                --  omega
                hole
              --  exact h₃₄
              linarith
            --  exact h₃₂
            linarith
          --  exact h₃₀
          linarith
        --  exact h₂₅
        linarith
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1:= by -- omega
        omega
      --  exact h₂₈
      linarith
    have h₂₃ : (k : ℕ) % 2 = 0:= by -- omega
      hole
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1:= by
      --  intro n h₁₅
      --  exact hc n
      hole
  have h₂ : False :=
    by
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by sorry
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by sorry
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by sorry
    obtain ⟨N, hN⟩ := h₄
    have h₅ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by sorry
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by sorry
    have h₈ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) :=
      rfl
    have h₉ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₀ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₁ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by sorry
    have h₁₃ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 :=
      by
      intro n h₁₅
      exact hc n
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) :=
      by
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by
        exact
          Finset.sum_nonneg fun n _ => by
            cases' hc n with h₁₇ h₁₇
            · rw [h₁₇]
              simp
            · rw [h₁₇]
              positivity
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by positivity
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      field_simp [h₁₂] <;> ring_nf at * <;> norm_num at * <;> linarith
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      exact h₁₆
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by linarith
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by linarith
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 :=
      by
      have h₂₁ := h₁₉
      field_simp at h₂₁ <;> ring_nf at h₂₁ ⊢ <;> norm_cast at h₂₁ ⊢ <;> norm_num at h₂₁ ⊢ <;> (try omega) <;>
                            (try ring_nf at h₂₁ ⊢) <;>
                          (try norm_num at h₂₁ ⊢) <;>
                        (try omega) <;>
                      (try
                          {
                          have h₂₂ : N ≥ 1 := by
                            by_contra h
                            have h₂₃ : N = 0 := by omega
                            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          omega
                        }) <;>
                    (try
                        {
                        have h₂₂ : N ≥ 1 := by
                          by_contra h
                          have h₂₃ : N = 0 := by omega
                          simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                        have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        omega
                      }) <;>
                  (try omega) <;>
                (try ring_nf at h₂₁ ⊢) <;>
              (try norm_num at h₂₁ ⊢) <;>
            (try omega) <;>
          (try
              {
              have h₂₂ : N ≥ 1 := by
                by_contra h
                have h₂₃ : N = 0 := by omega
                simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
              have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              omega
            }) <;>
        (try omega)
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by exact h₂₀
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 :=
      by
      have h₂₃ : (3 : ℕ) % 2 = 1 := by norm_num
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
        by
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
          by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 :=
            by
            intro n hn
            induction' hn with n hn IH
            · norm_num
            · simp [pow_succ, Nat.mul_mod, IH] <;> norm_num
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by omega
            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
            by
            have h₃₁ : N - 1 ≥ 0 := by omega
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
              by
              have h₃₃ : N - 1 ≥ 0 := by omega
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                apply h₂₆
                omega
              exact h₃₄
            exact h₃₂
          exact h₃₀
        exact h₂₅
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by omega
      exact h₂₈
    have h₂₃ : (k : ℕ) % 2 = 0 := by omega
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1):= by -- exact h₁₆
      linarith
  have h₂ : False :=
    by
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by sorry
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by sorry
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by sorry
    obtain ⟨N, hN⟩ := h₄
    have h₅ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by sorry
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by sorry
    have h₈ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) :=
      rfl
    have h₉ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₀ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₁ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by sorry
    have h₁₃ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 :=
      by
      intro n h₁₅
      exact hc n
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by sorry
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      exact h₁₆
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by linarith
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by linarith
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 :=
      by
      have h₂₁ := h₁₉
      field_simp at h₂₁ <;> ring_nf at h₂₁ ⊢ <;> norm_cast at h₂₁ ⊢ <;> norm_num at h₂₁ ⊢ <;> (try omega) <;>
                            (try ring_nf at h₂₁ ⊢) <;>
                          (try norm_num at h₂₁ ⊢) <;>
                        (try omega) <;>
                      (try
                          {
                          have h₂₂ : N ≥ 1 := by
                            by_contra h
                            have h₂₃ : N = 0 := by omega
                            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          omega
                        }) <;>
                    (try
                        {
                        have h₂₂ : N ≥ 1 := by
                          by_contra h
                          have h₂₃ : N = 0 := by omega
                          simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                        have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        omega
                      }) <;>
                  (try omega) <;>
                (try ring_nf at h₂₁ ⊢) <;>
              (try norm_num at h₂₁ ⊢) <;>
            (try omega) <;>
          (try
              {
              have h₂₂ : N ≥ 1 := by
                by_contra h
                have h₂₃ : N = 0 := by omega
                simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
              have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              omega
            }) <;>
        (try omega)
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by exact h₂₀
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 :=
      by
      have h₂₃ : (3 : ℕ) % 2 = 1 := by norm_num
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
        by
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
          by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 :=
            by
            intro n hn
            induction' hn with n hn IH
            · norm_num
            · simp [pow_succ, Nat.mul_mod, IH] <;> norm_num
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by omega
            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
            by
            have h₃₁ : N - 1 ≥ 0 := by omega
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
              by
              have h₃₃ : N - 1 ≥ 0 := by omega
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                apply h₂₆
                omega
              exact h₃₄
            exact h₃₂
          exact h₃₀
        exact h₂₅
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by omega
      exact h₂₈
    have h₂₃ : (k : ℕ) % 2 = 0 := by omega
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 := by sorry
  have h₂ : False :=
    by
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by sorry
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by sorry
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by sorry
    obtain ⟨N, hN⟩ := h₄
    have h₅ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by sorry
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by sorry
    have h₈ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) :=
      rfl
    have h₉ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₀ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by sorry
    have h₁₁ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by sorry
    have h₁₃ :
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
        (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) :=
      rfl
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 :=
      by
      intro n h₁₅
      exact hc n
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) :=
      by
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by
        exact
          Finset.sum_nonneg fun n _ => by
            cases' hc n with h₁₇ h₁₇
            · rw [h₁₇]
              simp
            · rw [h₁₇]
              positivity
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by positivity
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        positivity
      field_simp [h₁₂] <;> ring_nf at * <;> norm_num at * <;> linarith
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      exact h₁₆
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by linarith
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by linarith
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 :=
      by
      have h₂₁ := h₁₉
      field_simp at h₂₁ <;> ring_nf at h₂₁ ⊢ <;> norm_cast at h₂₁ ⊢ <;> norm_num at h₂₁ ⊢ <;> (try omega) <;>
                            (try ring_nf at h₂₁ ⊢) <;>
                          (try norm_num at h₂₁ ⊢) <;>
                        (try omega) <;>
                      (try
                          {
                          have h₂₂ : N ≥ 1 := by
                            by_contra h
                            have h₂₃ : N = 0 := by omega
                            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                          have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                          omega
                        }) <;>
                    (try
                        {
                        have h₂₂ : N ≥ 1 := by
                          by_contra h
                          have h₂₃ : N = 0 := by omega
                          simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
                        have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
                        omega
                      }) <;>
                  (try omega) <;>
                (try ring_nf at h₂₁ ⊢) <;>
              (try norm_num at h₂₁ ⊢) <;>
            (try omega) <;>
          (try
              {
              have h₂₂ : N ≥ 1 := by
                by_contra h
                have h₂₃ : N = 0 := by omega
                simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
              have h₂₃ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              have h₂₄ : (3 : ℕ) ^ (N - 1) > 0 := by apply pow_pos <;> norm_num
              omega
            }) <;>
        (try omega)
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by exact h₂₀
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 :=
      by
      have h₂₃ : (3 : ℕ) % 2 = 1 := by norm_num
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
        by
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
          by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 :=
            by
            intro n hn
            induction' hn with n hn IH
            · norm_num
            · simp [pow_succ, Nat.mul_mod, IH] <;> norm_num
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by omega
            simp_all [Finset.sum_range_succ] <;> norm_num at * <;> linarith
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
            by
            have h₃₁ : N - 1 ≥ 0 := by omega
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 :=
              by
              have h₃₃ : N - 1 ≥ 0 := by omega
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                apply h₂₆
                omega
              exact h₃₄
            exact h₃₂
          exact h₃₀
        exact h₂₅
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by omega
      exact h₂₈
    have h₂₃ : (k : ℕ) % 2 = 0 := by omega
    omega
    hole
  have h₃ : Irrational (f 1 / 2):= by
    --  exfalso
    --  exact h₂
    hole
  --  exact h₃
  hole