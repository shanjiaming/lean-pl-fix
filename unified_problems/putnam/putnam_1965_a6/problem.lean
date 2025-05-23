theorem putnam_1965_a6
    (u v m : ℝ)
    (hu : 0 < u)
    (hv : 0 < v)
    (hm : 1 < m) :
    (∃ᵉ (x > 0) (y > 0),
      u * x + v * y = 1 ∧
      x ^ m + y ^ m = 1 ∧
      u = x ^ (m - 1) ∧
      v = y ^ (m - 1)) ↔
    ∃ n, u ^ n + v ^ n = 1 ∧ m⁻¹ + n⁻¹ = 1 :=
  by
  have h_main_forward : (∃ᵉ (x > 0) (y > 0), u * x + v * y = 1 ∧ x ^ m + y ^ m = 1 ∧ u = x ^ (m - 1) ∧ v = y ^ (m - 1)) → (∃ n, u ^ n + v ^ n = 1 ∧ m⁻¹ + n⁻¹ = 1) := by
    intro h
    rcases h with ⟨x, hx, y, hy, h1, h2, h3, h4⟩
    use m / (m - 1)
    have h5 : 0 < m - 1 := by linarith
    have h6 : 0 < m / (m - 1) := by positivity
    have h7 : m⁻¹ + (m / (m - 1))⁻¹ = 1 := by
      have h7₁ : (m : ℝ) ≠ 1 := by linarith
      have h7₂ : (m - 1 : ℝ) ≠ 0 := by linarith
      field_simp [h7₁, h7₂, sub_eq_zero, add_eq_zero_iff_eq_neg]
      <;> ring_nf
      <;> field_simp [h7₁, h7₂]
      <;> ring_nf
      <;> linarith
    have h8 : u ^ (m / (m - 1)) + v ^ (m / (m - 1)) = 1 := by
      have h9 : u = x ^ (m - 1) := by exact h3
      have h10 : v = y ^ (m - 1) := by exact h4
      have h11 : x ^ m + y ^ m = 1 := by exact h2
      have h12 : u * x + v * y = 1 := by exact h1
      have h13 : u ^ (m / (m - 1)) = x ^ m := by
        have h13₁ : u ^ (m / (m - 1)) = (x ^ (m - 1)) ^ (m / (m - 1)) := by rw [h9]
        rw [h13₁]
        have h13₂ : (x ^ (m - 1) : ℝ) > 0 := by positivity
        have h13₃ : (x ^ (m - 1) : ℝ) > 0 := by positivity
        have h13₄ : (x ^ (m - 1) : ℝ) ^ (m / (m - 1)) = x ^ ((m - 1) * (m / (m - 1))) := by
          rw [← Real.rpow_mul (by positivity)]
          <;> ring_nf
        rw [h13₄]
        have h13₅ : (m - 1 : ℝ) * (m / (m - 1)) = m := by
          have h13₅₁ : (m - 1 : ℝ) ≠ 0 := by linarith
          field_simp [h13₅₁]
          <;> ring_nf
          <;> linarith
        rw [h13₅]
        <;> simp [h9, h10, h2, h1]
        <;> ring_nf
        <;> simp_all
      have h14 : v ^ (m / (m - 1)) = y ^ m := by
        have h14₁ : v ^ (m / (m - 1)) = (y ^ (m - 1)) ^ (m / (m - 1)) := by rw [h10]
        rw [h14₁]
        have h14₂ : (y ^ (m - 1) : ℝ) > 0 := by positivity
        have h14₃ : (y ^ (m - 1) : ℝ) > 0 := by positivity
        have h14₄ : (y ^ (m - 1) : ℝ) ^ (m / (m - 1)) = y ^ ((m - 1) * (m / (m - 1))) := by
          rw [← Real.rpow_mul (by positivity)]
          <;> ring_nf
        rw [h14₄]
        have h14₅ : (m - 1 : ℝ) * (m / (m - 1)) = m := by
          have h14₅₁ : (m - 1 : ℝ) ≠ 0 := by linarith
          field_simp [h14₅₁]
          <;> ring_nf
          <;> linarith
        rw [h14₅]
        <;> simp [h9, h10, h2, h1]
        <;> ring_nf
        <;> simp_all
      calc
        u ^ (m / (m - 1)) + v ^ (m / (m - 1)) = x ^ m + y ^ m := by rw [h13, h14]
        _ = 1 := by rw [h2]
    exact ⟨h8, h7⟩
  
  have h_main_backward : (∃ n, u ^ n + v ^ n = 1 ∧ m⁻¹ + n⁻¹ = 1) → (∃ᵉ (x > 0) (y > 0), u * x + v * y = 1 ∧ x ^ m + y ^ m = 1 ∧ u = x ^ (m - 1) ∧ v = y ^ (m - 1)) := by
    rintro ⟨n, hn1, hn2⟩
    have h₁ : 0 < m - 1 := by linarith
    have h₂ : n = m / (m - 1) := by
      have h₃ : m⁻¹ + n⁻¹ = 1 := by assumption
      have h₄ : (m : ℝ) ≠ 1 := by linarith
      have h₅ : (m - 1 : ℝ) ≠ 0 := by linarith
      have h₆ : (n : ℝ) ≠ 0 := by
        by_contra h
        rw [h] at h₃
        norm_num at h₃ ⊢
        <;> field_simp [h₅] at h₃ ⊢ <;> nlinarith
      have h₇ : (m : ℝ) ≠ 0 := by linarith
      field_simp [h₄, h₅, h₆, h₇] at h₃ ⊢
      <;>
      (try ring_nf at h₃ ⊢) <;>
      (try nlinarith) <;>
      (try
        {
          nlinarith
        }) <;>
      (try
        {
          nlinarith
        })
      <;>
      (try
        {
          nlinarith
        })
    rw [h₂] at hn1
    have h₃ : 0 < u := by assumption
    have h₄ : 0 < v := by assumption
    have h₅ : 0 < m - 1 := by linarith
    have h₆ : 0 < m / (m - 1) := by positivity
    -- Define x and y as the (m-1)th roots of u and v respectively
    use u ^ (1 / (m - 1)), by
      -- Prove that x > 0
      apply Real.rpow_pos_of_pos h₃
    ,
      v ^ (1 / (m - 1)), by
        -- Prove that y > 0
        apply Real.rpow_pos_of_pos h₄
    ,
      by
        -- Prove that u * x + v * y = 1
        have h₇ : u * (u ^ (1 / (m - 1))) + v * (v ^ (1 / (m - 1))) = u ^ (m / (m - 1)) + v ^ (m / (m - 1)) := by
          have h₇₁ : u * (u ^ (1 / (m - 1))) = u ^ (1 + 1 / (m - 1)) := by
            rw [← Real.rpow_add (by positivity : (0 : ℝ) < u)]
            <;> ring_nf
          have h₇₂ : v * (v ^ (1 / (m - 1))) = v ^ (1 + 1 / (m - 1)) := by
            rw [← Real.rpow_add (by positivity : (0 : ℝ) < v)]
            <;> ring_nf
          have h₇₃ : (1 : ℝ) + 1 / (m - 1) = m / (m - 1) := by
            field_simp [h₁.ne']
            <;> ring_nf
            <;> field_simp [h₁.ne']
            <;> ring_nf
            <;> linarith
          rw [h₇₁, h₇₂, h₇₃]
          <;> ring_nf
        have h₈ : u ^ (m / (m - 1)) + v ^ (m / (m - 1)) = 1 := by simpa [h₂] using hn1
        calc
          u * (u ^ (1 / (m - 1))) + v * (v ^ (1 / (m - 1))) = u ^ (m / (m - 1)) + v ^ (m / (m - 1)) := by rw [h₇]
          _ = 1 := by rw [h₈]
    , by
      -- Prove that x ^ m + y ^ m = 1
      have h₇ : (u ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
      have h₈ : (v ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
      have h₉ : (u ^ (1 / (m - 1)) : ℝ) ^ m = u ^ (m / (m - 1)) := by
        have h₉₁ : (u ^ (1 / (m - 1)) : ℝ) ^ m = u ^ ((1 / (m - 1)) * m) := by
          rw [← Real.rpow_nat_cast]
          rw [← Real.rpow_mul (by positivity)]
          <;> ring_nf
        rw [h₉₁]
        have h₉₂ : (1 / (m - 1) : ℝ) * m = m / (m - 1) := by
          field_simp [h₁.ne']
          <;> ring_nf
          <;> field_simp [h₁.ne']
          <;> ring_nf
          <;> linarith
        rw [h₉₂]
        <;> ring_nf
      have h₁₀ : (v ^ (1 / (m - 1)) : ℝ) ^ m = v ^ (m / (m - 1)) := by
        have h₁₀₁ : (v ^ (1 / (m - 1)) : ℝ) ^ m = v ^ ((1 / (m - 1)) * m) := by
          rw [← Real.rpow_nat_cast]
          rw [← Real.rpow_mul (by positivity)]
          <;> ring_nf
        rw [h₁₀₁]
        have h₁₀₂ : (1 / (m - 1) : ℝ) * m = m / (m - 1) := by
          field_simp [h₁.ne']
          <;> ring_nf
          <;> field_simp [h₁.ne']
          <;> ring_nf
          <;> linarith
        rw [h₁₀₂]
        <;> ring_nf
      have h₁₁ : u ^ (m / (m - 1)) + v ^ (m / (m - 1)) = 1 := by simpa [h₂] using hn1
      calc
        (u ^ (1 / (m - 1)) : ℝ) ^ m + (v ^ (1 / (m - 1)) : ℝ) ^ m = u ^ (m / (m - 1)) + v ^ (m / (m - 1)) := by rw [h₉, h₁₀]
        _ = 1 := by rw [h₁₁]
    , by
      -- Prove that u = x ^ (m - 1)
      have h₇ : u = (u ^ (1 / (m - 1))) ^ (m - 1) := by
        have h₇₁ : (u ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
        have h₇₂ : (u ^ (1 / (m - 1)) : ℝ) ^ (m - 1) = u ^ ((1 / (m - 1)) * (m - 1)) := by
          rw [← Real.rpow_mul (by positivity)]
          <;> ring_nf
        rw [h₇₂]
        have h₇₃ : (1 / (m - 1) : ℝ) * (m - 1) = 1 := by
          field_simp [h₁.ne']
          <;> ring_nf
          <;> field_simp [h₁.ne']
          <;> ring_nf
          <;> linarith
        rw [h₇₃]
        <;> simp
        <;> ring_nf
        <;> simp_all
      rw [h₇]
    , by
      -- Prove that v = y ^ (m - 1)
      have h₇ : v = (v ^ (1 / (m - 1))) ^ (m - 1) := by
        have h₇₁ : (v ^ (1 / (m - 1)) : ℝ) > 0 := by positivity
        have h₇₂ : (v ^ (1 / (m - 1)) : ℝ) ^ (m - 1) = v ^ ((1 / (m - 1)) * (m - 1)) := by
          rw [← Real.rpow_mul (by positivity)]
          <;> ring_nf
        rw [h₇₂]
        have h₇₃ : (1 / (m - 1) : ℝ) * (m - 1) = 1 := by
          field_simp [h₁.ne']
          <;> ring_nf
          <;> field_simp [h₁.ne']
          <;> ring_nf
          <;> linarith
        rw [h₇₃]
        <;> simp
        <;> ring_nf
        <;> simp_all
      rw [h₇]
     ⟩
  
  have h_main : (∃ᵉ (x > 0) (y > 0), u * x + v * y = 1 ∧ x ^ m + y ^ m = 1 ∧ u = x ^ (m - 1) ∧ v = y ^ (m - 1)) ↔ (∃ n, u ^ n + v ^ n = 1 ∧ m⁻¹ + n⁻¹ = 1) := by
    constructor
    · -- Prove the forward direction: if there exist x, y > 0 such that ..., then there exists n such that ...
      intro h
      exact h_main_forward h
    · -- Prove the backward direction: if there exists n such that ..., then there exist x, y > 0 such that ...
      intro h
      exact h_main_backward h
  
  exact h_main