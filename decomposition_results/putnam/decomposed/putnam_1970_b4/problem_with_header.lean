import Mathlib

open Metric Set EuclideanGeometry Filter Topology

/--
Let $x : \mathbb{R} \to \mathbb{R}$ be a twice differentiable function satisfying $x(1) - x(0) = 1$, $x'(0) = x'(1) = 0$, and $|x'(t)| \le \frac{3}{2}$ for all $t \in (0, 1)$. Prove that there exists some $t \in [0, 1]$ such that $|x''(t)| \ge \frac{9}{2}$.
-/
theorem putnam_1970_b4
(x : ℝ → ℝ)
(hdiff : DifferentiableOn ℝ x (Set.Icc 0 1) ∧ DifferentiableOn ℝ (deriv x) (Set.Icc 0 1))
(hx : x 1 - x 0 = 1)
(hv : deriv x 0 = 0 ∧ deriv x 1 = 0)
(hs : ∀ t ∈ Set.Ioo 0 1, |deriv x t| ≤ 3/2)
: ∃ t ∈ Set.Icc 0 1, |(deriv (deriv x)) t| ≥ 9/2 := by
  have h1 : ∃ (c : ℝ), c ∈ Set.Ioo 0 1 ∧ deriv x c = 1 := by
    have h2 : ContinuousOn (deriv x) (Set.Icc 0 1) := by
      apply hdiff.2.continuousOn
    have h3 : ∃ c ∈ Set.Ioo 0 1, deriv x c = 1 := by
      -- Use the Mean Value Theorem to find a point c in (0, 1) where the derivative is 1
      have h4 : ContinuousOn x (Set.Icc 0 1) := hdiff.1.continuousOn
      have h5 : DifferentiableOn ℝ x (Set.Ioo 0 1) := hdiff.1.mono (Set.Ioo_subset_Icc_self)
      have h6 : ∃ c ∈ Set.Ioo 0 1, deriv x c = 1 := by
        -- Apply the Mean Value Theorem
        have h7 : ∃ c ∈ Set.Ioo 0 1, deriv x c = (x 1 - x 0) / (1 - 0) := by
          apply exists_deriv_eq_slope x
          <;> simp_all [hdiff.1, hdiff.2]
          <;> norm_num
          <;> linarith
        obtain ⟨c, hc, hc'⟩ := h7
        use c, hc
        norm_num [hx] at hc' ⊢
        <;> linarith
      exact h6
    obtain ⟨c, hc, hc'⟩ := h3
    exact ⟨c, hc, hc'⟩
  
  have h2 : ∃ (t : ℝ), t ∈ Set.Icc 0 1 ∧ |(deriv (deriv x)) t| ≥ 9/2 := by
    obtain ⟨c, hc, hc'⟩ := h1
    have h2 : c ∈ Set.Ioo 0 1 := hc
    have h3 : deriv x c = 1 := hc'
    have h4 : 0 < c := by exact h2.1
    have h5 : c < 1 := by exact h2.2
    by_cases h6 : c ≤ 2 / 9
    · -- Case: c ≤ 2 / 9
      have h7 : ∃ (a : ℝ), a ∈ Set.Ioo 0 c ∧ deriv (deriv x) a = 1 / c := by
        have h8 : ContinuousOn (deriv x) (Set.Icc 0 c) := by
          apply hdiff.2.continuousOn.mono
          exact Set.Icc_subset_Icc_right (by linarith)
        have h9 : DifferentiableOn ℝ (deriv x) (Set.Ioo 0 c) := by
          apply hdiff.2.mono
          exact Set.Ioo_subset_Icc_self.trans (Set.Icc_subset_Icc_right (by linarith))
        have h10 : ∃ a ∈ Set.Ioo 0 c, deriv (deriv x) a = (deriv x c - deriv x 0) / (c - 0) := by
          apply exists_deriv_eq_slope (deriv x)
          <;> simp_all [hdiff.1, hdiff.2, hv]
          <;> norm_num
          <;> linarith
        obtain ⟨a, ha, ha'⟩ := h10
        refine' ⟨a, ha, _⟩
        have h11 : deriv (deriv x) a = (deriv x c - deriv x 0) / (c - 0) := ha'
        rw [h11]
        have h12 : deriv x 0 = 0 := hv.1
        have h13 : deriv x c = 1 := hc'
        rw [h12, h13]
        <;> field_simp [sub_ne_zero.mpr (by linarith : (c : ℝ) ≠ 0)]
        <;> ring
        <;> norm_num
        <;> linarith
      obtain ⟨a, ha, ha'⟩ := h7
      have h8 : a ∈ Set.Ioo 0 c := ha
      have h9 : deriv (deriv x) a = 1 / c := ha'
      have h10 : 0 < a := by exact ha.1
      have h11 : a < c := by exact ha.2
      have h12 : 0 < c := by linarith
      have h13 : 1 / c ≥ 9 / 2 := by
        have h14 : c ≤ 2 / 9 := h6
        have h15 : 0 < c := by linarith
        have h16 : 1 / c ≥ 9 / 2 := by
          rw [ge_iff_le]
          rw [le_div_iff (by positivity)]
          nlinarith
        exact h16
      have h14 : |(deriv (deriv x)) a| ≥ 9 / 2 := by
        rw [h9]
        have h15 : 1 / c ≥ 9 / 2 := h13
        have h16 : |(1 / c : ℝ)| ≥ 9 / 2 := by
          have h17 : 1 / c > 0 := by positivity
          rw [abs_of_pos h17]
          linarith
        exact h16
      refine' ⟨a, ⟨by linarith [h8.1, h8.2], by linarith [h8.1, h8.2]⟩, _⟩
      exact h14
    · -- Case: c > 2 / 9
      have h7 : c ≥ 7 / 9 := by
        by_contra h8
        have h9 : c < 7 / 9 := by linarith
        have h10 : 2 / 9 < c := by linarith
        have h11 : c ∈ Set.Ioo 0 1 := h2
        have h12 : |deriv x c| ≤ 3 / 2 := hs c h11
        have h13 : deriv x c = 1 := hc'
        rw [h13] at h12
        norm_num [abs_le] at h12 ⊢
        <;> linarith
      have h8 : ∃ (b : ℝ), b ∈ Set.Ioo c 1 ∧ deriv (deriv x) b = -1 / (1 - c) := by
        have h9 : ContinuousOn (deriv x) (Set.Icc c 1) := by
          apply hdiff.2.continuousOn.mono
          exact Set.Icc_subset_Icc (by linarith) (by linarith)
        have h10 : DifferentiableOn ℝ (deriv x) (Set.Ioo c 1) := by
          apply hdiff.2.mono
          exact Set.Ioo_subset_Icc_self.trans (Set.Icc_subset_Icc (by linarith) (by linarith))
        have h11 : ∃ b ∈ Set.Ioo c 1, deriv (deriv x) b = (deriv x 1 - deriv x c) / (1 - c) := by
          apply exists_deriv_eq_slope (deriv x)
          <;> simp_all [hdiff.1, hdiff.2, hv]
          <;> norm_num
          <;> linarith
        obtain ⟨b, hb, hb'⟩ := h11
        refine' ⟨b, hb, _⟩
        have h12 : deriv (deriv x) b = (deriv x 1 - deriv x c) / (1 - c) := hb'
        rw [h12]
        have h13 : deriv x 1 = 0 := hv.2
        have h14 : deriv x c = 1 := hc'
        rw [h13, h14]
        <;> field_simp [sub_ne_zero.mpr (by linarith : (1 : ℝ) ≠ c)]
        <;> ring
        <;> norm_num
        <;> linarith
      obtain ⟨b, hb, hb'⟩ := h8
      have h9 : b ∈ Set.Ioo c 1 := hb
      have h10 : deriv (deriv x) b = -1 / (1 - c) := hb'
      have h11 : c < b := by exact h9.1
      have h12 : b < 1 := by exact h9.2
      have h13 : 1 - c > 0 := by linarith
      have h14 : -1 / (1 - c) ≤ -9 / 2 := by
        have h15 : c ≥ 7 / 9 := h7
        have h16 : 1 - c ≤ 2 / 9 := by linarith
        have h17 : -1 / (1 - c) ≤ -9 / 2 := by
          rw [div_le_iff_of_neg (by linarith)]
          nlinarith
        exact h17
      have h15 : |(deriv (deriv x)) b| ≥ 9 / 2 := by
        rw [h10]
        have h16 : -1 / (1 - c) ≤ -9 / 2 := h14
        have h17 : |(-1 / (1 - c) : ℝ)| ≥ 9 / 2 := by
          have h18 : -1 / (1 - c) < 0 := by
            apply div_neg_of_neg_of_pos
            · linarith
            · linarith
          rw [abs_of_neg h18]
          linarith
        exact h17
      refine' ⟨b, ⟨by linarith [hb.1, hb.2], by linarith [hb.1, hb.2]⟩, _⟩
      exact h15
  
  obtain ⟨t, ht, ht'⟩ := h2
  refine' ⟨t, ht, _⟩
  <;> simp_all
  <;> norm_num
  <;> linarith