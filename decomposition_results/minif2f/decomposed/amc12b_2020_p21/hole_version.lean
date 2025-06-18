macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)

theorem amc12b_2020_p21 (S : Finset ℕ)
    (h₀ : ∀ n : ℕ, n ∈ S ↔ 0 < n ∧ (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n)) : S.card = 6 := by
  have h_main : S = {400, 470, 2290, 2360, 2430, 2500} := by
    apply Finset.ext
    intro n
    rw [h₀]
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · 
      intro h
      have h₁ : 0 < n := h.1
      have h₂ : (↑n + (1000 : ℝ)) / 70 = Int.floor (Real.sqrt n) := h.2
      have h₃ : (n + 1000) % 70 = 0 := by
        have h₄ : ((n : ℝ) + 1000) / 70 = Int.floor (Real.sqrt n) := by hole_1
        have h₅ : (n + 1000 : ℤ) % 70 = 0 := by
          have h₆ : ((n : ℝ) + 1000 : ℝ) / 70 = Int.floor (Real.sqrt n) := by hole_2
          have h₇ : (n : ℤ) + 1000 ≡ 0 [ZMOD 70] := by
            have h₈ : ((n : ℝ) + 1000 : ℝ) / 70 = Int.floor (Real.sqrt n) := by hole_3
            have h₉ : (Int.floor (Real.sqrt n) : ℝ) = ((n : ℝ) + 1000 : ℝ) / 70 := by hole_4
            have h₁₀ : (Int.floor (Real.sqrt n) : ℝ) * 70 = (n : ℝ) + 1000 := by hole_5
            have h₁₁ : (Int.floor (Real.sqrt n) : ℤ) * 70 = (n : ℤ) + 1000 := by
              hole_6
            have h₁₂ : (n : ℤ) + 1000 ≡ 0 [ZMOD 70] := by
              hole_7
            hole_8
          hole_9
        hole_10
      have h₄ : n % 70 = 50 := by
        hole_11
      have h₅ : ∃ k : ℕ, n = 70 * k + 50 := by
        use n / 70
        have h₆ := Nat.mod_add_div n 70
        hole_12
      obtain ⟨k, h₆⟩ := h₅
      have h₇ : k + 15 = Int.floor (Real.sqrt n) := by
        have h₈ : ((n : ℝ) + 1000 : ℝ) / 70 = Int.floor (Real.sqrt n) := by hole_13
        have h₉ : (k : ℝ) + 15 = ((n : ℝ) + 1000 : ℝ) / 70 := by
          hole_14
        have h₁₀ : (k : ℝ) + 15 = (Int.floor (Real.sqrt n) : ℝ) := by
          hole_15
        have h₁₁ : (k : ℤ) + 15 = Int.floor (Real.sqrt n) := by
          hole_16
        hole_17
      have h₈ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by
        have h₉ : (k + 15 : ℝ) ≤ Real.sqrt n := by
          have h₁₀ : (k + 15 : ℝ) ≤ Real.sqrt n := by
            have h₁₁ : (k + 15 : ℝ) = Int.floor (Real.sqrt n) := by
              hole_18
            have h₁₂ : (Int.floor (Real.sqrt n) : ℝ) ≤ Real.sqrt n := by
              hole_19
            hole_20
          hole_21
        have h₁₀ : 0 ≤ Real.sqrt n := Real.sqrt_nonneg n
        have h₁₁ : (k + 15 : ℝ) ^ 2 ≤ (n : ℝ) := by
          hole_22
        hole_23
      have h₉ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by
        have h₁₀ : Real.sqrt n < (k + 16 : ℝ) := by
          have h₁₁ : Real.sqrt n < (k + 16 : ℝ) := by
            have h₁₂ : (Int.floor (Real.sqrt n) : ℝ) = (k + 15 : ℝ) := by
              have h₁₃ : (k + 15 : ℝ) = Int.floor (Real.sqrt n) := by
                hole_24
              hole_25
            have h₁₃ : Real.sqrt n < (Int.floor (Real.sqrt n) : ℝ) + 1 := by
              hole_26
            hole_27
          hole_28
        have h₁₁ : 0 ≤ Real.sqrt n := Real.sqrt_nonneg n
        have h₁₂ : (n : ℝ) < (k + 16 : ℝ) ^ 2 := by
          hole_29
        hole_30
      have h₁₀ : (k + 15 : ℕ) ^ 2 ≤ n := by
        hole_31
      have h₁₁ : n < (k + 16 : ℕ) ^ 2 := by
        hole_32
      have h₁₂ : k ≤ 35 := by
        by_contra h
        have h₁₃ : k ≥ 36 := by hole_33
        have h₁₄ : (k + 15 : ℕ) ^ 2 > n := by
          hole_34
        hole_35
      have h₁₃ : k ≥ 5 ∨ k ≤ 4 := by hole_36
      cases h₁₃ with
      | inl h₁₄ =>
        have h₁₅ : k ≥ 5 := h₁₄
        have h₁₆ : k ≤ 35 := by hole_37
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;>
          (try omega) <;>
          (try
            {
              have h₁₇ : n = 400 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try
            {
              have h₁₇ : n = 470 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try
            {
              have h₁₇ : n = 2290 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try
            {
              have h₁₇ : n = 2360 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try
            {
              have h₁₇ : n = 2430 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try
            {
              have h₁₇ : n = 2500 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 2500, Real.sq_sqrt (show 0 ≤ (2500 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try omega)
      | inr h₁₄ =>
        have h₁₅ : k ≤ 4 := h₁₄
        have h₁₆ : k ≥ 0 := by hole_38
        interval_cases k <;> norm_num at h₆ h₁₀ h₁₁ h₈ h₉ h₇ ⊢ <;>
          (try omega) <;>
          (try
            {
              have h₁₇ : n = 400 := by omega
              simp_all [h₁₇]
              <;> norm_num [Int.emod_eq_of_lt] at *
              <;>
                (try
                  {
                    rw [eq_comm]
                    <;> norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt]
                    <;>
                      (try
                        {
                          constructor <;> norm_num <;>
                            nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
                        })
                  })
            }) <;>
          (try omega)
    · 
      intro h
      have h₁ : n = 400 ∨ n = 470 ∨ n = 2290 ∨ n = 2360 ∨ n = 2430 ∨ n = 2500 := by
        hole_39
      rcases h₁ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · 
        constructor
        · 
          norm_num
        · 
          have h₂ : Int.floor (Real.sqrt 400 : ℝ) = 20 := by
            hole_40
          norm_num [h₂]
          <;>
          nlinarith [Real.sqrt_nonneg 400, Real.sq_sqrt (show 0 ≤ (400 : ℝ) by norm_num)]
      · 
        constructor
        · 
          norm_num
        · 
          have h₂ : Int.floor (Real.sqrt 470 : ℝ) = 21 := by
            hole_41
          norm_num [h₂]
          <;>
          nlinarith [Real.sqrt_nonneg 470, Real.sq_sqrt (show 0 ≤ (470 : ℝ) by norm_num)]
      · 
        constructor
        · 
          norm_num
        · 
          have h₂ : Int.floor (Real.sqrt 2290 : ℝ) = 47 := by
            hole_42
          norm_num [h₂]
          <;>
          nlinarith [Real.sqrt_nonneg 2290, Real.sq_sqrt (show 0 ≤ (2290 : ℝ) by norm_num)]
      · 
        constructor
        · 
          norm_num
        · 
          have h₂ : Int.floor (Real.sqrt 2360 : ℝ) = 48 := by
            hole_43
          norm_num [h₂]
          <;>
          nlinarith [Real.sqrt_nonneg 2360, Real.sq_sqrt (show 0 ≤ (2360 : ℝ) by norm_num)]
      · 
        constructor
        · 
          norm_num
        · 
          have h₂ : Int.floor (Real.sqrt 2430 : ℝ) = 49 := by
            hole_44
          norm_num [h₂]
          <;>
          nlinarith [Real.sqrt_nonneg 2430, Real.sq_sqrt (show 0 ≤ (2430 : ℝ) by norm_num)]
      · 
        constructor
        · 
          norm_num
        · 
          have h₂ : Int.floor (Real.sqrt 2500 : ℝ) = 50 := by
            hole_45
          hole_46
  
  have h_card : S.card = 6 := by
    hole_47
  
  hole_48