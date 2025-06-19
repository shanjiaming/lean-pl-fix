theorem putnam_1982_a6 :
  (∀ b : ℕ → ℕ,
    ∀ x : ℕ → ℝ,
      BijOn b (Ici 1) (Ici 1) →
      StrictAntiOn (fun n : ℕ => |x n|) (Ici 1) →
      Tendsto (fun n : ℕ => |b n - (n : ℤ)| * |x n|) atTop (𝓝 0) →
      Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x k) atTop (𝓝 1) →
      Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x (b k)) atTop (𝓝 1))
  ↔ ((False) : Prop ) := by
  have h₁ : ((∀ b : ℕ → ℕ, ∀ x : ℕ → ℝ, BijOn b (Ici 1) (Ici 1) → StrictAntiOn (fun n : ℕ => |x n|) (Ici 1) → Tendsto (fun n : ℕ => |b n - (n : ℤ)| * |x n|) atTop (𝓝 0) → Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x k) atTop (𝓝 1) → Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) ↔ False) := by
    apply Iff.intro
    · intro h
      have h₂ : ∃ (b : ℕ → ℕ) (x : ℕ → ℝ), BijOn b (Ici 1) (Ici 1) ∧ StrictAntiOn (fun n : ℕ => |x n|) (Ici 1) ∧ Tendsto (fun n : ℕ => |b n - (n : ℤ)| * |x n|) atTop (𝓝 0) ∧ Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x k) atTop (𝓝 1) ∧ ¬Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, x (b k)) atTop (𝓝 1) := by
        
        use fun n => n + 1
        use fun n => if n = 1 then 2 else if n = 2 then -1 else 0
        constructor
        · 
          refine' ⟨fun n hn => by simp_all [Nat.lt_succ_iff], fun n hn => _, _⟩
          · 
            simp_all [Nat.lt_succ_iff]
            <;> omega
          · 
            rintro n hn
            simp_all [Nat.lt_succ_iff]
            <;>
            (try omega) <;>
            (try
              {
                use n - 1
                <;>
                simp_all [Nat.lt_succ_iff]
                <;>
                omega
              })
        · constructor
          · 
            intro n hn m hm hnm
            simp_all [Nat.lt_succ_iff, abs_of_nonneg, abs_of_nonpos, Finset.mem_Icc]
            <;>
            (try
              {
                split_ifs at * <;>
                norm_num at * <;>
                (try omega) <;>
                (try linarith)
              }) <;>
            (try
              {
                norm_num at *
                <;>
                omega
              })
          · constructor
            · 
              have h₃ : Tendsto (fun n : ℕ => |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)|) atTop (𝓝 0) := by
                have h₄ : ∀ n : ℕ, (n : ℤ) ≥ 1 → |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by
                  norm_num
                have h₅ : ∀ n : ℕ, (n : ℤ) ≥ 1 → (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by
                  norm_num
                have h₆ : ∀ n : ℕ, (n : ℤ) ≥ 1 → |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (1 : ℝ) else (0 : ℝ) := by
                  admit
                have h₇ : Tendsto (fun n : ℕ => |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)|) atTop (𝓝 0) := by
                  have h₈ : ∀ n : ℕ, (n : ℕ) ≥ 3 → |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = 0 := by
                    intro n hn
                    have h₉ : (n : ℕ) ≥ 3 := hn
                    have h₁₀ : (n : ℤ) ≥ 1 := by
                      linarith
                    have h₁₁ : |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by
                      norm_num
                    have h₁₂ : (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by
                      norm_num
                    have h₁₃ : |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (1 : ℝ) else (0 : ℝ) := by
                      admit
                    have h₁₄ : (n : ℕ) ≠ 1 := by linarith
                    have h₁₅ : (n : ℕ) ≠ 2 := by linarith
                    admit
                  have h₁₆ : ∀ n : ℕ, (n : ℕ) ≥ 3 → |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = 0 := by
                    admit
                  have h₁₇ : Tendsto (fun n : ℕ => |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)|) atTop (𝓝 0) := by
                    have h₁₈ : ∀ᶠ (n : ℕ) in atTop, |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| = (0 : ℝ) := by
                      admit
                    have h₁₉ : Tendsto (fun n : ℕ => (0 : ℝ)) atTop (𝓝 0) := by
                      norm_num
                    have h₂₀ : Tendsto (fun n : ℕ => |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)|) atTop (𝓝 0) := by
                      admit
                    admit
                  admit
                admit
              simpa using h₃
            · constructor
              · 
                have h₄ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := by
                  have h₅ : ∀ n : ℕ, n ≥ 2 → ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (1 : ℝ) := by
                    intro n hn
                    have h₆ : n ≥ 2 := hn
                    have h₇ : ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (if (1 : ℕ) = 1 then (2 : ℝ) else if (1 : ℕ) = 2 then (-1 : ℝ) else 0) + (if (2 : ℕ) = 1 then (2 : ℝ) else if (2 : ℕ) = 2 then (-1 : ℝ) else 0) + ∑ k in Finset.Icc 3 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) := by
                      have h₈ : ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) := rfl
                      rw [h₈]
                      have h₉ : ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (if (1 : ℕ) = 1 then (2 : ℝ) else if (1 : ℕ) = 2 then (-1 : ℝ) else 0) + (if (2 : ℕ) = 1 then (2 : ℝ) else if (2 : ℕ) = 2 then (-1 : ℝ) else 0) + ∑ k in Finset.Icc 3 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) := by
                        have h₁₀ : ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (if (1 : ℕ) = 1 then (2 : ℝ) else if (1 : ℕ) = 2 then (-1 : ℝ) else 0) + (if (2 : ℕ) = 1 then (2 : ℝ) else if (2 : ℕ) = 2 then (-1 : ℝ) else 0) + ∑ k in Finset.Icc 3 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) := by
                          have h₁₁ : ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) := rfl
                          admit
                        linarith
                      linarith
                    rw [h₇]
                    have h₈ : ∑ k in Finset.Icc 3 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = 0 := by
                      have h₉ : ∑ k in Finset.Icc 3 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = 0 := by
                        have h₁₀ : ∀ k, k ∈ Finset.Icc 3 n → (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = 0 := by
                          intro k hk
                          have h₁₁ : k ∈ Finset.Icc 3 n := hk
                          have h₁₂ : 3 ≤ k := by
                            admit
                          have h₁₃ : k ≠ 1 := by linarith
                          have h₁₄ : k ≠ 2 := by linarith
                          admit
                        admit
                      linarith
                    admit
                have h₅ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := by
                  have h₆ : ∀ n : ℕ, n ≥ 2 → ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (1 : ℝ) := by
                    intro n hn
                    have h₇ : n ≥ 2 := hn
                    have h₈ : ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (1 : ℝ) := by
                      admit
                    linarith
                  have h₉ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := by
                    have h₁₀ : ∀ᶠ (n : ℕ) in atTop, ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (1 : ℝ) := by
                      admit
                    have h₁₁ : Tendsto (fun n : ℕ => (1 : ℝ)) atTop (𝓝 1) := by
                      norm_num
                    have h₁₂ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := by
                      simpa
                    simpa
                  simpa
                simpa using h₅
              · 
                have h₅ : ¬Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := by
                  have h₆ : ∀ n : ℕ, n ≥ 1 → ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) = (0 : ℝ) := by
                    intro n hn
                    have h₇ : n ≥ 1 := hn
                    have h₈ : ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) = (0 : ℝ) := by
                      have h₉ : ∀ k : ℕ, k ∈ Finset.Icc 1 n → (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) = 0 := by
                        intro k hk
                        have h₁₀ : k ∈ Finset.Icc 1 n := hk
                        have h₁₁ : 1 ≤ k := by
                          admit
                        have h₁₂ : k ≤ n := by
                          admit
                        have h₁₃ : (k + 1 : ℕ) ≠ 1 := by
                          linarith
                        have h₁₄ : (k + 1 : ℕ) ≠ 2 := by
                          admit
                        admit
                      have h₁₅ : ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) = ∑ k in Finset.Icc 1 n, 0 := by
                        admit
                      have h₁₆ : ∑ k in Finset.Icc 1 n, (0 : ℝ) = 0 := by
                        norm_num
                      linarith
                    linarith
                  have h₉ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 0) := by
                    have h₁₀ : ∀ᶠ (n : ℕ) in atTop, ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) = (0 : ℝ) := by
                      admit
                    have h₁₁ : Tendsto (fun n : ℕ => (0 : ℝ)) atTop (𝓝 0) := by
                      norm_num
                    have h₁₂ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 0) := by
                      admit
                    admit
                  have h₁₃ : ¬Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := by
                    intro h₁₄
                    have h₁₅ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 1) := h₁₄
                    have h₁₆ : Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 0) := h₉
                    have h₁₇ : (1 : ℝ) ≠ (0 : ℝ) := by norm_num
                    have h₁₈ : Filter.Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 (1 : ℝ)) := h₁₅
                    have h₁₉ : Filter.Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0)) atTop (𝓝 (0 : ℝ)) := h₉
                    have h₂₀ := tendsto_nhds_unique h₁₈ h₁₉
                    linarith
                  admit
                admit
      
      rcases h₂ with ⟨b, x, hb, hx₁, hx₂, hx₃, hx₄⟩
      have h₃ := h b x hb hx₁ hx₂ hx₃
      norm_cast
  admit
