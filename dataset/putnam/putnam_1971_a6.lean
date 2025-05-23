theorem putnam_1971_a6
(c : ℝ)
(hc : ∀ n : ℤ, n > 0 → ∃ m : ℤ, (n : ℝ)^c = m)
: ∃ m : ℤ, m ≥ 0 ∧ c = m := by
  have h1 : c ≥ 0 := by
    by_contra h
    -- Assume c < 0 and derive a contradiction by choosing n = 2
    have h2 : c < 0 := by linarith
    have h3 : ∃ (m : ℤ), (2 : ℝ)^c = m := by
      have h4 : (2 : ℤ) > 0 := by norm_num
      have h5 : ∃ (m : ℤ), (2 : ℝ)^c = m := hc 2 h4
      exact h5
    obtain ⟨m, hm⟩ := h3
    have h6 : (2 : ℝ)^c < (1 : ℝ) := by
      have h7 : c < 0 := h2
      have h8 : (2 : ℝ)^c < (1 : ℝ) := by
        apply Real.rpow_lt_one_of_one_lt_of_neg (by norm_num) h7
      exact h8
    have h7 : (m : ℝ) = (2 : ℝ)^c := by
      norm_cast at hm ⊢
      <;> linarith
    have h8 : (m : ℝ) < (1 : ℝ) := by linarith
    have h9 : m < 1 := by
      norm_cast at h8 ⊢
      <;> simp_all
      <;> linarith
    have h10 : (2 : ℝ)^c > 0 := by positivity
    have h11 : (m : ℝ) > 0 := by linarith
    have h12 : m > 0 := by
      norm_cast at h11 ⊢
      <;> simp_all
      <;> linarith
    have h13 : m ≥ 1 := by
      by_contra h14
      have h15 : m ≤ 0 := by linarith
      have h16 : (m : ℝ) ≤ 0 := by
        norm_cast
      linarith
    linarith
  
  have h2 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
    by_contra h
    -- Assume that c is not a non-negative integer and derive a contradiction.
    -- We know that c ≥ 0 from h1.
    have h3 : ∀ (m : ℤ), m ≥ 0 → c ≠ m := by
      intro m hm4 hm5
      have h4 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
        exact ⟨m, hm4, hm5⟩
      exact h h4
    -- We will use the fact that c is not a non-negative integer to show a contradiction.
    have h4 : (2 : ℤ) > 0 := by norm_num
    have h5 : ∃ (m : ℤ), (2 : ℝ)^c = m := hc 2 h4
    obtain ⟨m1, hm1⟩ := h5
    have h6 : (m1 : ℝ) = (2 : ℝ)^c := by
      norm_cast at hm1 ⊢
      <;> linarith
    have h7 : c = Real.logb 2 m1 := by
      have h8 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
      have h9 : Real.logb 2 m1 = c := by
        have h10 : Real.logb 2 m1 = Real.log (m1 : ℝ) / Real.log 2 := by
          simp [Real.logb]
        rw [h10]
        have h11 : Real.log (m1 : ℝ) = c * Real.log 2 := by
          have h12 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
          rw [h12]
          rw [Real.log_rpow (by norm_num : (2 : ℝ) > 0)]
          <;> ring_nf
        rw [h11]
        <;> field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1)]
        <;> ring_nf
        <;> linarith
      linarith
    -- We will show that c must be an integer by considering the properties of logarithms and integers.
    by_cases h8 : c = 0
    · -- If c = 0, then c is a non-negative integer, which contradicts the assumption.
      have h9 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
        refine' ⟨0, by norm_num, _⟩
        <;> simp_all
      exact h h9
    · -- If c ≠ 0, then we need to consider the properties of logarithms and integers.
      have h9 : c ≠ 0 := h8
      have h10 : m1 > 0 := by
        by_contra h10
        have h11 : m1 ≤ 0 := by linarith
        have h12 : (m1 : ℝ) ≤ 0 := by
          norm_cast
        have h13 : (2 : ℝ)^c > 0 := by positivity
        have h14 : (m1 : ℝ) = (2 : ℝ)^c := by
          norm_cast at hm1 ⊢
          <;> linarith
        have h15 : (2 : ℝ)^c ≤ 0 := by linarith
        linarith
      -- We will show that c must be an integer by considering the properties of logarithms and integers.
      have h11 : (3 : ℤ) > 0 := by norm_num
      have h12 : ∃ (m : ℤ), (3 : ℝ)^c = m := hc 3 h11
      obtain ⟨m2, hm2⟩ := h12
      have h13 : (m2 : ℝ) = (3 : ℝ)^c := by
        norm_cast at hm2 ⊢
        <;> linarith
      have h14 : Real.logb 3 m2 = c := by
        have h15 : Real.logb 3 m2 = Real.log (m2 : ℝ) / Real.log 3 := by
          simp [Real.logb]
        rw [h15]
        have h16 : Real.log (m2 : ℝ) = c * Real.log 3 := by
          have h17 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
          rw [h17]
          rw [Real.log_rpow (by norm_num : (3 : ℝ) > 0)]
          <;> ring_nf
        rw [h16]
        <;> field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)]
        <;> ring_nf
        <;> linarith
      have h15 : Real.logb 2 m1 = Real.logb 3 m2 := by
        rw [h7, h14]
      have h16 : Real.logb 2 m1 = Real.log (m1 : ℝ) / Real.log 2 := by
        simp [Real.logb]
      have h17 : Real.logb 3 m2 = Real.log (m2 : ℝ) / Real.log 3 := by
        simp [Real.logb]
      rw [h16, h17] at h15
      have h18 : Real.log (m1 : ℝ) / Real.log 2 = Real.log (m2 : ℝ) / Real.log 3 := by
        exact h15
      have h19 : Real.log (m1 : ℝ) * Real.log 3 = Real.log (m2 : ℝ) * Real.log 2 := by
        field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1),
          Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)] at h18 ⊢
        <;> ring_nf at h18 ⊢
        <;> nlinarith
      have h20 : (m1 : ℝ) > 0 := by positivity
      have h21 : (m2 : ℝ) > 0 := by
        by_contra h21
        have h22 : (m2 : ℝ) ≤ 0 := by linarith
        have h23 : Real.log (m2 : ℝ) ≤ 0 := by
          apply Real.log_nonpos
          <;> norm_num at h22 ⊢
          <;> linarith
        have h24 : Real.log (m1 : ℝ) * Real.log 3 ≤ 0 := by
          have h25 : Real.log (m2 : ℝ) ≤ 0 := h23
          have h26 : Real.log 2 > 0 := Real.log_pos (by norm_num)
          have h27 : Real.log 3 > 0 := Real.log_pos (by norm_num)
          have h28 : Real.log (m2 : ℝ) * Real.log 2 ≤ 0 := by
            nlinarith
          have h29 : Real.log (m1 : ℝ) > 0 := by
            have h30 : (m1 : ℝ) > 1 := by
              have h31 : (2 : ℝ)^c > 1 := by
                have h32 : c > 0 := by
                  by_contra h32
                  have h33 : c ≤ 0 := by linarith
                  have h34 : (2 : ℝ)^c ≤ 1 := by
                    apply Real.rpow_le_one_of_one_le_of_nonpos
                    · norm_num
                    · linarith
                  have h35 : (m1 : ℝ) ≤ 1 := by
                    have h36 : (m1 : ℝ) = (2 : ℝ)^c := by
                      norm_cast at hm1 ⊢ <;> linarith
                    linarith
                  have h37 : (m1 : ℝ) > 0 := by positivity
                  have h38 : m1 > 0 := by
                    norm_cast at h37 ⊢
                    <;> linarith
                  have h39 : m1 ≤ 1 := by
                    norm_cast at h35 ⊢
                    <;> linarith
                  have h40 : m1 = 1 := by
                    have h41 : m1 > 0 := h38
                    have h42 : m1 ≤ 1 := h39
                    have h43 : m1 ≥ 1 := by
                      by_contra h43
                      have h44 : m1 < 1 := by linarith
                      have h45 : (m1 : ℝ) < 1 := by
                        norm_cast at h44 ⊢ <;> linarith
                      have h46 : (m1 : ℝ) = (2 : ℝ)^c := by
                        norm_cast at hm1 ⊢ <;> linarith
                      have h47 : (2 : ℝ)^c < 1 := by linarith
                      have h48 : c < 0 := by
                        by_contra h48
                        have h49 : c ≥ 0 := by linarith
                        have h50 : (2 : ℝ)^c ≥ 1 := by
                          apply Real.one_le_rpow
                          <;> norm_num
                          <;> linarith
                        linarith
                      linarith
                    linarith
                  have h50 : c = 0 := by
                    have h51 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                    have h52 : (m1 : ℝ) = 1 := by
                      norm_cast at h40 ⊢ <;> linarith
                    have h53 : (2 : ℝ)^c = 1 := by linarith
                    have h54 : c = 0 := by
                      apply Real.log_injOn_pos (Set.mem_Ioi.mpr (by positivity)) (Set.mem_Ioi.mpr (by positivity))
                      have h55 : Real.log ((2 : ℝ)^c) = Real.log 1 := by rw [h53]
                      have h56 : Real.log ((2 : ℝ)^c) = c * Real.log 2 := by
                        rw [Real.log_rpow (by positivity)]
                      have h57 : Real.log 1 = 0 := by norm_num
                      rw [h56, h57] at h55
                      have h58 : c * Real.log 2 = 0 := by linarith
                      have h59 : Real.log 2 > 0 := Real.log_pos (by norm_num)
                      have h60 : c = 0 := by
                        nlinarith
                      exact h60
                    exact h54
                  have h61 : c = 0 := h50
                  have h62 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
                    refine' ⟨0, by norm_num, _⟩
                    <;> simp_all
                  exact h h62
                have h63 : (2 : ℝ)^c > 1 := by
                  have h64 : c > 0 := by
                    by_contra h64
                    have h65 : c ≤ 0 := by linarith
                    have h66 : (2 : ℝ)^c ≤ 1 := by
                      apply Real.rpow_le_one_of_one_le_of_nonpos
                      · norm_num
                      · linarith
                    have h67 : (m1 : ℝ) ≤ 1 := by
                      have h68 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                      linarith
                    have h69 : (m1 : ℝ) > 0 := by positivity
                    have h70 : m1 > 0 := by
                      norm_cast at h69 ⊢
                      <;> linarith
                    have h71 : m1 ≤ 1 := by
                      norm_cast at h67 ⊢
                      <;> linarith
                    have h72 : m1 = 1 := by
                      have h73 : m1 > 0 := h70
                      have h74 : m1 ≤ 1 := h71
                      have h75 : m1 ≥ 1 := by
                        by_contra h75
                        have h76 : m1 < 1 := by linarith
                        have h77 : (m1 : ℝ) < 1 := by
                          norm_cast at h76 ⊢ <;> linarith
                        have h78 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                        have h79 : (2 : ℝ)^c < 1 := by linarith
                        have h80 : c < 0 := by
                          by_contra h80
                          have h81 : c ≥ 0 := by linarith
                          have h82 : (2 : ℝ)^c ≥ 1 := by
                            apply Real.one_le_rpow
                            <;> norm_num
                            <;> linarith
                          linarith
                        linarith
                      linarith
                    have h81 : c = 0 := by
                      have h82 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                      have h83 : (m1 : ℝ) = 1 := by
                        norm_cast at h72 ⊢ <;> linarith
                      have h84 : (2 : ℝ)^c = 1 := by linarith
                      have h85 : c = 0 := by
                        apply Real.log_injOn_pos (Set.mem_Ioi.mpr (by positivity)) (Set.mem_Ioi.mpr (by positivity))
                        have h86 : Real.log ((2 : ℝ)^c) = Real.log 1 := by rw [h84]
                        have h87 : Real.log ((2 : ℝ)^c) = c * Real.log 2 := by
                          rw [Real.log_rpow (by positivity)]
                        have h88 : Real.log 1 = 0 := by norm_num
                        rw [h87, h88] at h86
                        have h89 : c * Real.log 2 = 0 := by linarith
                        have h90 : Real.log 2 > 0 := Real.log_pos (by norm_num)
                        have h91 : c = 0 := by
                          nlinarith
                        exact h91
                      exact h85
                    have h92 : c = 0 := h81
                    have h93 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
                      refine' ⟨0, by norm_num, _⟩
                      <;> simp_all
                    exact h h93
                  have h94 : (2 : ℝ)^c > 1 := by
                    apply Real.one_lt_rpow
                    <;> norm_num
                    <;> linarith
                  exact h94
                have h95 : (2 : ℝ)^c > 1 := h63
                have h96 : (m1 : ℝ) > 1 := by
                  have h97 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                  linarith
                have h98 : Real.log (m1 : ℝ) > 0 := by
                  have h99 : (m1 : ℝ) > 1 := h96
                  have h100 : Real.log (m1 : ℝ) > 0 := Real.log_pos h99
                  exact h100
                exact h98
              have h101 : Real.log (m1 : ℝ) > 0 := by
                have h102 : Real.log (m1 : ℝ) > 0 := h29
                exact h102
              nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 3)]
            have h103 : Real.log (m1 : ℝ) > 0 := by
              have h104 : (m1 : ℝ) > 1 := by
                have h105 : (2 : ℝ)^c > 1 := by
                  have h106 : c > 0 := by
                    by_contra h106
                    have h107 : c ≤ 0 := by linarith
                    have h108 : (2 : ℝ)^c ≤ 1 := by
                      apply Real.rpow_le_one_of_one_le_of_nonpos
                      · norm_num
                      · linarith
                    have h109 : (m1 : ℝ) ≤ 1 := by
                      have h110 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                      linarith
                    have h111 : (m1 : ℝ) > 0 := by positivity
                    have h112 : m1 > 0 := by
                      norm_cast at h111 ⊢
                      <;> linarith
                    have h113 : m1 ≤ 1 := by
                      norm_cast at h109 ⊢
                      <;> linarith
                    have h114 : m1 = 1 := by
                      have h115 : m1 > 0 := h112
                      have h116 : m1 ≤ 1 := h113
                      have h117 : m1 ≥ 1 := by
                        by_contra h117
                        have h118 : m1 < 1 := by linarith
                        have h119 : (m1 : ℝ) < 1 := by
                          norm_cast at h118 ⊢ <;> linarith
                        have h120 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                        have h121 : (2 : ℝ)^c < 1 := by linarith
                        have h122 : c < 0 := by
                          by_contra h122
                          have h123 : c ≥ 0 := by linarith
                          have h124 : (2 : ℝ)^c ≥ 1 := by
                            apply Real.one_le_rpow
                            <;> norm_num
                            <;> linarith
                          linarith
                        linarith
                      linarith
                    have h125 : c = 0 := by
                      have h126 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                      have h127 : (m1 : ℝ) = 1 := by
                        norm_cast at h114 ⊢ <;> linarith
                      have h128 : (2 : ℝ)^c = 1 := by linarith
                      have h129 : c = 0 := by
                        apply Real.log_injOn_pos (Set.mem_Ioi.mpr (by positivity)) (Set.mem_Ioi.mpr (by positivity))
                        have h130 : Real.log ((2 : ℝ)^c) = Real.log 1 := by rw [h128]
                        have h131 : Real.log ((2 : ℝ)^c) = c * Real.log 2 := by
                          rw [Real.log_rpow (by positivity)]
                        have h132 : Real.log 1 = 0 := by norm_num
                        rw [h131, h132] at h130
                        have h133 : c * Real.log 2 = 0 := by linarith
                        have h134 : Real.log 2 > 0 := Real.log_pos (by norm_num)
                        have h135 : c = 0 := by
                          nlinarith
                        exact h135
                      exact h129
                    have h136 : c = 0 := h125
                    have h137 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
                      refine' ⟨0, by norm_num, _⟩
                      <;> simp_all
                    exact h h137
                  have h138 : (2 : ℝ)^c > 1 := by
                    apply Real.one_lt_rpow
                    <;> norm_num
                    <;> linarith
                  have h139 : (m1 : ℝ) > 1 := by
                    have h140 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                    linarith
                  exact h139
                have h141 : Real.log (m1 : ℝ) > 0 := Real.log_pos h104
                exact h141
              exact h103
            nlinarith
          <;> norm_num
          <;> linarith
        nlinarith
      have h22 : Real.log (m1 : ℝ) * Real.log 3 > 0 := by
        have h23 : Real.log (m1 : ℝ) > 0 := by
          have h24 : (m1 : ℝ) > 1 := by
            have h25 : (2 : ℝ)^c > 1 := by
              have h26 : c > 0 := by
                by_contra h26
                have h27 : c ≤ 0 := by linarith
                have h28 : (2 : ℝ)^c ≤ 1 := by
                  apply Real.rpow_le_one_of_one_le_of_nonpos
                  · norm_num
                  · linarith
                have h29 : (m1 : ℝ) ≤ 1 := by
                  have h30 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                  linarith
                have h31 : (m1 : ℝ) > 0 := by positivity
                have h32 : m1 > 0 := by
                  norm_cast at h31 ⊢
                  <;> linarith
                have h33 : m1 ≤ 1 := by
                  norm_cast at h29 ⊢
                  <;> linarith
                have h34 : m1 = 1 := by
                  have h35 : m1 > 0 := h32
                  have h36 : m1 ≤ 1 := h33
                  have h37 : m1 ≥ 1 := by
                    by_contra h37
                    have h38 : m1 < 1 := by linarith
                    have h39 : (m1 : ℝ) < 1 := by
                      norm_cast at h38 ⊢ <;> linarith
                    have h40 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                    have h41 : (2 : ℝ)^c < 1 := by linarith
                    have h42 : c < 0 := by
                      by_contra h42
                      have h43 : c ≥ 0 := by linarith
                      have h44 : (2 : ℝ)^c ≥ 1 := by
                        apply Real.one_le_rpow
                        <;> norm_num
                        <;> linarith
                      linarith
                    linarith
                  linarith
                have h45 : c = 0 := by
                  have h46 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
                  have h47 : (m1 : ℝ) = 1 := by
                    norm_cast at h34 ⊢ <;> linarith
                  have h48 : (2 : ℝ)^c = 1 := by linarith
                  have h49 : c = 0 := by
                    apply Real.log_injOn_pos (Set.mem_Ioi.mpr (by positivity)) (Set.mem_Ioi.mpr (by positivity))
                    have h50 : Real.log ((2 : ℝ)^c) = Real.log 1 := by rw [h48]
                    have h51 : Real.log ((2 : ℝ)^c) = c * Real.log 2 := by
                      rw [Real.log_rpow (by positivity)]
                    have h52 : Real.log 1 = 0 := by norm_num
                    rw [h51, h52] at h50
                    have h53 : c * Real.log 2 = 0 := by linarith
                    have h54 : Real.log 2 > 0 := Real.log_pos (by norm_num)
                    have h55 : c = 0 := by
                      nlinarith
                    exact h55
                  exact h49
                have h56 : c = 0 := h45
                have h57 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
                  refine' ⟨0, by norm_num, _⟩
                  <;> simp_all
                exact h h57
              have h58 : (2 : ℝ)^c > 1 := by
                apply Real.one_lt_rpow
                <;> norm_num
                <;> linarith
              exact h58
            have h59 : (m1 : ℝ) > 1 := by
              have h60 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
              linarith
            exact h59
          have h61 : Real.log (m1 : ℝ) > 0 := Real.log_pos h24
          exact h61
        have h62 : Real.log 3 > 0 := Real.log_pos (by norm_num)
        nlinarith
      have h63 : Real.log (m2 : ℝ) * Real.log 2 > 0 := by
        have h64 : Real.log (m2 : ℝ) > 0 := by
          have h65 : (m2 : ℝ) > 1 := by
            have h66 : (3 : ℝ)^c > 1 := by
              have h67 : c > 0 := by
                by_contra h67
                have h68 : c ≤ 0 := by linarith
                have h69 : (3 : ℝ)^c ≤ 1 := by
                  apply Real.rpow_le_one_of_one_le_of_nonpos
                  · norm_num
                  · linarith
                have h70 : (m2 : ℝ) ≤ 1 := by
                  have h71 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
                  linarith
                have h71 : (m2 : ℝ) > 0 := by positivity
                have h72 : m2 > 0 := by
                  norm_cast at h71 ⊢
                  <;> linarith
                have h73 : m2 ≤ 1 := by
                  norm_cast at h70 ⊢
                  <;> linarith
                have h74 : m2 = 1 := by
                  have h75 : m2 > 0 := h72
                  have h76 : m2 ≤ 1 := h73
                  have h77 : m2 ≥ 1 := by
                    by_contra h77
                    have h78 : m2 < 1 := by linarith
                    have h79 : (m2 : ℝ) < 1 := by
                      norm_cast at h78 ⊢ <;> linarith
                    have h80 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
                    have h81 : (3 : ℝ)^c < 1 := by linarith
                    have h82 : c < 0 := by
                      by_contra h82
                      have h83 : c ≥ 0 := by linarith
                      have h84 : (3 : ℝ)^c ≥ 1 := by
                        apply Real.one_le_rpow
                        <;> norm_num
                        <;> linarith
                      linarith
                    linarith
                  linarith
                have h85 : c = 0 := by
                  have h86 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
                  have h87 : (m2 : ℝ) = 1 := by
                    norm_cast at h74 ⊢ <;> linarith
                  have h88 : (3 : ℝ)^c = 1 := by linarith
                  have h89 : c = 0 := by
                    apply Real.log_injOn_pos (Set.mem_Ioi.mpr (by positivity)) (Set.mem_Ioi.mpr (by positivity))
                    have h90 : Real.log ((3 : ℝ)^c) = Real.log 1 := by rw [h88]
                    have h91 : Real.log ((3 : ℝ)^c) = c * Real.log 3 := by
                      rw [Real.log_rpow (by positivity)]
                    have h92 : Real.log 1 = 0 := by norm_num
                    rw [h91, h92] at h90
                    have h93 : c * Real.log 3 = 0 := by linarith
                    have h94 : Real.log 3 > 0 := Real.log_pos (by norm_num)
                    have h95 : c = 0 := by
                      nlinarith
                    exact h95
                  exact h89
                have h96 : c = 0 := h85
                have h97 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
                  refine' ⟨0, by norm_num, _⟩
                  <;> simp_all
                exact h h97
              have h98 : (3 : ℝ)^c > 1 := by
                apply Real.one_lt_rpow
                <;> norm_num
                <;> linarith
              have h99 : (m2 : ℝ) > 1 := by
                have h100 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
                linarith
              exact h99
            have h101 : Real.log (m2 : ℝ) > 0 := Real.log_pos h65
            exact h101
          have h102 : Real.log 2 > 0 := Real.log_pos (by norm_num)
          nlinarith
        nlinarith
      nlinarith
    have h3 : c = 0 := by
      by_contra h3
      have h4 : c ≠ 0 := h3
      have h5 : c > 0 := by
        by_contra h5
        have h6 : c ≤ 0 := by linarith
        have h7 : c = 0 := by
          have h8 : c < 0 := by
            by_contra h8
            have h9 : c = 0 := by linarith
            contradiction
          have h10 : c < 0 := h8
          have h11 : ∃ (m : ℤ), (2 : ℝ)^c = m := by
            have h12 : (2 : ℤ) > 0 := by norm_num
            have h13 : ∃ (m : ℤ), (2 : ℝ)^c = m := hc 2 h12
            exact h13
          obtain ⟨m, hm⟩ := h11
          have h14 : (2 : ℝ)^c < (1 : ℝ) := by
            have h15 : c < 0 := h10
            have h16 : (2 : ℝ)^c < (1 : ℝ) := by
              apply Real.rpow_lt_one_of_one_lt_of_neg (by norm_num) h15
            exact h16
          have h17 : (m : ℝ) = (2 : ℝ)^c := by
            norm_cast at hm ⊢
            <;> linarith
          have h18 : (m : ℝ) < (1 : ℝ) := by linarith
          have h19 : m < 1 := by
            norm_cast at h18 ⊢
            <;> simp_all
            <;> linarith
          have h20 : (2 : ℝ)^c > 0 := by positivity
          have h21 : (m : ℝ) > 0 := by linarith
          have h22 : m > 0 := by
            norm_cast at h21 ⊢
            <;> simp_all
            <;> linarith
          have h23 : m ≥ 1 := by
            by_contra h23
            have h24 : m ≤ 0 := by linarith
            have h25 : (m : ℝ) ≤ 0 := by
              norm_cast
            linarith
          linarith
        contradiction
      have h6 : c > 0 := h5
      -- Use the fact that c is a positive non-integer to derive a contradiction
      have h7 : c ≠ 0 := h4
      have h8 : (2 : ℤ) > 0 := by norm_num
      have h9 : ∃ (m : ℤ), (2 : ℝ)^c = m := hc 2 h8
      obtain ⟨m, hm⟩ := h9
      have h10 : (m : ℝ) = (2 : ℝ)^c := by
        norm_cast at hm ⊢
        <;> linarith
      have h11 : c = Real.logb 2 m := by
        have h12 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
        have h13 : Real.logb 2 m = c := by
          have h14 : Real.logb 2 m = Real.log (m : ℝ) / Real.log 2 := by
            simp [Real.logb]
          rw [h14]
          have h15 : Real.log (m : ℝ) = c * Real.log 2 := by
            have h16 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
            rw [h16]
            rw [Real.log_rpow (by norm_num : (2 : ℝ) > 0)]
            <;> ring_nf
          rw [h15]
          <;> field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1)]
          <;> ring_nf
          <;> linarith
        linarith
      have h12 : (m : ℝ) > 0 := by
        have h13 : (2 : ℝ)^c > 0 := by positivity
        have h14 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
        linarith
      have h13 : m > 0 := by
        norm_cast at h12 ⊢
        <;> linarith
      have h14 : (3 : ℤ) > 0 := by norm_num
      have h15 : ∃ (m : ℤ), (3 : ℝ)^c = m := hc 3 h14
      obtain ⟨m2, hm2⟩ := h15
      have h16 : (m2 : ℝ) = (3 : ℝ)^c := by
        norm_cast at hm2 ⊢
        <;> linarith
      have h17 : Real.logb 3 m2 = c := by
        have h18 : Real.logb 3 m2 = Real.log (m2 : ℝ) / Real.log 3 := by
          simp [Real.logb]
        rw [h18]
        have h19 : Real.log (m2 : ℝ) = c * Real.log 3 := by
          have h20 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
          rw [h20]
          rw [Real.log_rpow (by norm_num : (3 : ℝ) > 0)]
          <;> ring_nf
        rw [h19]
        <;> field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)]
        <;> ring_nf
        <;> linarith
      have h18 : Real.logb 2 m = Real.logb 3 m2 := by
        rw [h11, h17]
      have h19 : Real.logb 2 m = Real.log (m : ℝ) / Real.log 2 := by
        simp [Real.logb]
      have h20 : Real.logb 3 m2 = Real.log (m2 : ℝ) / Real.log 3 := by
        simp [Real.logb]
      rw [h19, h20] at h18
      have h21 : Real.log (m : ℝ) / Real.log 2 = Real.log (m2 : ℝ) / Real.log 3 := by
        exact h18
      have h22 : Real.log (m : ℝ) * Real.log 3 = Real.log (m2 : ℝ) * Real.log 2 := by
        field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1),
          Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)] at h21 ⊢
        <;> ring_nf at h21 ⊢
        <;> nlinarith
      have h23 : (m : ℝ) > 0 := by positivity
      have h24 : (m2 : ℝ) > 0 := by
        by_contra h24
        have h25 : (m2 : ℝ) ≤ 0 := by linarith
        have h26 : Real.log (m2 : ℝ) ≤ 0 := by
          apply Real.log_nonpos
          <;> norm_num at h25 ⊢
          <;> linarith
        have h27 : Real.log (m : ℝ) * Real.log 3 ≤ 0 := by
          have h28 : Real.log (m2 : ℝ) ≤ 0 := h26
          have h29 : Real.log 2 > 0 := Real.log_pos (by norm_num)
          have h30 : Real.log 3 > 0 := Real.log_pos (by norm_num)
          have h31 : Real.log (m2 : ℝ) * Real.log 2 ≤ 0 := by
            nlinarith
          have h32 : Real.log (m : ℝ) > 0 := by
            have h33 : (m : ℝ) > 1 := by
              have h34 : (2 : ℝ)^c > 1 := by
                have h35 : c > 0 := by
                  by_contra h35
                  have h36 : c ≤ 0 := by linarith
                  have h37 : (2 : ℝ)^c ≤ 1 := by
                    apply Real.rpow_le_one_of_one_le_of_nonpos
                    · norm_num
                    · linarith
                  have h38 : (m : ℝ) ≤ 1 := by
                    have h39 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
                    linarith
                  have h40 : (m : ℝ) > 0 := by positivity
                  have h41 : m > 0 := by
                    norm_cast at h40 ⊢
                    <;> linarith
                  have h42 : m ≤ 1 := by
                    norm_cast at h38 ⊢
                    <;> linarith
                  have h43 : m = 1 := by
                    have h44 : m > 0 := h41
                    have h45 : m ≤ 1 := h42
                    have h46 : m ≥ 1 := by
                      by_contra h46
                      have h47 : m < 1 := by linarith
                      have h48 : (m : ℝ) < 1 := by
                        norm_cast at h47 ⊢ <;> linarith
                      have h49 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
                      have h50 : (2 : ℝ)^c < 1 := by linarith
                      have h51 : c < 0 := by
                        by_contra h51
                        have h52 : c ≥ 0 := by linarith
                        have h53 : (2 : ℝ)^c ≥ 1 := by
                          apply Real.one_le_rpow
                          <;> norm_num
                          <;> linarith
                        linarith
                      linarith
                    linarith
                  have h54 : c = 0 := by
                    have h55 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
                    have h56 : (m : ℝ) = 1 := by
                      norm_cast at h43 ⊢ <;> linarith
                    have h57 : (2 : ℝ)^c = 1 := by linarith
                    have h58 : c = 0 := by
                      apply Real.log_injOn_pos (Set.mem_Ioi.mpr (by positivity)) (Set.mem_Ioi.mpr (by positivity))
                      have h59 : Real.log ((2 : ℝ)^c) = Real.log 1 := by rw [h57]
                      have h60 : Real.log ((2 : ℝ)^c) = c * Real.log 2 := by
                        rw [Real.log_rpow (by positivity)]
                      have h61 : Real.log 1 = 0 := by norm_num
                      rw [h60, h61] at h59
                      have h62 : c * Real.log 2 = 0 := by linarith
                      have h63 : Real.log 2 > 0 := Real.log_pos (by norm_num)
                      have h64 : c = 0 := by
                        nlinarith
                      exact h64
                    exact h58
                  have h65 : c = 0 := h54
                  have h66 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
                    refine' ⟨0, by norm_num, _⟩
                    <;> simp_all
                  exact h h66
                have h67 : (2 : ℝ)^c > 1 := by
                  have h68 : c > 0 := h35
                  have h69 : (2 : ℝ)^c > 1 := by
                    apply Real.one_lt_rpow
                    <;> norm_num
                    <;> linarith
                  exact h69
                exact h67
              have h70 : (m : ℝ) > 1 := by
                have h71 : (m : ℝ) = (2 : ℝ)^c := by norm_cast at hm ⊢ <;> linarith
                linarith
              exact h70
            have h72 : Real.log (m : ℝ) > 0 := Real.log_pos h33
            exact h72
          nlinarith
        nlinarith
      have h25 : Real.log (m1 : ℝ) * Real.log 3 > 0 := by
        have h26 : Real.log (m1 : ℝ) > 0 := by
          have h27 : (m1 : ℝ) > 1 := by
            have h28 : (2 : ℝ)^c > 1 := by
              have h29 : c > 0 := h6
              have h30 : (2 : ℝ)^c > 1 := by
                apply Real.one_lt_rpow
                <;> norm_num
                <;> linarith
              exact h30
            have h31 : (m1 : ℝ) > 1 := by
              have h32 : (m1 : ℝ) = (2 : ℝ)^c := by norm_cast at hm1 ⊢ <;> linarith
              linarith
            exact h31
          have h33 : Real.log (m1 : ℝ) > 0 := Real.log_pos h27
          exact h33
        have h34 : Real.log 3 > 0 := Real.log_pos (by norm_num)
        nlinarith
      have h26 : Real.log (m2 : ℝ) * Real.log 2 > 0 := by
        have h27 : Real.log (m2 : ℝ) > 0 := by
          have h28 : (m2 : ℝ) > 1 := by
            have h29 : (3 : ℝ)^c > 1 := by
              have h30 : c > 0 := h6
              have h31 : (3 : ℝ)^c > 1 := by
                apply Real.one_lt_rpow
                <;> norm_num
                <;> linarith
              exact h31
            have h32 : (m2 : ℝ) > 1 := by
              have h33 : (m2 : ℝ) = (3 : ℝ)^c := by norm_cast at hm2 ⊢ <;> linarith
              linarith
            exact h32
          have h34 : Real.log (m2 : ℝ) > 0 := Real.log_pos h28
          exact h34
        have h35 : Real.log 2 > 0 := Real.log_pos (by norm_num)
        nlinarith
      nlinarith
    have h4 : ∃ (m : ℤ), m ≥ 0 ∧ c = m := by
      refine' ⟨0, by norm_num, _⟩
      <;> simp_all
      <;> linarith
    exact h h4
  exact h2