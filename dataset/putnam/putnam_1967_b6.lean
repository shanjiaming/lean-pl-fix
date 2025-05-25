theorem putnam_1967_b6
(f : ℝ → ℝ → ℝ)
(fdiff : (∀ y : ℝ, Differentiable ℝ (fun x : ℝ => f x y)) ∧ (∀ x : ℝ, Differentiable ℝ (fun y : ℝ => f x y)))
(fbound : ∀ x y : ℝ, (x ^ 2 + y ^ 2 ≤ 1) → |f x y| ≤ 1)
: ∃ x0 y0 : ℝ, (x0 ^ 2 + y0 ^ 2 < 1) ∧ ((deriv (fun x : ℝ => f x y0) x0) ^ 2 + (deriv (fun y : ℝ => f x0 y) y0) ^ 2 ≤ 16) := by
  have h_main : ∃ (x0 y0 : ℝ), (x0 ^ 2 + y0 ^ 2 < 1) ∧ ((deriv (fun x : ℝ => f x y0) x0) ^ 2 + (deriv (fun y : ℝ => f x0 y) y0) ^ 2 ≤ 16) := by
    use 0, 0
    constructor
    · -- Prove that (0,0) is in the interior of the unit circle
      norm_num
    · -- Prove the inequality for the derivatives at (0,0)
      have h1 : (deriv (fun x : ℝ => f x 0) 0) ^ 2 ≤ 4 := by
        have h2 : deriv (fun x : ℝ => f x 0) 0 ≤ 2 := by
          by_contra h
          have h3 : deriv (fun x : ℝ => f x 0) 0 > 2 := by linarith
          have h4 : deriv (fun x : ℝ => f x 0) 0 = deriv (fun x : ℝ => f x 0) 0 := rfl
          have h5 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Ioi 0), (f h 0 - f 0 0) / h > 2 := by
            have h6 : HasDerivAt (fun x : ℝ => f x 0) (deriv (fun x : ℝ => f x 0) 0) 0 := by
              have h7 : DifferentiableAt ℝ (fun x : ℝ => f x 0) 0 := by
                apply (fdiff.1 0) 0
              apply h7.hasDerivAt
            have h8 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
              have h9 : HasDerivAt (fun x : ℝ => f x 0) (deriv (fun x : ℝ => f x 0) 0) 0 := h6
              have h10 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
                have h11 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
                  have h12 : HasDerivAt (fun x : ℝ => f x 0) (deriv (fun x : ℝ => f x 0) 0) 0 := h6
                  have h13 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
                    convert h12.tendsto_slope_zero.restrict_to_Ioi using 1
                    <;> simp [sub_eq_add_neg]
                    <;> field_simp
                    <;> ring_nf
                  exact h13
                exact h11
              exact h10
            have h14 : deriv (fun x : ℝ => f x 0) 0 > 2 := h3
            have h15 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Ioi 0), (f h 0 - f 0 0) / h > 2 := by
              filter_upwards [tendsto_order.1 h8] with h hh using by
                linarith
            exact h15
          have h16 : ∃ (h : ℝ), 0 < h ∧ h ≤ 1 ∧ (f h 0 - f 0 0) / h > 2 := by
            have h17 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Ioi 0), (f h 0 - f 0 0) / h > 2 := h5
            have h18 : ∃ (h : ℝ), 0 < h ∧ h ≤ 1 ∧ (f h 0 - f 0 0) / h > 2 := by
              have h19 : ∃ (h : ℝ), h ∈ Ioc (0 : ℝ) 1 ∧ (f h 0 - f 0 0) / h > 2 := by
                have h20 : ∃ (h : ℝ), h ∈ Ioc (0 : ℝ) 1 ∧ (f h 0 - f 0 0) / h > 2 := by
                  filter_upwards [h5, self_mem_nhdsWithin] with h hh₁ hh₂ using by
                    have hh₃ : 0 < h := by exact hh₂
                    have hh₄ : (f h 0 - f 0 0) / h > 2 := hh₁
                    exact ⟨⟨hh₃, by linarith [hh₃]⟩, hh₄⟩
                  <;> simp_all [gt_iff_lt]
                  <;> norm_num at *
                  <;> linarith
                exact h20
              obtain ⟨h, ⟨h21, h22⟩, h23⟩ := h19
              refine' ⟨h, by linarith [h21], by linarith [h22], _⟩
              exact h23
            exact h18
          obtain ⟨h, h17, h18, h19⟩ := h16
          have h20 : 0 < h := h17
          have h21 : h ≤ 1 := h18
          have h22 : (f h 0 - f 0 0) / h > 2 := h19
          have h23 : 0 ≤ h := by linarith
          have h24 : h ≤ 1 := h21
          have h25 : (f h 0 - f 0 0) / h > 2 := h22
          have h26 : |f h 0| ≤ 1 := fbound h 0 (by
            have h27 : h ^ 2 + (0 : ℝ) ^ 2 ≤ 1 := by
              have h28 : h ≤ 1 := h21
              have h29 : 0 ≤ h := by linarith
              nlinarith
            exact h27)
          have h27 : |f 0 0| ≤ 1 := fbound 0 0 (by norm_num)
          have h28 : (f h 0 - f 0 0) / h > 2 := h25
          have h29 : |f h 0| ≤ 1 := h26
          have h30 : |f 0 0| ≤ 1 := h27
          have h31 : (f h 0 - f 0 0) ≤ 2 * h := by
            have h32 : (f h 0 - f 0 0) / h > 2 := h28
            have h33 : 0 < h := h20
            have h34 : (f h 0 - f 0 0) / h > 2 := h32
            have h35 : (f h 0 - f 0 0) > 2 * h := by
              have h36 : 0 < h := h20
              have h37 : (f h 0 - f 0 0) / h > 2 := h34
              have h38 : (f h 0 - f 0 0) > 2 * h := by
                by_contra h39
                have h40 : (f h 0 - f 0 0) ≤ 2 * h := by linarith
                have h41 : (f h 0 - f 0 0) / h ≤ 2 := by
                  have h42 : 0 < h := h20
                  have h43 : (f h 0 - f 0 0) ≤ 2 * h := h40
                  have h44 : (f h 0 - f 0 0) / h ≤ (2 * h) / h := by
                    apply div_le_div_of_le_of_nonneg
                    · linarith
                    · linarith
                  have h45 : (2 * h) / h = 2 := by
                    field_simp [h42.ne']
                    <;> ring_nf
                    <;> field_simp [h42.ne']
                    <;> linarith
                  rw [h45] at h44
                  linarith
                linarith
              exact h38
            linarith
          have h32 : (f h 0 - f 0 0) ≤ 2 * h := h31
          have h33 : (f h 0 - f 0 0) / h ≤ 2 := by
            have h34 : 0 < h := h20
            have h35 : (f h 0 - f 0 0) ≤ 2 * h := h32
            have h36 : (f h 0 - f 0 0) / h ≤ (2 * h) / h := by
              apply div_le_div_of_le_of_nonneg
              · linarith
              · linarith
            have h37 : (2 * h) / h = 2 := by
              field_simp [h34.ne']
              <;> ring_nf
              <;> field_simp [h34.ne']
              <;> linarith
            rw [h37] at h36
            linarith
          linarith
        
        have h3 : deriv (fun x : ℝ => f x 0) 0 ≥ -2 := by
          by_contra h4
          have h5 : deriv (fun x : ℝ => f x 0) 0 < -2 := by linarith
          have h6 : deriv (fun x : ℝ => f x 0) 0 = deriv (fun x : ℝ => f x 0) 0 := rfl
          have h7 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Iio 0), (f h 0 - f 0 0) / h < -2 := by
            have h8 : HasDerivAt (fun x : ℝ => f x 0) (deriv (fun x : ℝ => f x 0) 0) 0 := by
              have h9 : DifferentiableAt ℝ (fun x : ℝ => f x 0) 0 := by
                apply (fdiff.1 0) 0
              apply h9.hasDerivAt
            have h9 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
              have h10 : HasDerivAt (fun x : ℝ => f x 0) (deriv (fun x : ℝ => f x 0) 0) 0 := h8
              have h11 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
                have h12 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
                  have h13 : HasDerivAt (fun x : ℝ => f x 0) (deriv (fun x : ℝ => f x 0) 0) 0 := h8
                  have h14 : Tendsto (fun h : ℝ => (f h 0 - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun x : ℝ => f x 0) 0)) := by
                    convert h13.tendsto_slope_zero.restrict_to_Iio using 1
                    <;> simp [sub_eq_add_neg]
                    <;> field_simp
                    <;> ring_nf
                  exact h14
                exact h12
              exact h11
            have h10 : deriv (fun x : ℝ => f x 0) 0 < -2 := h5
            have h11 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Iio 0), (f h 0 - f 0 0) / h < -2 := by
              filter_upwards [tendsto_order.1 h9] with h hh using by
                linarith
            exact h11
          have h12 : ∃ (h : ℝ), h < 0 ∧ h ≥ -1 ∧ (f h 0 - f 0 0) / h < -2 := by
            have h13 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Iio 0), (f h 0 - f 0 0) / h < -2 := h7
            have h14 : ∃ (h : ℝ), h < 0 ∧ h ≥ -1 ∧ (f h 0 - f 0 0) / h < -2 := by
              have h15 : ∃ (h : ℝ), h ∈ Ioc (-1 : ℝ) 0 ∧ (f h 0 - f 0 0) / h < -2 := by
                have h16 : ∃ (h : ℝ), h ∈ Ioc (-1 : ℝ) 0 ∧ (f h 0 - f 0 0) / h < -2 := by
                  filter_upwards [h7, self_mem_nhdsWithin] with h hh₁ hh₂ using by
                    have hh₃ : h < 0 := by exact hh₂
                    have hh₄ : (f h 0 - f 0 0) / h < -2 := hh₁
                    exact ⟨⟨by linarith [hh₂], by linarith [hh₂]⟩, hh₄⟩
                  <;> simp_all [gt_iff_lt]
                  <;> norm_num at *
                  <;> linarith
                exact h16
              obtain ⟨h, ⟨h17, h18⟩, h19⟩ := h15
              refine' ⟨h, by linarith [h18], by linarith [h17], _⟩
              exact h19
            exact h14
          obtain ⟨h, h17, h18, h19⟩ := h12
          have h20 : h < 0 := h17
          have h21 : h ≥ -1 := h18
          have h22 : (f h 0 - f 0 0) / h < -2 := h19
          have h23 : h ≤ 0 := by linarith
          have h24 : h ≥ -1 := h21
          have h25 : (f h 0 - f 0 0) / h < -2 := h22
          have h26 : |f h 0| ≤ 1 := fbound h 0 (by
            have h27 : h ^ 2 + (0 : ℝ) ^ 2 ≤ 1 := by
              have h28 : h ≥ -1 := h21
              nlinarith
            exact h27)
          have h27 : |f 0 0| ≤ 1 := fbound 0 0 (by norm_num)
          have h28 : (f h 0 - f 0 0) / h < -2 := h25
          have h29 : |f h 0| ≤ 1 := h26
          have h30 : |f 0 0| ≤ 1 := h27
          have h31 : (f h 0 - f 0 0) ≥ -2 * h := by
            have h32 : (f h 0 - f 0 0) / h < -2 := h28
            have h33 : h < 0 := h20
            have h34 : (f h 0 - f 0 0) / h < -2 := h32
            have h35 : (f h 0 - f 0 0) > -2 * h := by
              by_contra h36
              have h37 : (f h 0 - f 0 0) ≤ -2 * h := by linarith
              have h38 : (f h 0 - f 0 0) / h ≥ -2 := by
                have h39 : h < 0 := h33
                have h40 : (f h 0 - f 0 0) ≤ -2 * h := h37
                have h41 : (f h 0 - f 0 0) / h ≥ (-2 * h) / h := by
                  have h42 : h < 0 := h33
                  have h43 : (f h 0 - f 0 0) ≤ -2 * h := h40
                  have h44 : (f h 0 - f 0 0) / h ≥ (-2 * h) / h := by
                    have h45 : h < 0 := h33
                    have h46 : (f h 0 - f 0 0) ≤ -2 * h := h40
                    have h47 : (f h 0 - f 0 0) / h ≥ (-2 * h) / h := by
                      rw [ge_iff_le]
                      rw [div_le_div_of_nonpos_of_le] <;> nlinarith
                    linarith
                  linarith
                have h45 : (-2 * h) / h = -2 := by
                  have h46 : h ≠ 0 := by linarith
                  field_simp [h46]
                  <;> ring_nf
                  <;> field_simp [h46]
                  <;> linarith
                rw [h45] at h41
                linarith
              linarith
            have h36 : (f h 0 - f 0 0) > -2 * h := h35
            nlinarith
          have h32 : (f h 0 - f 0 0) ≥ -2 * h := h31
          have h33 : (f h 0 - f 0 0) / h ≤ -2 := by
            have h34 : h < 0 := h20
            have h35 : (f h 0 - f 0 0) ≥ -2 * h := h32
            have h36 : (f h 0 - f 0 0) / h ≤ (-2 * h) / h := by
              apply div_le_div_of_nonpos_of_le
              <;> nlinarith
            have h37 : (-2 * h) / h = -2 := by
              have h38 : h ≠ 0 := by linarith
              field_simp [h38]
              <;> ring_nf
              <;> field_simp [h38]
              <;> linarith
            rw [h37] at h36
            linarith
          linarith
        
        have h4 : (deriv (fun x : ℝ => f x 0) 0) ^ 2 ≤ 4 := by
          have h5 : deriv (fun x : ℝ => f x 0) 0 ≤ 2 := h2
          have h6 : deriv (fun x : ℝ => f x 0) 0 ≥ -2 := h3
          have h7 : -2 ≤ deriv (fun x : ℝ => f x 0) 0 := by linarith
          have h8 : deriv (fun x : ℝ => f x 0) 0 ≤ 2 := by linarith
          nlinarith
        
        exact h4
      
      have h2 : (deriv (fun y : ℝ => f 0 y) 0) ^ 2 ≤ 4 := by
        have h3 : deriv (fun y : ℝ => f 0 y) 0 ≤ 2 := by
          by_contra h4
          have h5 : deriv (fun y : ℝ => f 0 y) 0 > 2 := by linarith
          have h6 : deriv (fun y : ℝ => f 0 y) 0 = deriv (fun y : ℝ => f 0 y) 0 := rfl
          have h7 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Ioi 0), (f 0 h - f 0 0) / h > 2 := by
            have h8 : HasDerivAt (fun y : ℝ => f 0 y) (deriv (fun y : ℝ => f 0 y) 0) 0 := by
              have h9 : DifferentiableAt ℝ (fun y : ℝ => f 0 y) 0 := by
                apply (fdiff.2 0) 0
              apply h9.hasDerivAt
            have h9 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
              have h10 : HasDerivAt (fun y : ℝ => f 0 y) (deriv (fun y : ℝ => f 0 y) 0) 0 := h8
              have h11 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
                have h12 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
                  have h13 : HasDerivAt (fun y : ℝ => f 0 y) (deriv (fun y : ℝ => f 0 y) 0) 0 := h8
                  have h14 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Ioi 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
                    convert h13.tendsto_slope_zero.restrict_to_Ioi using 1
                    <;> simp [sub_eq_add_neg]
                    <;> field_simp
                    <;> ring_nf
                  exact h14
                exact h12
              exact h11
            have h10 : deriv (fun y : ℝ => f 0 y) 0 > 2 := h5
            have h11 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Ioi 0), (f 0 h - f 0 0) / h > 2 := by
              filter_upwards [tendsto_order.1 h9] with h hh using by
                linarith
            exact h11
          have h12 : ∃ (h : ℝ), 0 < h ∧ h ≤ 1 ∧ (f 0 h - f 0 0) / h > 2 := by
            have h13 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Ioi 0), (f 0 h - f 0 0) / h > 2 := h7
            have h14 : ∃ (h : ℝ), 0 < h ∧ h ≤ 1 ∧ (f 0 h - f 0 0) / h > 2 := by
              have h15 : ∃ (h : ℝ), h ∈ Ioc (0 : ℝ) 1 ∧ (f 0 h - f 0 0) / h > 2 := by
                have h16 : ∃ (h : ℝ), h ∈ Ioc (0 : ℝ) 1 ∧ (f 0 h - f 0 0) / h > 2 := by
                  filter_upwards [h7, self_mem_nhdsWithin] with h hh₁ hh₂ using by
                    have hh₃ : 0 < h := by exact hh₂
                    have hh₄ : (f 0 h - f 0 0) / h > 2 := hh₁
                    exact ⟨⟨hh₃, by linarith [hh₃]⟩, hh₄⟩
                  <;> simp_all [gt_iff_lt]
                  <;> norm_num at *
                  <;> linarith
                exact h16
              obtain ⟨h, ⟨h17, h18⟩, h19⟩ := h15
              refine' ⟨h, by linarith [h17], by linarith [h18], _⟩
              exact h19
            exact h14
          obtain ⟨h, h17, h18, h19⟩ := h12
          have h20 : 0 < h := h17
          have h21 : h ≤ 1 := h18
          have h22 : (f 0 h - f 0 0) / h > 2 := h19
          have h23 : 0 ≤ h := by linarith
          have h24 : h ≤ 1 := h21
          have h25 : (f 0 h - f 0 0) / h > 2 := h22
          have h26 : |f 0 h| ≤ 1 := fbound 0 h (by
            have h27 : (0 : ℝ) ^ 2 + h ^ 2 ≤ 1 := by
              have h28 : h ≤ 1 := h21
              have h29 : 0 ≤ h := by linarith
              nlinarith
            exact h27)
          have h27 : |f 0 0| ≤ 1 := fbound 0 0 (by norm_num)
          have h28 : (f 0 h - f 0 0) / h > 2 := h25
          have h29 : |f 0 h| ≤ 1 := h26
          have h30 : |f 0 0| ≤ 1 := h27
          have h31 : (f 0 h - f 0 0) ≤ 2 * h := by
            have h32 : (f 0 h - f 0 0) / h > 2 := h28
            have h33 : 0 < h := h20
            have h34 : (f 0 h - f 0 0) / h > 2 := h32
            have h35 : (f 0 h - f 0 0) > 2 * h := by
              have h36 : 0 < h := h20
              have h37 : (f 0 h - f 0 0) / h > 2 := h34
              have h38 : (f 0 h - f 0 0) > 2 * h := by
                by_contra h39
                have h40 : (f 0 h - f 0 0) ≤ 2 * h := by linarith
                have h41 : (f 0 h - f 0 0) / h ≤ 2 := by
                  have h42 : 0 < h := h20
                  have h43 : (f 0 h - f 0 0) ≤ 2 * h := h40
                  have h44 : (f 0 h - f 0 0) / h ≤ (2 * h) / h := by
                    apply div_le_div_of_le_of_nonneg
                    · linarith
                    · linarith
                  have h45 : (2 * h) / h = 2 := by
                    field_simp [h42.ne']
                    <;> ring_nf
                    <;> field_simp [h42.ne']
                    <;> linarith
                  rw [h45] at h44
                  linarith
                linarith
              exact h38
            linarith
          have h32 : (f 0 h - f 0 0) ≤ 2 * h := h31
          have h33 : (f 0 h - f 0 0) / h ≤ 2 := by
            have h34 : 0 < h := h20
            have h35 : (f 0 h - f 0 0) ≤ 2 * h := h32
            have h36 : (f 0 h - f 0 0) / h ≤ (2 * h) / h := by
              apply div_le_div_of_le_of_nonneg
              · linarith
              · linarith
            have h37 : (2 * h) / h = 2 := by
              field_simp [h34.ne']
              <;> ring_nf
              <;> field_simp [h34.ne']
              <;> linarith
            rw [h37] at h36
            linarith
          linarith
        
        have h4 : deriv (fun y : ℝ => f 0 y) 0 ≥ -2 := by
          by_contra h5
          have h6 : deriv (fun y : ℝ => f 0 y) 0 < -2 := by linarith
          have h7 : deriv (fun y : ℝ => f 0 y) 0 = deriv (fun y : ℝ => f 0 y) 0 := rfl
          have h8 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Iio 0), (f 0 h - f 0 0) / h < -2 := by
            have h9 : HasDerivAt (fun y : ℝ => f 0 y) (deriv (fun y : ℝ => f 0 y) 0) 0 := by
              have h10 : DifferentiableAt ℝ (fun y : ℝ => f 0 y) 0 := by
                apply (fdiff.2 0) 0
              apply h10.hasDerivAt
            have h10 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
              have h11 : HasDerivAt (fun y : ℝ => f 0 y) (deriv (fun y : ℝ => f 0 y) 0) 0 := h9
              have h12 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
                have h13 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
                  have h14 : HasDerivAt (fun y : ℝ => f 0 y) (deriv (fun y : ℝ => f 0 y) 0) 0 := h9
                  have h15 : Tendsto (fun h : ℝ => (f 0 h - f 0 0) / h) (nhdsWithin (0 : ℝ) (Iio 0)) (𝓝 (deriv (fun y : ℝ => f 0 y) 0)) := by
                    convert h14.tendsto_slope_zero.restrict_to_Iio using 1
                    <;> simp [sub_eq_add_neg]
                    <;> field_simp
                    <;> ring_nf
                  exact h15
                exact h13
              exact h12
            have h11 : deriv (fun y : ℝ => f 0 y) 0 < -2 := h6
            have h12 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Iio 0), (f 0 h - f 0 0) / h < -2 := by
              filter_upwards [tendsto_order.1 h10] with h hh using by
                linarith
            exact h12
          have h13 : ∃ (h : ℝ), h < 0 ∧ h ≥ -1 ∧ (f 0 h - f 0 0) / h < -2 := by
            have h14 : ∀ᶠ (h : ℝ) in nhdsWithin (0 : ℝ) (Iio 0), (f 0 h - f 0 0) / h < -2 := h8
            have h15 : ∃ (h : ℝ), h < 0 ∧ h ≥ -1 ∧ (f 0 h - f 0 0) / h < -2 := by
              have h16 : ∃ (h : ℝ), h ∈ Ioc (-1 : ℝ) 0 ∧ (f 0 h - f 0 0) / h < -2 := by
                have h17 : ∃ (h : ℝ), h ∈ Ioc (-1 : ℝ) 0 ∧ (f 0 h - f 0 0) / h < -2 := by
                  filter_upwards [h8, self_mem_nhdsWithin] with h hh₁ hh₂ using by
                    have hh₃ : h < 0 := by exact hh₂
                    have hh₄ : (f 0 h - f 0 0) / h < -2 := hh₁
                    exact ⟨⟨by linarith [hh₂], by linarith [hh₂]⟩, hh₄⟩
                  <;> simp_all [gt_iff_lt]
                  <;> norm_num at *
                  <;> linarith
                exact h17
              obtain ⟨h, ⟨h18, h19⟩, h20⟩ := h16
              refine' ⟨h, by linarith [h19], by linarith [h18], _⟩
              exact h20
            exact h15
          obtain ⟨h, h18, h19, h20⟩ := h13
          have h21 : h < 0 := h18
          have h22 : h ≥ -1 := h19
          have h23 : (f 0 h - f 0 0) / h < -2 := h20
          have h24 : h ≤ 0 := by linarith
          have h25 : h ≥ -1 := h22
          have h26 : (f 0 h - f 0 0) / h < -2 := h23
          have h27 : |f 0 h| ≤ 1 := fbound 0 h (by
            have h28 : (0 : ℝ) ^ 2 + h ^ 2 ≤ 1 := by
              have h29 : h ≥ -1 := h22
              nlinarith
            exact h28)
          have h28 : |f 0 0| ≤ 1 := fbound 0 0 (by norm_num)
          have h29 : (f 0 h - f 0 0) / h < -2 := h26
          have h30 : |f 0 h| ≤ 1 := h27
          have h31 : |f 0 0| ≤ 1 := h28
          have h32 : (f 0 h - f 0 0) ≥ -2 * h := by
            have h33 : (f 0 h - f 0 0) / h < -2 := h29
            have h34 : h < 0 := h21
            have h35 : (f 0 h - f 0 0) / h < -2 := h33
            have h36 : (f 0 h - f 0 0) > -2 * h := by
              by_contra h37
              have h38 : (f 0 h - f 0 0) ≤ -2 * h := by linarith
              have h39 : (f 0 h - f 0 0) / h ≥ -2 := by
                have h40 : h < 0 := h34
                have h41 : (f 0 h - f 0 0) ≤ -2 * h := h38
                have h42 : (f 0 h - f 0 0) / h ≥ (-2 * h) / h := by
                  have h43 : h < 0 := h34
                  have h44 : (f 0 h - f 0 0) ≤ -2 * h := h41
                  have h45 : (f 0 h - f 0 0) / h ≥ (-2 * h) / h := by
                    have h46 : h < 0 := h34
                    have h47 : (f 0 h - f 0 0) ≤ -2 * h := h44
                    have h48 : (f 0 h - f 0 0) / h ≥ (-2 * h) / h := by
                      rw [ge_iff_le]
                      rw [div_le_div_of_nonpos_of_le] <;> nlinarith
                    linarith
                  linarith
                have h46 : (-2 * h) / h = -2 := by
                  have h47 : h ≠ 0 := by linarith
                  field_simp [h47]
                  <;> ring_nf
                  <;> field_simp [h47]
                  <;> linarith
                rw [h46] at h42
                linarith
              linarith
            have h37 : (f 0 h - f 0 0) > -2 * h := h36
            nlinarith
          have h38 : (f 0 h - f 0 0) ≥ -2 * h := h32
          have h39 : (f 0 h - f 0 0) / h ≤ -2 := by
            have h40 : h < 0 := h21
            have h41 : (f 0 h - f 0 0) ≥ -2 * h := h38
            have h42 : (f 0 h - f 0 0) / h ≤ (-2 * h) / h := by
              apply div_le_div_of_nonpos_of_le
              <;> nlinarith
            have h43 : (-2 * h) / h = -2 := by
              have h44 : h ≠ 0 := by linarith
              field_simp [h44]
              <;> ring_nf
              <;> field_simp [h44]
              <;> linarith
            rw [h43] at h42
            linarith
          linarith
        
        have h5 : (deriv (fun y : ℝ => f 0 y) 0) ^ 2 ≤ 4 := by
          have h6 : deriv (fun y : ℝ => f 0 y) 0 ≤ 2 := h3
          have h7 : deriv (fun y : ℝ => f 0 y) 0 ≥ -2 := h4
          have h8 : -2 ≤ deriv (fun y : ℝ => f 0 y) 0 := by linarith
          have h9 : deriv (fun y : ℝ => f 0 y) 0 ≤ 2 := by linarith
          nlinarith
        
        exact h5
      
      have h3 : (deriv (fun x : ℝ => f x 0) 0) ^ 2 + (deriv (fun y : ℝ => f 0 y) 0) ^ 2 ≤ 16 := by
        have h4 : (deriv (fun x : ℝ => f x 0) 0) ^ 2 ≤ 4 := h1
        have h5 : (deriv (fun y : ℝ => f 0 y) 0) ^ 2 ≤ 4 := h2
        linarith
      
      simpa [add_assoc] using h3
  
  exact h_main