import Mathlib

-- 3987
/--
Find the smallest positive integer $n$ such that for every integer $m$ with $0<m<1993$, there exists an integer $k$ for which $\frac{m}{1993}<\frac{k}{n}<\frac{m+1}{1994}$.
-/
theorem putnam_1993_b1 :
    IsLeast
    {n : ℕ | 0 < n ∧
      ∀ m ∈ Set.Ioo (0 : ℤ) (1993), ∃ k : ℤ,
      (m / 1993 < (k : ℝ) / n) ∧ ((k : ℝ) / n < (m + 1) / 1994) }
    ((3987) : ℕ ) := by
  have h_main : IsLeast {n : ℕ | 0 < n ∧ ∀ m ∈ Set.Ioo (0 : ℤ) (1993), ∃ k : ℤ, (m / 1993 < (k : ℝ) / n) ∧ ((k : ℝ) / n < (m + 1) / 1994)} 3987 := by
    refine' ⟨⟨by norm_num, _⟩, _⟩
    · -- Prove that n = 3987 satisfies the condition
      intro m hm
      have h₁ : (m : ℤ) > 0 := by
        simp [Set.mem_Ioo] at hm
        linarith
      have h₂ : (m : ℤ) < 1993 := by
        simp [Set.mem_Ioo] at hm
        linarith
      have h₃ : (m : ℤ) < 1993 := by
        simp [Set.mem_Ioo] at hm
        linarith
      use 2 * m + 1
      constructor
      · -- Prove the first inequality: m / 1993 < (2 * m + 1 : ℝ) / 3987
        have h₄ : (m : ℝ) / 1993 < (2 * (m : ℝ) + 1) / 3987 := by
          have h₅ : (m : ℝ) < 1993 := by exact_mod_cast h₂
          have h₆ : (m : ℝ) > 0 := by exact_mod_cast h₁
          rw [div_lt_div_iff (by norm_num) (by norm_num)]
          ring_nf at h₅ h₆ ⊢
          nlinarith
        exact h₄
      · -- Prove the second inequality: (2 * m + 1 : ℝ) / 3987 < (m + 1) / 1994
        have h₄ : (2 * (m : ℝ) + 1) / 3987 < ((m : ℝ) + 1) / 1994 := by
          have h₅ : (m : ℝ) < 1993 := by exact_mod_cast h₂
          have h₆ : (m : ℝ) > 0 := by exact_mod_cast h₁
          rw [div_lt_div_iff (by norm_num) (by norm_num)]
          ring_nf at h₅ h₆ ⊢
          nlinarith
        exact h₄
    · -- Prove that n = 3987 is the smallest such number
      rintro n ⟨hn, hn'⟩
      by_contra h
      -- Assume n < 3987 and derive a contradiction
      have h₁ : n < 3987 := by
        omega
      have h₂ : n ≤ 3986 := by
        omega
      -- Use m = 1992 to show that no k exists for n ≤ 3986
      have h₃ := hn' 1992 (by
        norm_num [Set.mem_Ioo]
        <;> omega)
      obtain ⟨k, hk₁, hk₂⟩ := h₃
      have h₄ : (1992 : ℝ) / 1993 < (k : ℝ) / n := by
        exact hk₁
      have h₅ : (k : ℝ) / n < (1993 : ℝ) / 1994 := by
        norm_num at hk₂ ⊢
        <;>
        (try norm_num at hk₁ ⊢) <;>
        (try norm_num) <;>
        (try linarith) <;>
        (try
          {
            ring_nf at hk₁ hk₂ ⊢
            <;>
            norm_num at hk₁ hk₂ ⊢
            <;>
            linarith
          }) <;>
        (try
          {
            field_simp at hk₁ hk₂ ⊢
            <;>
            rw [← sub_pos] at hk₁ hk₂ ⊢
            <;>
            field_simp at hk₁ hk₂ ⊢
            <;>
            ring_nf at hk₁ hk₂ ⊢
            <;>
            norm_cast at hk₁ hk₂ ⊢
            <;>
            nlinarith
          })
        <;>
        (try
          {
            norm_num at hk₁ hk₂ ⊢
            <;>
            linarith
          })
      have h₆ : n ≤ 3986 := by
        omega
      have h₇ : n > 0 := by
        omega
      -- Derive a contradiction for n ≤ 3986
      have h₈ : (n : ℝ) > 0 := by
        exact_mod_cast h₇
      have h₉ : (n : ℝ) ≤ 3986 := by
        exact_mod_cast h₆
      have h₁₀ : (k : ℝ) < (n : ℝ) * (1993 : ℝ) / 1994 := by
        have h₁₁ : (k : ℝ) / n < (1993 : ℝ) / 1994 := by
          exact h₅
        have h₁₂ : (k : ℝ) < (n : ℝ) * (1993 : ℝ) / 1994 := by
          calc
            (k : ℝ) = (n : ℝ) * ((k : ℝ) / n) := by
              field_simp [h₈.ne']
              <;> ring
            _ < (n : ℝ) * ((1993 : ℝ) / 1994) := by
              gcongr
            _ = (n : ℝ) * (1993 : ℝ) / 1994 := by
              ring
        exact h₁₂
      have h₁₁ : (1992 : ℝ) / 1993 < (k : ℝ) / n := by
        exact h₄
      have h₁₂ : (k : ℝ) > (n : ℝ) * (1992 : ℝ) / 1993 := by
        have h₁₃ : (1992 : ℝ) / 1993 < (k : ℝ) / n := by
          exact h₄
        have h₁₄ : (k : ℝ) > (n : ℝ) * (1992 : ℝ) / 1993 := by
          calc
            (k : ℝ) = (n : ℝ) * ((k : ℝ) / n) := by
              field_simp [h₈.ne']
              <;> ring
            _ > (n : ℝ) * ((1992 : ℝ) / 1993) := by
              gcongr
            _ = (n : ℝ) * (1992 : ℝ) / 1993 := by
              ring
        exact h₁₄
      have h₁₃ : (k : ℝ) < (n : ℝ) * (1993 : ℝ) / 1994 := by
        exact h₁₀
      have h₁₄ : (k : ℝ) > (n : ℝ) * (1992 : ℝ) / 1993 := by
        exact h₁₂
      have h₁₅ : (n : ℝ) > 0 := by
        exact_mod_cast h₇
      have h₁₆ : (n : ℝ) ≤ 3986 := by
        exact_mod_cast h₆
      -- Use the fact that the interval is too small to contain an integer k
      have h₁₇ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 < 1 := by
        have h₁₈ : (n : ℝ) ≤ 3986 := by
          exact_mod_cast h₆
        have h₁₉ : (n : ℝ) > 0 := by
          exact_mod_cast h₇
        have h₂₀ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 < 1 := by
          have h₂₁ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 = (n : ℝ) * (1 / (1993 * 1994)) := by
            ring
            <;> field_simp
            <;> ring
            <;> norm_num
          rw [h₂₁]
          have h₂₂ : (n : ℝ) * (1 / (1993 * 1994 : ℝ)) < 1 := by
            have h₂₃ : (n : ℝ) ≤ 3986 := by
              exact_mod_cast h₆
            have h₂₄ : (n : ℝ) > 0 := by
              exact_mod_cast h₇
            calc
              (n : ℝ) * (1 / (1993 * 1994 : ℝ)) ≤ 3986 * (1 / (1993 * 1994 : ℝ)) := by gcongr
              _ < 1 := by
                norm_num
          exact h₂₂
        exact h₂₀
      -- Derive a contradiction
      have h₁₈ : False := by
        have h₁₉ : (k : ℝ) < (n : ℝ) * (1993 : ℝ) / 1994 := by
          exact h₁₀
        have h₂₀ : (k : ℝ) > (n : ℝ) * (1992 : ℝ) / 1993 := by
          exact h₁₂
        have h₂₁ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 < 1 := by
          exact h₁₇
        have h₂₂ : (k : ℤ) ≤ ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
          have h₂₃ : (k : ℝ) < (n : ℝ) * (1993 : ℝ) / 1994 := by
            exact h₁₀
          have h₂₄ : (k : ℤ) ≤ ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
            apply Int.le_floor.mpr
            norm_num at h₂₃ ⊢
            <;>
            (try norm_num) <;>
            (try linarith) <;>
            (try
              {
                ring_nf at h₂₃ ⊢
                <;>
                norm_num at h₂₃ ⊢
                <;>
                linarith
              }) <;>
            (try
              {
                field_simp at h₂₃ ⊢
                <;>
                rw [← sub_pos] at h₂₃ ⊢
                <;>
                field_simp at h₂₃ ⊢
                <;>
                ring_nf at h₂₃ ⊢
                <;>
                norm_cast at h₂₃ ⊢
                <;>
                nlinarith
              })
          exact h₂₄
        have h₂₃ : (k : ℤ) ≥ ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ := by
          have h₂₄ : (k : ℝ) > (n : ℝ) * (1992 : ℝ) / 1993 := by
            exact h₁₂
          have h₂₅ : (k : ℤ) ≥ ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ := by
            apply Int.le_ceil.mp
            norm_num at h₂₄ ⊢
            <;>
            (try norm_num) <;>
            (try linarith) <;>
            (try
              {
                ring_nf at h₂₄ ⊢
                <;>
                norm_num at h₂₄ ⊢
                <;>
                linarith
              }) <;>
            (try
              {
                field_simp at h₂₄ ⊢
                <;>
                rw [← sub_pos] at h₂₄ ⊢
                <;>
                field_simp at h₂₄ ⊢
                <;>
                ring_nf at h₂₄ ⊢
                <;>
                norm_cast at h₂₄ ⊢
                <;>
                nlinarith
              })
          exact h₂₅
        have h₂₄ : ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ > ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
          have h₂₅ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 < 1 := by
            exact h₁₇
          have h₂₆ : ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ > ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
            have h₂₇ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 < 1 := by
              exact h₁₇
            have h₂₈ : ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ > ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
              by_contra h₂₉
              have h₃₀ : ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ ≤ ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
                linarith
              have h₃₁ : (⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ : ℝ) ≤ (⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ : ℝ) := by
                exact_mod_cast h₃₀
              have h₃₂ : (⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ : ℝ) ≥ (n : ℝ) * (1992 : ℝ) / 1993 := by
                exact Int.le_ceil _
              have h₃₃ : (⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ : ℝ) ≤ (n : ℝ) * (1993 : ℝ) / 1994 := by
                exact Int.floor_le _
              have h₃₄ : (n : ℝ) * (1993 : ℝ) / 1994 - (n : ℝ) * (1992 : ℝ) / 1993 ≥ 1 := by
                linarith
              linarith
            exact h₂₈
          exact h₂₆
        have h₂₅ : (k : ℤ) ≤ ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
          exact h₂₂
        have h₂₆ : (k : ℤ) ≥ ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ := by
          exact h₂₃
        have h₂₇ : ⌈(n : ℝ) * (1992 : ℝ) / 1993⌉ > ⌊(n : ℝ) * (1993 : ℝ) / 1994⌋ := by
          exact h₂₄
        linarith
      exact h₁₈
    <;> simp_all
    <;> norm_num
    <;> linarith
  exact h_main