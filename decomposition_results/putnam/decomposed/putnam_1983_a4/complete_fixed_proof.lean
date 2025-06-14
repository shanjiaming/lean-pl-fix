theorem putnam_1983_a4
(k m : ℕ)
(S : ℤ)
(kpos : k > 0)
(hm : m = 6 * k - 1)
(hS : S = ∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1))
: (S ≠ 0) := by
  have h_main : S % 3 = 1 := by
    have h₁ : S = ∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1) := hS
    rw [h₁]
    have h₂ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
      intro j hj
      have h₃ : m = 6 * k - 1 := hm
      have h₄ : (m : ℕ) = 6 * k - 1 := by
        admit
      have h₅ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
        have h₆ : m ≡ 2 [MOD 3] := by
          rw [Nat.ModEq]
          have h₇ : m = 6 * k - 1 := hm
          rw [h₇]
          have h₈ : (6 * k - 1) % 3 = 2 := by
            have h₉ : k > 0 := kpos
            have h₁₀ : (6 * k - 1) % 3 = 2 := by
              have h₁₁ : (6 * k) % 3 = 0 := by
                admit
              admit
            admit
          admit
        have h₇ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
          have h₈ : m ≡ 2 [MOD 3] := h₆
          have h₉ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
            
            have h₁₀ : m % 3 = 2 := by
              admit
            have h₁₁ : (3 * j - 1 : ℕ) ≤ m := by
              have h₁₂ : j ∈ Finset.Icc 1 (2 * k - 1) := hj
              have h₁₃ : 1 ≤ j ∧ j ≤ 2 * k - 1 := Finset.mem_Icc.mp h₁₂
              have h₁₄ : j ≤ 2 * k - 1 := h₁₃.2
              have h₁₅ : 3 * j - 1 ≤ 6 * k - 1 := by
                have h₁₆ : j ≤ 2 * k - 1 := h₁₄
                have h₁₇ : 3 * j ≤ 3 * (2 * k - 1) := by
                  admit
                have h₁₈ : 3 * (2 * k - 1) ≤ 6 * k - 1 := by
                  admit
                admit
              admit
            have h₁₂ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
              
              have h₁₃ : m % 3 = 2 := h₁₀
              have h₁₄ : (3 * j - 1 : ℕ) ≤ m := h₁₁
              have h₁₅ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
                
                have h₁₆ : m % 3 = 2 := h₁₀
                have h₁₇ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                have h₁₈ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
                  
                  have h₁₉ : m = 6 * k - 1 := hm
                  have h₂₀ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                  have h₂₁ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
                    
                    have h₂₂ : m % 3 = 2 := h₁₀
                    have h₂₃ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                    have h₂₄ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
                      
                      have h₂₅ : m % 3 = 2 := h₁₀
                      have h₂₆ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                      have h₂₇ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
                        
                        admit
                      exact h₂₇
                    exact h₂₄
                  exact h₂₁
                exact h₁₈
              exact h₁₅
            exact h₁₂
          exact h₉
        exact h₇
      exact h₅
    have h₃ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = 1 := by
      have h₄ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 := by
        have h₅ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = (∑ j in Finset.Icc 1 (2 * k - 1), ((-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3) % 3 := by
          simp [Int.emod_eq_emod_iff_emod_sub_eq_zero, Finset.sum_int_mod]
          <;>
          simp_all [Finset.sum_int_mod]
          <;>
          ring_nf at *
          <;>
          omega
        have h₆ : (∑ j in Finset.Icc 1 (2 * k - 1), ((-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3) % 3 = (∑ j in Finset.Icc 1 (2 * k - 1), ((-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3) % 3 := by
          have h₇ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := by
            intro j hj
            exact h₂ j hj
          have h₈ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → ((-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = ((-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 := by
            intro j hj
            have h₉ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := h₇ j hj
            have h₁₀ : ((-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = ((-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 := by
              have h₁₁ : ((-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = (((-1 : ℤ) ^ (j + 1) % 3) * (choose m (3 * j - 1) % 3)) % 3 := by
                simp [Int.mul_emod, Int.pow_succ]
              have h₁₂ : ((-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 = (((-1 : ℤ) ^ (j + 1) % 3) * (choose 2 (3 * j - 1) % 3)) % 3 := by
                simp [Int.mul_emod, Int.pow_succ]
              rw [h₁₁, h₁₂]
              have h₁₃ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3 := h₉
              rw [h₁₃]
            exact h₁₀
          have h₉ : (∑ j in Finset.Icc 1 (2 * k - 1), ((-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3) % 3 = (∑ j in Finset.Icc 1 (2 * k - 1), ((-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3) % 3 := by
            apply congr_arg (fun x => x % 3)
            apply Finset.sum_congr rfl
            intro j hj
            exact h₈ j hj
          exact h₉
        have h₁₀ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 = (∑ j in Finset.Icc 1 (2 * k - 1), ((-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3) % 3 := by
          simp [Int.emod_eq_emod_iff_emod_sub_eq_zero, Finset.sum_int_mod]
          <;>
          simp_all [Finset.sum_int_mod]
          <;>
          ring_nf at *
          <;>
          omega
        omega
      have h₅ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 = 1 := by
        have h₆ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (choose 2 (3 * j - 1) : ℤ) = if j = 1 then 1 else 0 := by
          intro j hj
          have h₇ : j ∈ Finset.Icc 1 (2 * k - 1) := hj
          have h₈ : 1 ≤ j ∧ j ≤ 2 * k - 1 := Finset.mem_Icc.mp h₇
          have h₉ : 1 ≤ j := h₈.1
          have h₁₀ : j ≤ 2 * k - 1 := h₈.2
          have h₁₁ : (choose 2 (3 * j - 1) : ℤ) = if j = 1 then 1 else 0 := by
            by_cases h₁₂ : j = 1
            · 
              rw [h₁₂]
              norm_num [Nat.choose_succ_succ, Nat.choose_zero_right, Nat.choose_one_right]
            · 
              have h₁₃ : j ≥ 2 := by
                by_contra h
                have h₁₄ : j < 2 := by omega
                have h₁₅ : j = 1 := by omega
                contradiction
              have h₁₆ : 3 * j - 1 ≥ 5 := by
                omega
              have h₁₇ : (choose 2 (3 * j - 1) : ℕ) = 0 := by
                have h₁₈ : 3 * j - 1 > 2 := by omega
                have h₁₉ : (choose 2 (3 * j - 1) : ℕ) = 0 := by
                  have h₂₀ : 3 * j - 1 > 2 := by omega
                  have h₂₁ : (choose 2 (3 * j - 1) : ℕ) = 0 := by
                    apply Nat.choose_eq_zero_of_lt
                    <;> omega
                  exact h₂₁
                exact h₁₉
              have h₂₀ : (choose 2 (3 * j - 1) : ℤ) = 0 := by
                norm_cast
                <;> simp [h₁₇]
              rw [h₂₀]
              <;> simp [h₁₂]
          exact h₁₁
        have h₇ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) = (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * (if j = 1 then 1 else 0 : ℤ)) := by
          apply Finset.sum_congr rfl
          intro j hj
          rw [h₆ j hj]
          <;>
          simp [hj]
        rw [h₇]
        have h₈ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * (if j = 1 then 1 else 0 : ℤ)) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
          have h₉ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (-1 : ℤ) ^ (j + 1) * (if j = 1 then 1 else 0 : ℤ) = if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 := by
            intro j hj
            split_ifs <;> simp_all (config := { contextual := true })
            <;>
            (try omega) <;>
            (try ring_nf at * <;> omega)
          calc
            (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * (if j = 1 then 1 else 0 : ℤ)) = ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) := by
              apply Finset.sum_congr rfl
              intro j hj
              rw [h₉ j hj]
            _ = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
              have h₁₀ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                have h₁₁ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                  have h₁₂ : k > 0 := kpos
                  have h₁₃ : 2 * k - 1 ≥ 1 := by
                    omega
                  have h₁₄ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                    have h₁₅ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                      
                      
                      
                      have h₁₆ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = ∑ j in Finset.Icc 1 (2 * k - 1), if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 := by
                        rfl
                      rw [h₁₆]
                      
                      
                      
                      have h₁₇ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                        
                        
                        
                        have h₁₈ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                          
                          
                          
                          have h₁₉ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                            
                            
                            
                            have h₂₀ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                              
                              
                              
                              have h₂₁ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                                
                                
                                
                                have h₂₂ : ∑ j in Finset.Icc 1 (2 * k - 1), (if j = 1 then (-1 : ℤ) ^ (j + 1) * 1 else 0 : ℤ) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by
                                  
                                  
                                  
                                  cases k with
                                  | zero =>
                                    simp_all [Finset.sum_range_succ, Nat.mul_succ, Nat.add_assoc]
                                    <;> omega
                                  | succ k' =>
                                    cases k' with
                                    | zero =>
                                      simp_all [Finset.sum_Icc_succ_top, Nat.mul_succ, Nat.add_assoc]
                                      <;> norm_num
                                      <;> ring_nf at *
                                      <;> omega
                                    | succ k'' =>
                                      simp_all [Finset.sum_Icc_succ_top, Nat.mul_succ, Nat.add_assoc]
                                      <;> norm_num
                                      <;> ring_nf at *
                                      <;> omega
                                exact h₂₂
                              exact h₂₁
                            exact h₂₀
                          exact h₁₉
                        exact h₁₈
                      exact h₁₇
                    exact h₁₅
                  exact h₁₄
                exact h₁₁
              rw [h₁₀]
            _ = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by rfl
        rw [h₈]
        <;> norm_num
        <;>
        (try omega) <;>
        (try ring_nf at *) <;>
        (try omega)
      have h₉ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = 1 := by
        omega
      exact h₉
    exact h₃
    <;> simp_all [Int.emod_eq_emod_iff_emod_sub_eq_zero]
    <;> omega
  
  have h_final : S ≠ 0 := by
    have h₁ : S % 3 = 1 := h_main
    have h₂ : S ≠ 0 := by
      by_contra h
      rw [h] at h₁
      norm_num at h₁
      <;> omega
    exact h₂
  
  exact h_final