theorem h₂ (h :  ∀ (b : ℕ → ℕ) (x : ℕ → ℝ),    BijOn b (Ici 1) (Ici 1) →      StrictAntiOn (fun n => |x n|) (Ici 1) →        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) : ∃ b x,
    BijOn b (Ici 1) (Ici 1) ∧
      StrictAntiOn (fun n => |x n|) (Ici 1) ∧
        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) ∧
          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) ∧
            ¬Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1) :=
  by
  use fun n => n + 1
  use fun n => if n = 1 then 2 else if n = 2 then -1 else 0
  constructor
  · refine' ⟨fun n hn => by simp_all [Nat.lt_succ_iff], fun n hn => _, _⟩
    · simp_all [Nat.lt_succ_iff] <;> omega
    · rintro n hn
      simp_all [Nat.lt_succ_iff] <;> (try omega) <;>
        (try {use n - 1 <;> simp_all [Nat.lt_succ_iff] <;> omega
          })
  · constructor
    · intro n hn m hm hnm
      simp_all [Nat.lt_succ_iff, abs_of_nonneg, abs_of_nonpos, Finset.mem_Icc] <;>
          (try {split_ifs at * <;> norm_num at * <;> (try omega) <;> (try linarith)
            }) <;>
        (try {norm_num at * <;> omega
          })
    · constructor
      ·
        have h₃ :
          Tendsto
            (fun n : ℕ => |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)|)
            atTop (𝓝 0) := by sorry
        simpa using h₃
      · constructor
        ·
          have h₄ :
            Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0)) atTop
              (𝓝 1) := by sorry
          have h₅ :
            ¬Tendsto
                (fun n : ℕ =>
                  ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                atTop (𝓝 1) := by sorry
          simpa using h₅
        ·
          have h₅ :
            ¬Tendsto
                (fun n : ℕ =>
                  ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                atTop (𝓝 1) :=
            by
            have h₆ :
              ∀ n : ℕ,
                n ≥ 1 →
                  ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) =
                    (0 : ℝ) :=
              by
              intro n hn
              have h₇ : n ≥ 1 := hn
              have h₈ :
                ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) =
                  (0 : ℝ) :=
                by
                have h₉ :
                  ∀ k : ℕ,
                    k ∈ Finset.Icc 1 n →
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) = 0 :=
                  by
                  intro k hk
                  have h₁₀ : k ∈ Finset.Icc 1 n := hk
                  have h₁₁ : 1 ≤ k := by
                    simp [Finset.mem_Icc] at h₁₀
                    linarith
                  have h₁₂ : k ≤ n := by
                    simp [Finset.mem_Icc] at h₁₀
                    linarith
                  have h₁₃ : (k + 1 : ℕ) ≠ 1 := by omega
                  have h₁₄ : (k + 1 : ℕ) ≠ 2 := by omega
                  simp [h₁₃, h₁₄]
                have h₁₅ :
                  ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) =
                    ∑ k in Finset.Icc 1 n, 0 :=
                  by
                  apply Finset.sum_congr rfl
                  intro x hx
                  rw [h₉ x hx]
                have h₁₆ : ∑ k in Finset.Icc 1 n, (0 : ℝ) = 0 := by simp
                rw [h₁₅]
                rw [h₁₆] <;> simp
              exact h₈
            have h₉ :
              Tendsto
                (fun n : ℕ =>
                  ∑ k in Finset.Icc 1 n, (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                atTop (𝓝 0) :=
              by
              have h₁₀ :
                ∀ᶠ (n : ℕ) in atTop,
                  ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0) =
                    (0 : ℝ) :=
                by
                filter_upwards [eventually_ge_atTop 1] with n hn
                exact h₆ n hn
              have h₁₁ : Tendsto (fun n : ℕ => (0 : ℝ)) atTop (𝓝 0) := by simpa using tendsto_const_nhds
              have h₁₂ :
                Tendsto
                  (fun n : ℕ =>
                    ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                  atTop (𝓝 0) :=
                by apply Tendsto.congr' h₁₀ h₁₁
              exact h₁₂
            have h₁₃ :
              ¬Tendsto
                  (fun n : ℕ =>
                    ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                  atTop (𝓝 1) :=
              by
              intro h₁₄
              have h₁₅ :
                Tendsto
                  (fun n : ℕ =>
                    ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                  atTop (𝓝 1) :=
                h₁₄
              have h₁₆ :
                Tendsto
                  (fun n : ℕ =>
                    ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                  atTop (𝓝 0) :=
                h₉
              have h₁₇ : (1 : ℝ) ≠ (0 : ℝ) := by norm_num
              have h₁₈ :
                Filter.Tendsto
                  (fun n : ℕ =>
                    ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                  atTop (𝓝 (1 : ℝ)) :=
                h₁₅
              have h₁₉ :
                Filter.Tendsto
                  (fun n : ℕ =>
                    ∑ k in Finset.Icc 1 n,
                      (if (k + 1 : ℕ) = 1 then (2 : ℝ) else if (k + 1 : ℕ) = 2 then (-1 : ℝ) else 0))
                  atTop (𝓝 (0 : ℝ)) :=
                h₉
              have h₂₀ := tendsto_nhds_unique h₁₈ h₁₉
              norm_num at h₂₀ <;> simp_all
            exact h₁₃
          simpa using h₅