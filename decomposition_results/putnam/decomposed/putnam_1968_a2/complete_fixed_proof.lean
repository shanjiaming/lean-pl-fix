theorem putnam_1968_a2 (a b c d e f : ℤ) (ε : ℝ) (hne : a * d ≠ b * c) (hε : ε > 0) :
  ∃ r s : ℚ, (|r * a + s * b - e| : ℝ) ∈ Set.Ioo 0 ε ∧ (|r * c + s * d - f| : ℝ) ∈ Set.Ioo 0 ε:=
  by
  have h_main : ∃ (r s : ℚ), (|r * a + s * b - e| : ℝ) ∈ Set.Ioo 0 ε ∧ (|r * c + s * d - f| : ℝ) ∈ Set.Ioo 0 ε:=
    by
    have h₁ : (a : ℝ) * d ≠ (b : ℝ) * c:= by -- norm_cast <;> exact hne
      omega
    --  set M := (abs a + abs b + abs c + abs d : ℝ) + 1 with hM_def
    have hM_pos : 0 < M:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) : 0 < M := by -- positivity
      hole
    --  set δ := ε / (4 * M) with hδ_def
    have hδ_pos : 0 < δ:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_pos : 0 < M) (δ : ℝ := ε / (4 * M)) (hδ_def : δ = ε / (4 * M)) : 0 < δ := by -- positivity
      hole
    have h₂ : (a : ℝ) * d - (b : ℝ) * c ≠ 0:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_pos : 0 < M) (δ : ℝ := ε / (4 * M)) (hδ_def : δ = ε / (4 * M)) (hδ_pos : 0 < δ) : ↑a * ↑d - ↑b * ↑c ≠ 0 := by
      --  intro h
      --  apply h₁
      --  linarith
      omega
    --  set r₁ := ((e + ε / 2 : ℝ) * d - (f + ε / 2 : ℝ) * b) / (a * d - b * c : ℝ) with hr₁_def
    --  set s₁ := ((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) / (a * d - b * c : ℝ) with hs₁_def
    have h₃ : ∃ (r : ℚ), |(r : ℝ) - r₁| < δ:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_pos : 0 < M) (δ : ℝ := ε / (4 * M)) (hδ_def : δ = ε / (4 * M)) (hδ_pos : 0 < δ) (h₂ : ↑a * ↑d - ↑b * ↑c ≠ 0) (r₁ : ℝ := ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (hr₁_def : r₁ = ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (s₁ : ℝ := (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (hs₁_def : s₁ = (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) : ∃ r, |↑r - r₁| < δ :=
      by
      --  obtain ⟨q, hq⟩ := exists_rat_near (α := r₁) (by positivity : 0 < (δ : ℝ))
      refine' ⟨q, _⟩
      simpa [abs_sub_lt_iff] using hq
      hole
    have h₄ : ∃ (s : ℚ), |(s : ℝ) - s₁| < δ:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_pos : 0 < M) (δ : ℝ := ε / (4 * M)) (hδ_def : δ = ε / (4 * M)) (hδ_pos : 0 < δ) (h₂ : ↑a * ↑d - ↑b * ↑c ≠ 0) (r₁ : ℝ := ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (hr₁_def : r₁ = ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (s₁ : ℝ := (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (hs₁_def : s₁ = (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (h₃ : ∃ r, |↑r - r₁| < δ) : ∃ s, |↑s - s₁| < δ :=
      by
      --  obtain ⟨q, hq⟩ := exists_rat_near (α := s₁) (by positivity : 0 < (δ : ℝ))
      refine' ⟨q, _⟩
      simpa [abs_sub_lt_iff] using hq
      hole
    --  obtain ⟨r, hr⟩ := h₃
    --  obtain ⟨s, hs⟩ := h₄
    --  refine' ⟨r, s, _, _⟩
    ·
      have h₅ : |(r : ℝ) * a + (s : ℝ) * b - e| ∈ Set.Ioo 0 ε:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_pos : 0 < M) (δ : ℝ := ε / (4 * M)) (hδ_def : δ = ε / (4 * M)) (hδ_pos : 0 < δ) (h₂ : ↑a * ↑d - ↑b * ↑c ≠ 0) (r₁ : ℝ := ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (hr₁_def : r₁ = ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (s₁ : ℝ := (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (hs₁_def : s₁ = (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (r : ℚ) (hr : |↑r - r₁| < δ) (s : ℚ) (hs : |↑s - s₁| < δ) : |↑r * ↑a + ↑s * ↑b - ↑e| ∈ Set.Ioo 0 ε :=
        by
        have h₅₁ : |(r : ℝ) * a + (s : ℝ) * b - e - ε / 2| < ε / 4:= ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_def : M = ↑|a| + ↑|b| + ↑|c| + ↑|d| + 1) (hM_pos : 0 < M) (δ : ℝ := ε / (4 * M)) (hδ_def : δ = ε / (4 * M)) (hδ_pos : 0 < δ) (h₂ : ↑a * ↑d - ↑b * ↑c ≠ 0) (r₁ : ℝ := ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (hr₁_def : r₁ = ((↑e + ε / 2) * ↑d - (↑f + ε / 2) * ↑b) / (↑a * ↑d - ↑b * ↑c)) (s₁ : ℝ := (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (hs₁_def : s₁ = (↑a * (↑f + ε / 2) - ↑c * (↑e + ε / 2)) / (↑a * ↑d - ↑b * ↑c)) (r : ℚ) (hr : |↑r - r₁| < δ) (s : ℚ) (hs : |↑s - s₁| < δ) : |↑r * ↑a + ↑s * ↑b - ↑e - ε / 2| < ε / 4 := by
          --  calc
          --    |(r : ℝ) * a + (s : ℝ) * b - e - ε / 2| = |(r : ℝ) * a + (s : ℝ) * b - e - ε / 2| := rfl
          --    _ = |((r : ℝ) - r₁) * a + ((s : ℝ) - s₁) * b| :=
          --      by
          --      have h₅₂ : (r₁ : ℝ) * a + s₁ * b - e - ε / 2 = 0 := by
          --        calc
          --          (r₁ : ℝ) * a + s₁ * b - e - ε / 2 =
          --              ((e + ε / 2 : ℝ) * d - (f + ε / 2 : ℝ) * b) / (a * d - b * c : ℝ) * a +
          --                    (((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) / (a * d - b * c : ℝ)) * b -
          --                  e -
          --                ε / 2 :=
          --            by rw [hr₁_def, hs₁_def]
          --          _ =
          --              ((e + ε / 2 : ℝ) * d - (f + ε / 2 : ℝ) * b) * a / (a * d - b * c : ℝ) +
          --                    ((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) * b / (a * d - b * c : ℝ) -
          --                  e -
          --                ε / 2 :=
          --            by ring_nf
          --          _ =
          --              ((e + ε / 2 : ℝ) * d * a - (f + ε / 2 : ℝ) * b * a + ((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) * b) /
          --                    (a * d - b * c : ℝ) -
          --                  e -
          --                ε / 2 :=
          --            by field_simp [h₂] <;> ring_nf
          --          _ =
          --              ((e + ε / 2 : ℝ) * d * a - (f + ε / 2 : ℝ) * b * a + (a : ℝ) * (f + ε / 2) * b - c * (e + ε / 2) * b) /
          --                    (a * d - b * c : ℝ) -
          --                  e -
          --                ε / 2 :=
          --            by ring_nf
          --          _ = ((e + ε / 2 : ℝ) * d * a - c * (e + ε / 2) * b) / (a * d - b * c : ℝ) - e - ε / 2 := by ring_nf
          --          _ = ((e + ε / 2 : ℝ) * (d * a - c * b)) / (a * d - b * c : ℝ) - e - ε / 2 := by ring_nf
          --          _ = ((e + ε / 2 : ℝ) * (a * d - b * c)) / (a * d - b * c : ℝ) - e - ε / 2 := by
          --            ring_nf <;> field_simp [h₂] <;> ring_nf
          --          _ = (e + ε / 2 : ℝ) - e - ε / 2 := by
          --            by_cases h₅₃ : (a * d - b * c : ℝ) = 0
          --            · exfalso
          --              apply h₂
          --              linarith
          --            · field_simp [h₅₃] <;> ring_nf
          --          _ = 0 := by ring
          --      have h₅₄ : (r : ℝ) * a + (s : ℝ) * b - e - ε / 2 = ((r : ℝ) - r₁) * a + ((s : ℝ) - s₁) * b := by linarith
          --      rw [h₅₄]
          --    _ ≤ |((r : ℝ) - r₁) * a| + |((s : ℝ) - s₁) * b| := (abs_add _ _)
          --    _ = |(r : ℝ) - r₁| * |(a : ℝ)| + |(s : ℝ) - s₁| * |(b : ℝ)| := by simp [abs_mul, abs_mul]
          --    _ < δ * |(a : ℝ)| + δ * |(b : ℝ)| := by
          --      gcongr <;> simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;> norm_num <;> linarith
          --    _ ≤ δ * (|(a : ℝ)| + |(b : ℝ)|) := by ring_nf <;> nlinarith
          --    _ < ε / 4 :=
          --      by
          --      have h₅₅ : (δ : ℝ) * (|(a : ℝ)| + |(b : ℝ)|) ≤ (δ : ℝ) * M := by
          --        gcongr <;> (try norm_num) <;>
          --                (try linarith [abs_nonneg (a : ℝ), abs_nonneg (b : ℝ), abs_nonneg (c : ℝ), abs_nonneg (d : ℝ)]) <;>
          --              (try simp_all [hM_def, hδ_def, M]) <;>
          --            (try norm_num) <;>
          --          (try linarith)
          --      calc
          --        (δ : ℝ) * (|(a : ℝ)| + |(b : ℝ)|) ≤ (δ : ℝ) * M := h₅₅
          --        _ = (ε / (4 * M) : ℝ) * M := by rw [hδ_def]
          --        _ = (ε / 4 : ℝ) := by field_simp [hM_pos.ne'] <;> ring_nf <;> field_simp [hM_pos.ne'] <;> ring_nf
          --        _ < ε / 4 := by linarith [hε]
          --    _ = ε / 4 := by norm_num
          --    _ = ε / 4 := by norm_num
          hole
        have h₅₂ : (|(r : ℝ) * a + (s : ℝ) * b - e| : ℝ) ∈ Set.Ioo 0 ε :=
          by
          have h₅₃ : |(r : ℝ) * a + (s : ℝ) * b - e - ε / 2| < ε / 4 := h₅₁
          have h₅₄ : (|(r : ℝ) * a + (s : ℝ) * b - e| : ℝ) ∈ Set.Ioo 0 ε :=
            by
            have h₅₅ : (|(r : ℝ) * a + (s : ℝ) * b - e| : ℝ) > 0 :=
              by
              by_contra h₅₅
              have h₅₆ : |(r : ℝ) * a + (s : ℝ) * b - e| ≤ 0 := by linarith
              have h₅₇ : (r : ℝ) * a + (s : ℝ) * b - e = 0 := by
                cases' abs_cases ((r : ℝ) * a + (s : ℝ) * b - e) with h₅₈ h₅₈ <;> linarith
              have h₅₈ : |(r : ℝ) * a + (s : ℝ) * b - e - ε / 2| = ε / 2 :=
                by
                rw [h₅₇]
                norm_num [abs_of_pos, hε] <;> linarith
              linarith
            have h₅₆ : (|(r : ℝ) * a + (s : ℝ) * b - e| : ℝ) < ε :=
              by
              have h₅₇ : |(r : ℝ) * a + (s : ℝ) * b - e - ε / 2| < ε / 4 := h₅₁
              have h₅₈ : |(r : ℝ) * a + (s : ℝ) * b - e| < ε := by
                cases' abs_cases ((r : ℝ) * a + (s : ℝ) * b - e - ε / 2) with h₅₉ h₅₉ <;>
                    cases' abs_cases ((r : ℝ) * a + (s : ℝ) * b - e) with h₆₀ h₆₀ <;>
                  linarith
              exact h₅₈
            exact Set.mem_Ioo.mpr ⟨h₅₅, h₅₆⟩
          exact h₅₄
        --  exact h₅₂
        hole
    --    exact by simpa [Rat.cast_add, Rat.cast_mul, Rat.cast_sub] using h₅
    ·
      have h₅ : |(r : ℝ) * c + (s : ℝ) * d - f| ∈ Set.Ioo 0 ε :=
        by
        have h₅₁ : |(r : ℝ) * c + (s : ℝ) * d - f - ε / 2| < ε / 4 := by
          calc
            |(r : ℝ) * c + (s : ℝ) * d - f - ε / 2| = |(r : ℝ) * c + (s : ℝ) * d - f - ε / 2| := rfl
            _ = |((r : ℝ) - r₁) * c + ((s : ℝ) - s₁) * d| :=
              by
              have h₅₂ : (r₁ : ℝ) * c + s₁ * d - f - ε / 2 = 0 := by
                calc
                  (r₁ : ℝ) * c + s₁ * d - f - ε / 2 =
                      ((e + ε / 2 : ℝ) * d - (f + ε / 2 : ℝ) * b) / (a * d - b * c : ℝ) * c +
                            (((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) / (a * d - b * c : ℝ)) * d -
                          f -
                        ε / 2 :=
                    by rw [hr₁_def, hs₁_def]
                  _ =
                      ((e + ε / 2 : ℝ) * d - (f + ε / 2 : ℝ) * b) * c / (a * d - b * c : ℝ) +
                            ((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) * d / (a * d - b * c : ℝ) -
                          f -
                        ε / 2 :=
                    by ring_nf
                  _ =
                      ((e + ε / 2 : ℝ) * d * c - (f + ε / 2 : ℝ) * b * c +
                              ((a : ℝ) * (f + ε / 2) - c * (e + ε / 2)) * d) /
                            (a * d - b * c : ℝ) -
                          f -
                        ε / 2 :=
                    by field_simp [h₂] <;> ring_nf
                  _ =
                      ((e + ε / 2 : ℝ) * d * c - (f + ε / 2 : ℝ) * b * c + (a : ℝ) * (f + ε / 2) * d -
                              c * (e + ε / 2) * d) /
                            (a * d - b * c : ℝ) -
                          f -
                        ε / 2 :=
                    by ring_nf
                  _ =
                      ((e + ε / 2 : ℝ) * d * c - c * (e + ε / 2) * d) / (a * d - b * c : ℝ) - f - ε / 2 +
                        ((a : ℝ) * (f + ε / 2) * d - (f + ε / 2 : ℝ) * b * c) / (a * d - b * c : ℝ) :=
                    by ring_nf
                  _ = 0 - f - ε / 2 + ((a : ℝ) * (f + ε / 2) * d - (f + ε / 2 : ℝ) * b * c) / (a * d - b * c : ℝ) := by
                    ring_nf
                  _ = 0 :=
                    by
                    have h₅₃ : ((a : ℝ) * (f + ε / 2) * d - (f + ε / 2 : ℝ) * b * c) / (a * d - b * c : ℝ) = f + ε / 2 :=
                      by
                      have h₅₄ : (a : ℝ) * d - (b : ℝ) * c ≠ 0 := by
                        intro h₅₄
                        apply h₂
                        linarith
                      field_simp [h₅₄] <;> ring_nf <;> field_simp [h₅₄] <;> ring_nf
                    rw [h₅₃] <;> ring_nf
              have h₅₄ : (r : ℝ) * c + (s : ℝ) * d - f - ε / 2 = ((r : ℝ) - r₁) * c + ((s : ℝ) - s₁) * d := by linarith
              rw [h₅₄]
            _ ≤ |((r : ℝ) - r₁) * c| + |((s : ℝ) - s₁) * d| := (abs_add _ _)
            _ = |(r : ℝ) - r₁| * |(c : ℝ)| + |(s : ℝ) - s₁| * |(d : ℝ)| := by simp [abs_mul, abs_mul]
            _ < δ * |(c : ℝ)| + δ * |(d : ℝ)| := by
              gcongr <;> simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;> norm_num <;> linarith
            _ ≤ δ * (|(c : ℝ)| + |(d : ℝ)|) := by ring_nf <;> nlinarith
            _ < ε / 4 :=
              by
              have h₅₅ : (δ : ℝ) * (|(c : ℝ)| + |(d : ℝ)|) ≤ (δ : ℝ) * M := by
                gcongr <;> (try norm_num) <;>
                        (try
                            linarith [abs_nonneg (c : ℝ), abs_nonneg (d : ℝ), abs_nonneg (a : ℝ), abs_nonneg (b : ℝ)]) <;>
                      (try simp_all [hM_def, hδ_def, M]) <;>
                    (try norm_num) <;>
                  (try linarith)
              calc
                (δ : ℝ) * (|(c : ℝ)| + |(d : ℝ)|) ≤ (δ : ℝ) * M := h₅₅
                _ = (ε / (4 * M) : ℝ) * M := by rw [hδ_def]
                _ = (ε / 4 : ℝ) := by field_simp [hM_pos.ne'] <;> ring_nf <;> field_simp [hM_pos.ne'] <;> ring_nf
                _ < ε / 4 := by linarith [hε]
                _ = ε / 4 := by norm_num
            _ = ε / 4 := by norm_num
            _ = ε / 4 := by norm_num
        have h₅₂ : (|(r : ℝ) * c + (s : ℝ) * d - f| : ℝ) ∈ Set.Ioo 0 ε :=
          by
          have h₅₃ : |(r : ℝ) * c + (s : ℝ) * d - f - ε / 2| < ε / 4 := h₅₁
          have h₅₄ : (|(r : ℝ) * c + (s : ℝ) * d - f| : ℝ) ∈ Set.Ioo 0 ε :=
            by
            have h₅₅ : (|(r : ℝ) * c + (s : ℝ) * d - f| : ℝ) > 0 :=
              by
              by_contra h₅₅
              have h₅₆ : |(r : ℝ) * c + (s : ℝ) * d - f| ≤ 0 := by linarith
              have h₅₇ : (r : ℝ) * c + (s : ℝ) * d - f = 0 := by
                cases' abs_cases ((r : ℝ) * c + (s : ℝ) * d - f) with h₅₈ h₅₈ <;> linarith
              have h₅₈ : |(r : ℝ) * c + (s : ℝ) * d - f - ε / 2| = ε / 2 :=
                by
                rw [h₅₇]
                norm_num [abs_of_pos, hε] <;> linarith
              linarith
            have h₅₆ : (|(r : ℝ) * c + (s : ℝ) * d - f| : ℝ) < ε :=
              by
              have h₅₇ : |(r : ℝ) * c + (s : ℝ) * d - f - ε / 2| < ε / 4 := h₅₁
              have h₅₈ : |(r : ℝ) * c + (s : ℝ) * d - f| < ε := by
                cases' abs_cases ((r : ℝ) * c + (s : ℝ) * d - f - ε / 2) with h₅₉ h₅₉ <;>
                    cases' abs_cases ((r : ℝ) * c + (s : ℝ) * d - f) with h₆₀ h₆₀ <;>
                  linarith
              exact h₅₈
            exact Set.mem_Ioo.mpr ⟨h₅₅, h₅₆⟩
          exact h₅₄
        exact h₅₂
      exact by simpa [Rat.cast_add, Rat.cast_mul, Rat.cast_sub] using h₅
    hole
  --  exact h_main
  hole