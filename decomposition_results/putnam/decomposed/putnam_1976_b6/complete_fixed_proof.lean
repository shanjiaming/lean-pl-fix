theorem putnam_1976_b6 (σ : ℕ → ℤ) (hσ : σ = fun N : ℕ => ∑ d in Nat.divisors N, (d : ℤ)) (quasiperfect : ℕ → Prop)
  (quasiperfect_def : ∀ N, quasiperfect N ↔ σ N = 2 * N + 1) : ∀ N : ℕ, quasiperfect N → ∃ m : ℤ, Odd m ∧ m ^ 2 = N:=
  by
  --  intro N h_quasiperfect
  have h₁ : False:=
    by
    have h₂ : σ N = 2 * (N : ℤ) + 1:= by
      --  rw [quasiperfect_def] at h_quasiperfect
      --  exact h_quasiperfect
      hole
    have h₃ : σ N = ∑ d in Nat.divisors N, (d : ℤ):= by -- rw [hσ] <;> simp
      hole
    --  rw [h₃] at h₂
    have h₄ : ∑ d in Nat.divisors N, (d : ℤ) = 2 * (N : ℤ) + 1:= by -- linarith
      linarith
    have h₅ : N = 0 ∨ N = 1 ∨ N ≥ 2:= by
      --  by_cases h₅ : N = 0
      --  · exact Or.inl h₅
      --  · by_cases h₆ : N = 1
      --    · exact Or.inr (Or.inl h₆)
        ·
          have h₇ : N ≥ 2:= by
            --  by_contra h₇
            have h₈ : N ≤ 1:= by -- linarith
              linarith
            --  --  interval_cases N <;> simp_all (config := { decide := true })
            omega
      --      exact Or.inr (Or.inr h₇)
      hole
    --  rcases h₅ with (rfl | rfl | h₅)
    --  · simp [Nat.divisors_zero] at h₄ ⊢ <;> norm_num at h₄ ⊢ <;> linarith
    --  --  · norm_num [Nat.divisors] at h₄ ⊢ <;> simp_all (config := { decide := true }) <;> norm_num at h₄ ⊢ <;> linarith
    ·
      have h₆ : ∑ d in Nat.divisors N, (d : ℤ) ≥ (N : ℤ) + 1:=
        by
        have h₇ : (N : ℤ) ∈ (Nat.divisors N : Finset ℕ):= by -- simp [Nat.mem_divisors, Nat.dvd_refl] <;> omega
          hole
        have h₈ : (1 : ℤ) ∈ (Nat.divisors N : Finset ℕ):= by -- simp [Nat.mem_divisors, Nat.dvd_refl] <;> omega
          hole
        have h₉ : ∑ d in Nat.divisors N, (d : ℤ) ≥ (N : ℤ) + 1:= by
          --  calc
          --    ∑ d in Nat.divisors N, (d : ℤ) ≥ ∑ d in {(1 : ℕ), N}, (d : ℤ) :=
          --      by
          --      apply Finset.sum_le_sum_of_subset_of_nonneg
          --      · intro x hx
          --        simp only [Finset.mem_insert, Finset.mem_singleton, Nat.mem_divisors] at hx ⊢
          --        aesop
          --      · intro x _ _
          --        simp
          --    _ = (1 : ℤ) + (N : ℤ) := by
          --      simp [Finset.sum_pair
          --          (show (1 : ℕ) ≠ N by
          --            intro h
          --            have h₁₀ : N ≥ 2 := by omega
          --            have h₁₁ : (1 : ℕ) < N := by omega
          --            omega)]
          --    _ = (N : ℤ) + 1 := by ring
          linarith
        --  exact h₉
        hole
      have h₇ : (2 : ℤ) * (N : ℤ) + 1 ≥ (N : ℤ) + 1:=
        by
        have h₈ : (N : ℤ) ≥ 2:= by -- exact_mod_cast h₅
          linarith
        --  linarith
        linarith
      have h₈ : ∑ d in Nat.divisors N, (d : ℤ) > (2 : ℤ) * (N : ℤ) + 1:=
        by
        have h₉ : ∑ d in Nat.divisors N, (d : ℤ) ≥ (N : ℤ) + 1 := h₆
        have h₁₀ : (N : ℤ) ≥ 2:= by -- exact_mod_cast h₅
          linarith
        have h₁₁ : ∑ d in Nat.divisors N, (d : ℤ) > (2 : ℤ) * (N : ℤ) + 1:=
          by
          --  by_contra h₁₁
          have h₁₂ : ∑ d in Nat.divisors N, (d : ℤ) ≤ (2 : ℤ) * (N : ℤ) + 1:= by -- linarith
            linarith
          have h₁₃ : ∑ d in Nat.divisors N, (d : ℤ) = (2 : ℤ) * (N : ℤ) + 1:= by -- linarith
            linarith
          have h₁₄ : ∑ d in Nat.divisors N, (d : ℤ) ≥ (N : ℤ) + 1 := h₆
          have h₁₅ : (N : ℤ) + 1 ≤ (2 : ℤ) * (N : ℤ) + 1:= by -- linarith
            linarith
          have h₁₆ : (N : ℤ) ≤ (2 : ℤ) * (N : ℤ):= by -- linarith
            linarith
          have h₁₇ : (N : ℤ) ≥ 0:= by -- linarith
            norm_num
          have h₁₈ : (N : ℕ) ≥ 2:= by -- exact_mod_cast h₅
            linarith
          have h₁₉ : ∑ d in Nat.divisors N, (d : ℤ) > (2 : ℤ) * (N : ℤ) + 1:=
            by
            have h₂₀ : ∃ d, d ∈ Nat.divisors N ∧ d ≠ 1 ∧ d ≠ N:=
              by
              have h₂₁ : N ≠ 1:= by -- omega
                linarith
              have h₂₂ : N ≠ 0:= by -- omega
                linarith
              have h₂₃ : ∃ p, p.Prime ∧ p ∣ N:= by -- -- apply Nat.exists_prime_and_dvd <;> omega
                hole
              --  obtain ⟨p, hp, hpd⟩ := h₂₃
              have h₂₄ : p ∣ N := hpd
              have h₂₅ : p ∈ Nat.divisors N:= by -- simp [Nat.mem_divisors, h₂₂, h₂₄]
                hole
              have h₂₆ : p ≠ 1 := hp.ne_one
              have h₂₇ : p ≠ N ∨ p = N:= by
                --  by_cases h₂₇ : p = N
                --  · exact Or.inr h₂₇
                --  · exact Or.inl h₂₇
                omega
              --  cases h₂₇ with
              --  | inl h₂₇ =>
              --    have h₂₈ : p ≠ N := h₂₇
              --    have h₂₉ : p ≠ 1 := hp.ne_one
              --    exact ⟨p, h₂₅, by omega, by omega⟩
              --  | inr h₂₇ =>
              --    have h₂₈ : p = N := h₂₇
              --    have h₂₉ : p ≠ 1 := hp.ne_one
              --    have h₃₀ : N ≥ 2 := by omega
              --    have h₃₁ : 2 ∣ N ∨ 2 ∣ N := by
              --      by_cases h₃₁ : 2 ∣ N
              --      · exact Or.inl h₃₁
              --      · exact Or.inl (by omega)
              --    cases h₃₁ with
              --    | inl h₃₁ =>
              --      have h₃₂ : 2 ∣ N := h₃₁
              --      have h₃₃ : 2 ∈ Nat.divisors N := by simp [Nat.mem_divisors, h₂₂, h₃₂]
              --      have h₃₄ : 2 ≠ 1 := by decide
              --      have h₃₅ : 2 ≠ N := by
              --        by_contra h₃₅
              --        have h₃₆ : N = 2 := by omega
              --        have h₃₇ : p = 2 := by omega
              --        have h₃₈ : p.Prime := hp
              --        have h₃₉ : (2 : ℕ).Prime := by decide
              --        have h₄₀ : p = 2 := by omega
              --        have h₄₁ : ∑ d in Nat.divisors N, (d : ℤ) = (2 : ℤ) * (N : ℤ) + 1 := by
              --          simp_all [Finset.sum_const, Finset.card_range, Nat.divisors] <;> norm_num <;> ring_nf <;> omega
              --        omega
              --      exact ⟨2, h₃₃, by omega, by omega⟩
              --    | inr h₃₁ =>
              --      have h₃₂ : 2 ∣ N := h₃₁
              --      have h₃₃ : 2 ∈ Nat.divisors N := by simp [Nat.mem_divisors, h₂₂, h₃₂]
              --      have h₃₄ : 2 ≠ 1 := by decide
              --      have h₃₅ : 2 ≠ N := by
              --        by_contra h₃₅
              --        have h₃₆ : N = 2 := by omega
              --        have h₃₇ : p = 2 := by omega
              --        have h₃₈ : p.Prime := hp
              --        have h₃₉ : (2 : ℕ).Prime := by decide
              --        have h₄₀ : p = 2 := by omega
              --        have h₄₁ : ∑ d in Nat.divisors N, (d : ℤ) = (2 : ℤ) * (N : ℤ) + 1 := by
              --          simp_all [Finset.sum_const, Finset.card_range, Nat.divisors] <;> norm_num <;> ring_nf <;> omega
              --        omega
              --      exact ⟨2, h₃₃, by omega, by omega⟩
              hole
            --  obtain ⟨d, hd, hd₁, hd₂⟩ := h₂₀
            have h₄₂ : (d : ℤ) > 0:=
              by
              have h₄₃ : d > 0:= by
                have h₄₄ : d ∈ Nat.divisors N := hd
                have h₄₅ : d ∣ N:= by
                  --  simp [Nat.mem_divisors] at h₄₄
                  --  exact h₄₄.1
                  hole
                have h₄₆ : d > 0 := Nat.pos_of_dvd_of_pos h₄₅ (by omega)
                --  exact h₄₆
                linarith
              --  exact_mod_cast h₄₃
              linarith
            have h₄₃ : (d : ℤ) ≤ (N : ℤ):=
              by
              have h₄₄ : d ∣ N:= by
                have h₄₅ : d ∈ Nat.divisors N := hd
                have h₄₆ : d ∣ N:= by
                  --  simp [Nat.mem_divisors] at h₄₅
                  --  exact h₄₅.1
                  hole
                --  exact h₄₆
                omega
              have h₄₅ : d ≤ N := Nat.le_of_dvd (by omega) h₄₄
              --  exact_mod_cast h₄₅
              linarith
            have h₄₄ : ∑ d in Nat.divisors N, (d : ℤ) > (2 : ℤ) * (N : ℤ) + 1:=
              by
              have h₄₅ : (d : ℤ) ∈ (Nat.divisors N : Finset ℕ):= by -- exact_mod_cast hd
                hole
              have h₄₆ : ∑ d in Nat.divisors N, (d : ℤ) ≥ (N : ℤ) + 1 + (d : ℤ):= by
                --  calc
                --    (∑ d in Nat.divisors N, (d : ℤ)) ≥ ∑ d in {(1 : ℕ), N, d}, (d : ℤ) :=
                --      by
                --      apply Finset.sum_le_sum_of_subset_of_nonneg
                --      · intro x hx
                --        simp only [Finset.mem_insert, Finset.mem_singleton, Nat.mem_divisors] at hx ⊢
                --        aesop
                --      · intro x _ _
                --        simp
                --    _ = (1 : ℤ) + (N : ℤ) + (d : ℤ) := by
                --      simp [Finset.sum_pair, Finset.sum_singleton, hd₁, hd₂] <;> (try omega) <;> (try ring_nf) <;> (try norm_num) <;>
                --        (try omega)
                --    _ = (N : ℤ) + 1 + (d : ℤ) := by ring
                linarith
              have h₄₇ : (d : ℤ) > 1:= by
                have h₄₈ : d ≠ 1:= by -- tauto
                  omega
                have h₄₉ : d > 1:= by
                  --  by_contra h₄₉
                  have h₅₀ : d ≤ 1:= by -- omega
                    hole
                  have h₅₁ : d ≥ 1:=
                    by
                    have h₅₂ : d > 0:=
                      Nat.pos_of_dvd_of_pos
                        (by
                          have h₅₃ : d ∈ Nat.divisors N := hd
                          have h₅₄ : d ∣ N:= by
                            --  simp [Nat.mem_divisors] at h₅₃
                            --  exact h₅₃.1
                            omega
                      --      exact h₅₄)
                      --    (by omega)
                      hole
                    --  omega
                    linarith
                  have h₅₂ : d = 1:= by -- omega
                    linarith
                  --  tauto
                  omega
                --  exact_mod_cast h₄₉
                linarith
              --  nlinarith
              hole
            --  exact h₄₄
            hole
          --  linarith
          hole
        --  exact h₁₁
        hole
    --    linarith <;> norm_num at h₄ ⊢ <;> nlinarith
    hole
  have h₂ : ∃ m : ℤ, Odd m ∧ m ^ 2 = N:= by
    --  exfalso
    --  exact h₁
    norm_cast
  --  exact h₂
  hole