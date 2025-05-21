theorem integral_over_triangular_prism :(∫⁻ (p : ℝ × ℝ × ℝ) in {p : ℝ × ℝ × ℝ | p.1 ∈ Set.Icc 0 5 ∧ p.2.1 ∈ Set.Icc 0 1 ∧
  p.2.2 ∈ Set.Icc 0 1 ∧ p.2.1 + p.2.2 ≤ 1}, ENNReal.ofReal p.2.2) = 5 / 6 := by
  have h_main : (∫⁻ (p : ℝ × ℝ × ℝ) in {p : ℝ × ℝ × ℝ | p.1 ∈ Set.Icc 0 5 ∧ p.2.1 ∈ Set.Icc 0 1 ∧ p.2.2 ∈ Set.Icc 0 1 ∧ p.2.1 + p.2.2 ≤ 1}, ENNReal.ofReal p.2.2) = 5 / 6 := by
    -- Use Fubini's theorem to split the integral into iterated integrals
    have h1 : (∫⁻ (p : ℝ × ℝ × ℝ) in {p : ℝ × ℝ × ℝ | p.1 ∈ Set.Icc 0 5 ∧ p.2.1 ∈ Set.Icc 0 1 ∧ p.2.2 ∈ Set.Icc 0 1 ∧ p.2.1 + p.2.2 ≤ 1}, ENNReal.ofReal p.2.2) = ∫⁻ x in (Set.Icc (0 : ℝ) 5), ∫⁻ y in (Set.Icc (0 : ℝ) 1), ∫⁻ z in (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1}, ENNReal.ofReal z ∂volume ∂volume ∂volume := by
      -- Prove that the integral can be split into iterated integrals
      have h1 : (∫⁻ (p : ℝ × ℝ × ℝ) in {p : ℝ × ℝ × ℝ | p.1 ∈ Set.Icc 0 5 ∧ p.2.1 ∈ Set.Icc 0 1 ∧ p.2.2 ∈ Set.Icc 0 1 ∧ p.2.1 + p.2.2 ≤ 1}, ENNReal.ofReal p.2.2) = ∫⁻ x in (Set.Icc (0 : ℝ) 5), ∫⁻ y in (Set.Icc (0 : ℝ) 1), ∫⁻ z in (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1}, ENNReal.ofReal z ∂volume ∂volume ∂volume := by
        -- Use the fact that the measure is the product measure of the Lebesgue measures on ℝ, ℝ, and ℝ
        rw [← lintegral_map' (MeasurableEquiv.prodAssoc _ _ _).measurable (by measurability)]
        -- Simplify the expression using the properties of the product measure
        <;> simp_all [MeasurableEquiv.prodAssoc, volume_Icc, Real.volume_Icc, Real.volume_Icc]
        <;> rw [lintegral_lintegral_lintegral_meas_eq_prod_prod_prod] <;>
          simp_all [volume_Icc, Real.volume_Icc, Real.volume_Icc]
        <;> congr 1 <;> ext1 x <;> congr 1 <;> ext1 y <;> congr 1 <;> ext1 z <;>
          simp [Set.Icc, Set.mem_setOf_eq, Set.mem_inter_iff, Set.mem_Icc, Set.mem_Icc, Set.mem_Icc]
        <;>
          by_cases hx : 0 ≤ x <;> by_cases hx' : x ≤ 5 <;> by_cases hy : 0 ≤ y <;> by_cases hy' : y ≤ 1 <;> by_cases hz : 0 ≤ z <;> by_cases hz' : z ≤ 1 <;> by_cases h : y + z ≤ 1 <;> simp_all [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt] <;>
            norm_num <;>
            (try { contradiction }) <;>
            (try { linarith }) <;>
            (try { ring_nf at * <;> norm_num at * <;> linarith })
      exact h1
    rw [h1]
    -- Evaluate the innermost integral
    have h2 : ∀ (x : ℝ), x ∈ Set.Icc (0 : ℝ) 5 → ∀ (y : ℝ), y ∈ Set.Icc (0 : ℝ) 1 → (∫⁻ z in (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1}, ENNReal.ofReal z ∂volume) = ENNReal.ofReal ((1 - y) ^ 2 / 2) := by
      intro x hx y hy
      have h3 : y ∈ Set.Icc (0 : ℝ) 1 := hy
      have h4 : 0 ≤ y := by exact h3.1
      have h5 : y ≤ 1 := by exact h3.2
      have h6 : (∫⁻ z in (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1}, ENNReal.ofReal z ∂volume) = ENNReal.ofReal ((1 - y) ^ 2 / 2) := by
        have h7 : (∫⁻ z in (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1}, ENNReal.ofReal z ∂volume) = ∫⁻ z in Set.Icc (0 : ℝ) (1 - y), ENNReal.ofReal z ∂volume := by
          have h8 : (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1} = Set.Icc (0 : ℝ) (1 - y) := by
            ext1 z
            simp only [Set.mem_inter_iff, Set.mem_setOf_eq, Set.mem_Icc]
            constructor
            · intro h
              constructor
              · linarith [h.1.1, h.1.2, h.2]
              · have h9 : y + z ≤ 1 := by simpa using h.2
                have h10 : z ≤ 1 - y := by linarith
                linarith
            · intro h
              constructor
              · constructor <;> linarith [h.1, h.2, h4, h5]
              · have h9 : z ≤ 1 - y := by simpa using h.2
                have h10 : y + z ≤ 1 := by linarith
                exact h10
          rw [h8]
          <;> simp [volume_Icc, Real.volume_Icc, Real.volume_Icc]
          <;> ring_nf
          <;> simp_all [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
          <;> norm_num
          <;> linarith
        rw [h7]
        have h9 : (∫⁻ z in Set.Icc (0 : ℝ) (1 - y), ENNReal.ofReal z ∂volume) = ENNReal.ofReal ((1 - y) ^ 2 / 2) := by
          have h10 : (∫⁻ z in Set.Icc (0 : ℝ) (1 - y), ENNReal.ofReal z ∂volume) = ENNReal.ofReal (∫ z in Set.Icc (0 : ℝ) (1 - y), z ∂volume) := by
            rw [← ofReal_integral_eq_lintegral_ofReal]
            <;> simp [volume_Icc, Real.volume_Icc, Real.volume_Icc]
            <;> norm_num
            <;>
              (try
                {
                  exact Continuous.continuousOn (by continuity)
                })
            <;>
              (try
                {
                  exact (continuous_id.continuousOn)
                })
            <;>
              (try
                {
                  exact (continuous_const.continuousOn)
                })
            <;>
              (try
                {
                  exact (continuous_const.continuousOn)
                })
            <;>
              (try
                {
                  exact (continuous_const.continuousOn)
                })
            <;>
              (try
                {
                  exact (continuous_const.continuousOn)
                })
          rw [h10]
          have h11 : (∫ z in Set.Icc (0 : ℝ) (1 - y), z ∂volume) = (1 - y) ^ 2 / 2 := by
            have h12 : (∫ z in Set.Icc (0 : ℝ) (1 - y), z ∂volume) = (∫ z in Set.Icc (0 : ℝ) (1 - y), z ∂volume) := rfl
            rw [h12]
            have h13 : y ≤ 1 := by linarith
            have h14 : 0 ≤ 1 - y := by linarith
            have h15 : (∫ z in Set.Icc (0 : ℝ) (1 - y), z ∂volume) = (1 - y) ^ 2 / 2 := by
              -- Use the power rule for integration
              have h16 : (∫ z in Set.Icc (0 : ℝ) (1 - y), z ∂volume) = (∫ z in (0 : ℝ)..(1 - y), z) := by
                simp [volume_Icc, Real.volume_Icc, Real.volume_Icc]
                <;>
                  (try
                    {
                      simp_all [Set.Icc, Real.volume_Icc, Real.volume_Icc]
                      <;>
                        norm_num
                      <;>
                        linarith
                    })
              rw [h16]
              -- Evaluate the integral
              have h17 : (∫ z in (0 : ℝ)..(1 - y), z) = (1 - y) ^ 2 / 2 := by
                -- Use the power rule for integration
                have h18 : (∫ z in (0 : ℝ)..(1 - y), z) = (1 - y) ^ 2 / 2 := by
                  -- Use the power rule for integration
                  norm_num [mul_comm]
                  <;>
                    ring_nf
                  <;>
                    field_simp
                  <;>
                    ring_nf
                  <;>
                    norm_num
                  <;>
                    linarith
                rw [h18]
              rw [h17]
            rw [h15]
          rw [h11]
          <;> simp [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
          <;> norm_num
          <;> linarith
        rw [h9]
        <;> simp [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
        <;> norm_num
        <;> linarith
      exact h6
    have h3 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), ∫⁻ y in (Set.Icc (0 : ℝ) 1), ∫⁻ z in (Set.Icc (0 : ℝ) 1) ∩ {z | y + z ≤ 1}, ENNReal.ofReal z ∂volume ∂volume ∂volume) = ∫⁻ x in (Set.Icc (0 : ℝ) 5), ∫⁻ y in (Set.Icc (0 : ℝ) 1), ENNReal.ofReal ((1 - y) ^ 2 / 2) ∂volume ∂volume := by
      apply lintegral_congr_ae
      filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx using by
        apply lintegral_congr_ae
        filter_upwards [ae_restrict_mem measurableSet_Icc] with y hy using by
          rw [h2 x hx y hy]
    rw [h3]
    have h4 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), ∫⁻ y in (Set.Icc (0 : ℝ) 1), ENNReal.ofReal ((1 - y) ^ 2 / 2) ∂volume ∂volume) = (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) := by
      have h5 : (∫⁻ y in (Set.Icc (0 : ℝ) 1), ENNReal.ofReal ((1 - y) ^ 2 / 2) ∂volume) = ENNReal.ofReal (1 / 6) := by
        have h6 : (∫⁻ y in (Set.Icc (0 : ℝ) 1), ENNReal.ofReal ((1 - y) ^ 2 / 2) ∂volume) = ENNReal.ofReal (∫ y in (Set.Icc (0 : ℝ) 1), ((1 - y) ^ 2 / 2 : ℝ) ∂volume) := by
          rw [← ofReal_integral_eq_lintegral_ofReal] <;>
            (try
              {
                simp [volume_Icc, Real.volume_Icc, Real.volume_Icc]
                <;>
                  (try
                    {
                      simp_all [Set.Icc, Real.volume_Icc, Real.volume_Icc]
                      <;>
                        norm_num
                      <;>
                        linarith
                    })
              })
          <;>
            (try
              {
                exact Continuous.continuousOn (by continuity)
              })
          <;>
            (try
              {
                exact (continuous_id.continuousOn)
              })
          <;>
            (try
              {
                exact (continuous_const.continuousOn)
              })
          <;>
            (try
              {
                exact (continuous_const.continuousOn)
              })
          <;>
            (try
              {
                exact (continuous_const.continuousOn)
              })
          <;>
            (try
              {
                exact (continuous_const.continuousOn)
              })
        rw [h6]
        have h7 : (∫ y in (Set.Icc (0 : ℝ) 1), ((1 - y) ^ 2 / 2 : ℝ) ∂volume) = (1 / 6 : ℝ) := by
          have h8 : (∫ y in (Set.Icc (0 : ℝ) 1), ((1 - y) ^ 2 / 2 : ℝ) ∂volume) = (∫ y in (Set.Icc (0 : ℝ) 1), ((1 - y) ^ 2 / 2 : ℝ) ∂volume) := rfl
          rw [h8]
          have h9 : (∫ y in (Set.Icc (0 : ℝ) 1), ((1 - y) ^ 2 / 2 : ℝ) ∂volume) = (1 / 6 : ℝ) := by
            -- Use the power rule for integration
            have h10 : (∫ y in (Set.Icc (0 : ℝ) 1), ((1 - y) ^ 2 / 2 : ℝ) ∂volume) = (∫ y in (0 : ℝ)..(1 : ℝ), ((1 - y) ^ 2 / 2 : ℝ)) := by
              simp [volume_Icc, Real.volume_Icc, Real.volume_Icc]
              <;>
                (try
                  {
                    simp_all [Set.Icc, Real.volume_Icc, Real.volume_Icc]
                    <;>
                      norm_num
                    <;>
                      linarith
                  })
            rw [h10]
            -- Evaluate the integral
            have h11 : (∫ y in (0 : ℝ)..(1 : ℝ), ((1 - y) ^ 2 / 2 : ℝ)) = (1 / 6 : ℝ) := by
              -- Use the power rule for integration
              norm_num [mul_comm]
              <;>
                ring_nf
              <;>
                field_simp
              <;>
                ring_nf
              <;>
                norm_num
              <;>
                linarith
            rw [h11]
          rw [h9]
        rw [h7]
        <;> simp [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
        <;> norm_num
        <;> linarith
      have h6 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), ∫⁻ y in (Set.Icc (0 : ℝ) 1), ENNReal.ofReal ((1 - y) ^ 2 / 2) ∂volume ∂volume) = (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) := by
        apply lintegral_congr_ae
        filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx using by
          rw [h5]
      rw [h6]
    rw [h4]
    have h7 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (5 : ℝ≥0∞) * (ENNReal.ofReal (1 / 6)) := by
      have h8 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) := rfl
      rw [h8]
      have h9 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (5 : ℝ≥0∞) * (ENNReal.ofReal (1 / 6)) := by
        have h10 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (5 : ℝ≥0∞) * (ENNReal.ofReal (1 / 6)) := by
          -- Use the fact that the integral of a constant over a region is the constant times the volume of the region
          have h11 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) := rfl
          rw [h11]
          -- Use the fact that the integral of a constant over a region is the constant times the volume of the region
          have h12 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (5 : ℝ≥0∞) * (ENNReal.ofReal (1 / 6)) := by
            -- Use the fact that the integral of a constant over a region is the constant times the volume of the region
            have h13 : (∫⁻ x in (Set.Icc (0 : ℝ) 5), (ENNReal.ofReal (1 / 6)) ∂volume) = (5 : ℝ≥0∞) * (ENNReal.ofReal (1 / 6)) := by
              -- Use the fact that the integral of a constant over a region is the constant times the volume of the region
              simp [volume_Icc, Real.volume_Icc, Real.volume_Icc]
              <;>
                (try
                  {
                    simp_all [Set.Icc, Real.volume_Icc, Real.volume_Icc]
                    <;>
                      norm_num
                    <;>
                      linarith
                  })
              <;>
                (try
                  {
                    simp_all [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
                    <;>
                      norm_num
                    <;>
                      linarith
                  })
              <;>
                (try
                  {
                    simp_all [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
                    <;>
                      norm_num
                    <;>
                      linarith
                  })
            rw [h13]
          rw [h12]
        rw [h10]
      rw [h9]
    rw [h7]
    have h8 : (5 : ℝ≥0∞) * (ENNReal.ofReal (1 / 6)) = 5 / 6 := by
      norm_num [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
      <;>
        simp_all [ENNReal.ofReal_eq_zero, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt, le_of_lt]
      <;>
        norm_num
      <;>
        linarith
    rw [h8]
  exact h_main