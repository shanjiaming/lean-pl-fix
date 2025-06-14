macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem putnam_2017_b2
  (S : ℤ → ℕ → ℤ)
  (p : ℤ → ℕ → Prop)
  (q : ℤ → Prop)
  (hS : S = fun (a : ℤ) k ↦ ∑ i in Finset.range k, (a + i))
  (hp : ∀ N k, p N k ↔ ∃ a > 0, S a k = N)
  (hq : ∀ N, q N ↔ p N 2017 ∧ ∀ k : ℕ, k > 1 → k ≠ 2017 → ¬p N k) :
  IsLeast {a : ℤ | q (S a 2017)} ((16) : ℕ) := by
  have h₁ : (16 : ℤ) ∈ {a : ℤ | q (S a 2017)} := by
    have h₂ : q (S (16 : ℤ) 2017) := by
      have h₃ : p (S (16 : ℤ) 2017) 2017 := by
        hole_1
      have h₄ : ∀ k : ℕ, k > 1 → k ≠ 2017 → ¬p (S (16 : ℤ) 2017) k := by
        intro k hk₁ hk₂
        rw [hp]
        intro h
        rcases h with ⟨a, ha₁, ha₂⟩
        have h₅ : S a k = S (16 : ℤ) 2017 := by
          hole_2
        have h₆ : S a k = ∑ i in Finset.range k, (a + i) := by
          hole_3
        have h₇ : S (16 : ℤ) 2017 = ∑ i in Finset.range 2017, ((16 : ℤ) + i) := by
          hole_4
        rw [h₆, h₇] at h₅
        have h₈ : ∑ i in Finset.range k, (a + i) = ∑ i in Finset.range 2017, ((16 : ℤ) + i) := by
          hole_5
        have h₉ : k ≤ 4034 := by
          by_contra h₉
          have h₁₀ : k ≥ 4035 := by hole_7
          have h₁₁ : ∑ i in Finset.range k, (a + i) ≥ ∑ i in Finset.range k, (a + i) := by hole_8
          have h₁₂ : ∑ i in Finset.range 2017, ((16 : ℤ) + i) < ∑ i in Finset.range k, (a + i) := by
            have h₁₃ : ∑ i in Finset.range 2017, ((16 : ℤ) + i) = 2017 * (16 + 1008) := by
              
              hole_10
            have h₁₄ : ∑ i in Finset.range k, (a + i) ≥ ∑ i in Finset.range k, (a + i) := by hole_11
            have h₁₅ : ∑ i in Finset.range k, (a + i) > 2017 * (16 + 1008) := by
              have h₁₆ : ∑ i in Finset.range k, (a + i) ≥ ∑ i in Finset.range 4035, (a + i) := by
                hole_13
              have h₁₇ : ∑ i in Finset.range 4035, (a + i) > 2017 * (16 + 1008) := by
                
                have h₁₈ : ∑ i in Finset.range 4035, (a + i) = 4035 * a + ∑ i in Finset.range 4035, (i : ℤ) := by
                  hole_15
                have h₁₉ : ∑ i in Finset.range 4035, (i : ℤ) = 4035 * 2017 := by
                  
                  hole_16
                rw [h₁₈, h₁₉]
                have h₂₀ : a > 0 := by hole_17
                have h₂₁ : (4035 : ℤ) * a + 4035 * 2017 > 2017 * (16 + 1008) := by
                  hole_18
                hole_14
              hole_12
            hole_9
          hole_6
        interval_cases k <;> norm_num [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc] at h₈ ⊢ <;>
          (try omega) <;> (try
            {
              norm_num at ha₂ ⊢
              <;>
              (try omega) <;> (try
                {
                  ring_nf at ha₂ ⊢
                  <;>
                  omega
                })
            }) <;> (try
            {
              norm_num at ha₂ ⊢
              <;>
              (try omega) <;> (try
                {
                  ring_nf at ha₂ ⊢
                  <;>
                  omega
                })
            })
      have h₅ : p (S (16 : ℤ) 2017) 2017 ∧ ∀ k : ℕ, k > 1 → k ≠ 2017 → ¬p (S (16 : ℤ) 2017) k := by
        exact ⟨h₃, h₄⟩
      rw [hq]
      exact h₅
    exact h₂
  have h₂ : ∀ (a : ℤ), a ∈ {a : ℤ | q (S a 2017)} → (16 : ℤ) ≤ a := by
    intro a ha
    have h₃ : q (S a 2017) := ha
    have h₄ : p (S a 2017) 2017 ∧ ∀ k : ℕ, k > 1 → k ≠ 2017 → ¬p (S a 2017) k := by
      rw [hq] at h₃
      exact h₃
    have h₅ : p (S a 2017) 2017 := h₄.1
    have h₆ : ∀ k : ℕ, k > 1 → k ≠ 2017 → ¬p (S a 2017) k := h₄.2
    have h₇ : a > 0 := by
      have h₇₁ : p (S a 2017) 2017 := h₅
      rw [hp] at h₇₁
      rcases h₇₁ with ⟨b, hb₁, hb₂⟩
      have h₇₂ : S b 2017 = S a 2017 := by linarith
      have h₇₃ : S b 2017 = ∑ i in Finset.range 2017, (b + i) := by
        rw [hS]
        <;> simp [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
      have h₇₄ : S a 2017 = ∑ i in Finset.range 2017, (a + i) := by
        rw [hS]
        <;> simp [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
      rw [h₇₃, h₇₄] at h₇₂
      have h₇₅ : ∑ i in Finset.range 2017, (b + i) = ∑ i in Finset.range 2017, (a + i) := by linarith
      have h₇₆ : b = a := by
        have h₇₇ : ∑ i in Finset.range 2017, (b + i) = ∑ i in Finset.range 2017, (a + i) := h₇₅
        have h₇₈ : ∑ i in Finset.range 2017, (b + i) = ∑ i in Finset.range 2017, (a + i) := by linarith
        have h₇₉ : b = a := by
          
          have h₈₀ : ∑ i in Finset.range 2017, (b + i) = ∑ i in Finset.range 2017, (a + i) := h₇₈
          have h₈₁ : ∑ i in Finset.range 2017, (b + i) = 2017 * b + ∑ i in Finset.range 2017, (i : ℤ) := by
            simp [Finset.sum_add_distrib, Finset.mul_sum]
            <;> ring
            <;> simp_all [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
            <;> linarith
          have h₈₂ : ∑ i in Finset.range 2017, (a + i) = 2017 * a + ∑ i in Finset.range 2017, (i : ℤ) := by
            simp [Finset.sum_add_distrib, Finset.mul_sum]
            <;> ring
            <;> simp_all [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
            <;> linarith
          have h₈₃ : 2017 * b + ∑ i in Finset.range 2017, (i : ℤ) = 2017 * a + ∑ i in Finset.range 2017, (i : ℤ) := by
            linarith
          have h₈₄ : 2017 * b = 2017 * a := by linarith
          have h₈₅ : b = a := by
            apply mul_left_cancel₀ (show (2017 : ℤ) ≠ 0 by norm_num)
            linarith
          exact h₈₅
        exact h₇₉
      linarith
    by_contra h₈
    have h₉ : a < 16 := by linarith
    have h₁₀ : a ≤ 15 := by linarith
    have h₁₁ : a ≥ 1 := by linarith
    have h₁₂ : ∃ (k : ℕ), k > 1 ∧ k ≠ 2017 ∧ p (S a 2017) k := by
      
      
      
      have h₁₃ : a ≤ 15 := by linarith
      have h₁₄ : a ≥ 1 := by linarith
      
      interval_cases a <;> (try norm_num at h₅ h₆ ⊢) <;>
        (try
          {
            use 2
            constructor
            · norm_num
            constructor
            · norm_num
            · rw [hp]
              
              
              
              refine' ⟨(S a 2017 - 1) / 2, by
                {
                  have h₁₅ : S a 2017 = ∑ i in Finset.range 2017, (a + i : ℤ) := by
                    rw [hS]
                    <;> simp [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                  rw [h₁₅]
                  have h₁₆ : ∑ i in Finset.range 2017, (a + i : ℤ) = 2017 * a + ∑ i in Finset.range 2017, (i : ℤ) := by
                    simp [Finset.sum_add_distrib, Finset.mul_sum]
                    <;> ring
                    <;> simp_all [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                    <;> linarith
                  rw [h₁₆]
                  have h₁₇ : ∑ i in Finset.range 2017, (i : ℤ) = 2017 * 1008 := by
                    norm_num [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                    <;> rfl
                  rw [h₁₇]
                  norm_num
                  <;>
                  (try omega) <;> (try
                    {
                      ring_nf
                      <;>
                      omega
                    })
                }, _⟩
              
              
              
              have h₁₅ : S a 2017 = ∑ i in Finset.range 2017, (a + i : ℤ) := by
                rw [hS]
                <;> simp [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
              rw [h₁₅]
              have h₁₆ : ∑ i in Finset.range 2017, (a + i : ℤ) = 2017 * a + ∑ i in Finset.range 2017, (i : ℤ) := by
                simp [Finset.sum_add_distrib, Finset.mul_sum]
                <;> ring
                <;> simp_all [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                <;> linarith
              rw [h₁₆]
              have h₁₇ : ∑ i in Finset.range 2017, (i : ℤ) = 2017 * 1008 := by
                norm_num [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                <;> rfl
              rw [h₁₇]
              norm_num [hS, Finset.sum_range_succ, Finset.sum_range_zero, add_assoc] at *
              <;>
                (try omega) <;> (try
                  {
                    ring_nf at *
                    <;>
                    omega
                  })
          })
        }) <;>
        (try
          {
            use 4
            constructor
            · norm_num
            constructor
            · norm_num
            · rw [hp]
              
              
              
              refine' ⟨(S a 2017 - 6) / 4, by
                {
                  have h₁₅ : S a 2017 = ∑ i in Finset.range 2017, (a + i : ℤ) := by
                    rw [hS]
                    <;> simp [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                  rw [h₁₅]
                  have h₁₆ : ∑ i in Finset.range 2017, (a + i : ℤ) = 2017 * a + ∑ i in Finset.range 2017, (i : ℤ) := by
                    simp [Finset.sum_add_distrib, Finset.mul_sum]
                    <;> ring
                    <;> simp_all [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                    <;> linarith
                  rw [h₁₆]
                  have h₁₇ : ∑ i in Finset.range 2017, (i : ℤ) = 2017 * 1008 := by
                    norm_num [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                    <;> rfl
                  rw [h₁₇]
                  norm_num
                  <;>
                  (try omega) <;> (try
                    {
                      ring_nf
                      <;>
                      omega
                    })
                }, _⟩
              
              
              
              have h₁₅ : S a 2017 = ∑ i in Finset.range 2017, (a + i : ℤ) := by
                rw [hS]
                <;> simp [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
              rw [h₁₅]
              have h₁₆ : ∑ i in Finset.range 2017, (a + i : ℤ) = 2017 * a + ∑ i in Finset.range 2017, (i : ℤ) := by
                simp [Finset.sum_add_distrib, Finset.mul_sum]
                <;> ring
                <;> simp_all [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                <;> linarith
              rw [h₁₆]
              have h₁₇ : ∑ i in Finset.range 2017, (i : ℤ) = 2017 * 1008 := by
                norm_num [Finset.sum_range_succ, Finset.sum_range_zero, add_assoc]
                <;> rfl
              rw [h₁₇]
              norm_num [hS, Finset.sum_range_succ, Finset.sum_range_zero, add_assoc] at *
              <;>
                (try omega) <;> (try
                  {
                    ring_nf at *
                    <;>
                    omega
                  })
          })
    rcases h₁₂ with ⟨k, hk₁, hk₂, hk₃⟩
    have h₁₃ : ¬p (S a 2017) k := h₆ k hk₁ hk₂
    contradiction
  have h₃ : IsLeast {a : ℤ | q (S a 2017)} ((16) : ℕ) := by
    refine' ⟨by simpa using h₁, _⟩
    intro a ha
    have h₄ : (16 : ℤ) ≤ a := h₂ a ha
    simpa using h₄
  exact h₃