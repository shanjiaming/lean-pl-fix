theorem h_main (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (hconv : ∃ r, sorry) : ∃ r, sorry :=
  by
  --  obtain ⟨r, h_tendsto⟩ := hconv
  have h₁ : ∀ n : ℕ, n ≥ 1 → 0 < p n := by sorry
  have h₂ : ∀ n : ℕ, n ≥ 1 → 0 < ∑ i in Finset.Icc 1 n, p i := by sorry
  have h₃ :
    BddAbove (Set.range (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2)) :=
    by
    have h₄ : ∃ S : ℝ, ∀ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) ≤ S :=
      by
      use (∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) + 1
      intro m
      have h₅ :
        ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≤
          (∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) + 1 :=
        by
        by_cases h₆ : m = 0
        · subst h₆
          simp [Finset.sum_Icc_succ_top] <;> norm_num <;> linarith [hpos 0]
        ·
          have h₇ : m ≥ 1 := by
            by_contra h₇
            have h₈ : m = 0 := by omega
            contradiction
          have h₈ : ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≥ 0 :=
            by
            apply Finset.sum_nonneg
            intro n hn
            have h₉ : 0 < p n := hpos n
            have h₁₀ : 0 < ∑ i in Finset.Icc 1 n, p i :=
              h₂ n
                (by
                  have h₁₁ : n ≥ 1 := by simp_all [Finset.mem_Icc] <;> omega
                  omega)
            have h₁₁ : 0 ≤ (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 :=
              by
              apply div_nonneg
              · exact mul_nonneg (le_of_lt h₉) (by positivity)
              · exact sq_nonneg _
            exact h₁₁
          have h₉ : ∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 = 0 := by
            simp [Finset.sum_Icc_succ_top] <;> norm_num <;> linarith [hpos 0]
          linarith
      exact h₅
    obtain ⟨S, hS⟩ := h₄
    refine' ⟨S, _⟩
    intro x hx
    rcases hx with ⟨m, rfl⟩
    exact hS m
  have h₄ :
    ∃ (r : ℝ),
      Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop (𝓝 r) := by sorry
  have h₃ : BddAbove (Set.range (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2)) := by sorry
have h_main :
  ∃ (r : ℝ),
    Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop (𝓝 r) :=
  by
  obtain ⟨r, h_tendsto⟩ := hconv
  have h₁ : ∀ n : ℕ, n ≥ 1 → 0 < p n := by sorry
  have h₂ : ∀ n : ℕ, n ≥ 1 → 0 < ∑ i in Finset.Icc 1 n, p i := by sorry
  have h₃ :
    BddAbove (Set.range (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2)) :=
    by
    have h₄ : ∃ S : ℝ, ∀ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) ≤ S :=
      by
      use (∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) + 1
      intro m
      have h₅ :
        ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≤
          (∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) + 1 :=
        by
        by_cases h₆ : m = 0
        · subst h₆
          simp [Finset.sum_Icc_succ_top] <;> norm_num <;> linarith [hpos 0]
        ·
          have h₇ : m ≥ 1 := by
            by_contra h₇
            have h₈ : m = 0 := by omega
            contradiction
          have h₈ : ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≥ 0 :=
            by
            apply Finset.sum_nonneg
            intro n hn
            have h₉ : 0 < p n := hpos n
            have h₁₀ : 0 < ∑ i in Finset.Icc 1 n, p i :=
              h₂ n
                (by
                  have h₁₁ : n ≥ 1 := by simp_all [Finset.mem_Icc] <;> omega
                  omega)
            have h₁₁ : 0 ≤ (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 :=
              by
              apply div_nonneg
              · exact mul_nonneg (le_of_lt h₉) (by positivity)
              · exact sq_nonneg _
            exact h₁₁
          have h₉ : ∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 = 0 := by
            simp [Finset.sum_Icc_succ_top] <;> norm_num <;> linarith [hpos 0]
          linarith
      exact h₅
    obtain ⟨S, hS⟩ := h₄
    refine' ⟨S, _⟩
    intro x hx
    rcases hx with ⟨m, rfl⟩
    exact hS m
  have h₄ :
    ∃ (r : ℝ),
      Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop (𝓝 r) :=
    by
    have h₅ : Monotone (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) :=
      by
      intro m n hmn
      have h₆ :
        ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≤
          ∑ n in Finset.Icc 1 n, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 :=
        by
        have h₇ :
          ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≤
            ∑ n in Finset.Icc 1 n, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 :=
          by
          have h₈ :
            ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≤
              ∑ n in Finset.Icc 1 n, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 :=
            by
            apply Finset.sum_le_sum_of_subset_of_nonneg
            · intro x hx
              simp_all [Finset.mem_Icc] <;> omega
            · intro x _ _
              have h₉ : 0 < p x := hpos x
              have h₁₀ : 0 < ∑ i in Finset.Icc 1 x, p i :=
                h₂ x
                  (by
                    have h₁₁ : x ≥ 1 := by simp_all [Finset.mem_Icc] <;> omega
                    omega)
              have h₁₁ : 0 ≤ (p x) * x ^ 2 / (∑ i in Finset.Icc 1 x, p i) ^ 2 :=
                by
                apply div_nonneg
                · exact mul_nonneg (le_of_lt h₉) (by positivity)
                · exact sq_nonneg _
              exact h₁₁
          exact h₈
        exact h₇
      exact h₆
    have h₆ :
      BddAbove (Set.range (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2)) := h₃
    have h₇ :
      ∃ (r : ℝ),
        Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop (𝓝 r) :=
      by
      have h₈ :
        ∃ (r : ℝ),
          Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop (𝓝 r) :=
        by
        refine' ⟨⨆ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 : ℝ), _⟩
        have h₉ :
          Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop
            (𝓝 (⨆ m : ℕ, (∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 : ℝ))) :=
          by
          apply tendsto_atTop_ciSup
          · exact h₅
          · exact h₆
        exact h₉
      exact h₈
    exact h₇
  exact h₄
  hole