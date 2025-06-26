import Mathlib

open Polynomial Real Complex Matrix Filter Topology Multiset

-- fun k : ℕ => 1/(Nat.factorial k)
/--
Let $s_k (a_1, a_2, \dots, a_n)$ denote the $k$-th elementary symmetric function; that is, the sum of all $k$-fold products of the $a_i$. For example, $s_1 (a_1, \dots, a_n) = \sum_{i=1}^{n} a_i$, and $s_2 (a_1, a_2, a_3) = a_1a_2 + a_2a_3 + a_1a_3$. Find the supremum $M_k$ (which is never attained) of $$\frac{s_k (a_1, a_2, \dots, a_n)}{(s_1 (a_1, a_2, \dots, a_n))^k}$$ across all $n$-tuples $(a_1, a_2, \dots, a_n)$ of positive real numbers with $n \ge k$.
-/
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
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

theorem putnam_1975_b3
: ∀ k : ℕ, k > 0 → (∀ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k →
(esymm a k)/(esymm a 1)^k ≤ ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k) ∧
∀ M : ℝ, M < ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k → (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧
(esymm a k)/(esymm a 1)^k > M) := by
  intro k hk
  have h_main : (∀ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k → (esymm a k)/(esymm a 1)^k ≤ ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k) ∧ ∀ M : ℝ, M < ((fun k : ℕ => 1/(Nat.factorial k)) : ℕ → ℝ ) k → (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k)/(esymm a 1)^k > M) := by
    have h₁ : ∀ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k → (esymm a k) / (esymm a 1) ^ k ≤ ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k := by
      intro a h
      have h₂ : ∀ i ∈ a, i > 0 := h.1
      have h₃ : card a ≥ k := h.2
      have h₄ : (esymm a k : ℝ) ≤ (esymm a 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
        
        have h₅ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (card s : ℕ) ≥ k → (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
          intro s h₅ h₆
          have h₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
            
            have h₈ : (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
            rw [h₈]
            have h₉ : (esymm s 1 : ℝ) = (esymm s 1 : ℝ) := rfl
            rw [h₉]
            
            have h₁₀ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
              
              have h₁₁ : (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
              rw [h₁₁]
              have h₁₂ : (esymm s 1 : ℝ) = (esymm s 1 : ℝ) := rfl
              rw [h₁₂]
              
              have h₁₃ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                
                have h₁₄ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (card s : ℕ) ≥ k → (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                  intro s h₁₄ h₁₅
                  
                  have h₁₆ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                    
                    have h₁₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                      
                      classical
                      
                      have h₁₈ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                        
                        have h₁₉ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                          
                          calc
                            (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
                            _ ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                              
                              have h₂₀ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                
                                have h₂₁ : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → (card s : ℕ) ≥ k → (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                  intro s h₂₁ h₂₂
                                  
                                  have h₂₃ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                    
                                    have h₂₄ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                      
                                      classical
                                      
                                      have h₂₅ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                        
                                        calc
                                          (esymm s k : ℝ) = (esymm s k : ℝ) := rfl
                                          _ ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                            
                                            have h₂₆ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                              
                                              have h₂₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by
                                                
                                                hole_8
                    have h₁₉ : (1 : ℝ) / (k : ℝ) ^ k ≥ 1 / (Nat.factorial k : ℝ) := by
                      have h₂₀ : 0 < (k : ℝ) ^ k := by positivity
                      have h₂₁ : 0 < (Nat.factorial k : ℝ) := by positivity
                      have h₂₂ : (k : ℝ) ^ k ≤ (Nat.factorial k : ℝ) := h₁₃
                      have h₂₃ : (1 : ℝ) / (k : ℝ) ^ k ≥ 1 / (Nat.factorial k : ℝ) := by
                        rw [ge_iff_le]
                        rw [div_le_div_iff (by positivity) (by positivity)]
                        nlinarith
                      exact h₂₃
                    exact h₁₉
                  exact h₁₅
                have h₁₆ : M < 1 / (Nat.factorial k : ℝ) := h₅
                have h₁₇ : (1 : ℝ) / (k : ℝ) ^ k > M := by
                  linarith
                exact h₁₇
              rw [h₁₀]
              exact h₁₁
            exact h₇
            <;> simp_all [esymm, Multiset.map_replicate, Multiset.sum_replicate, Nat.cast_one, Nat.cast_mul, Nat.cast_add, Nat.cast_zero]
            <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> ring_nf
            <;> norm_num
            <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
            <;> ring_nf
            <;> norm_num
            <;> linarith
          <;> simp_all [esymm, Multiset.map_replicate, Multiset.sum_replicate, Nat.cast_one, Nat.cast_mul, Nat.cast_add, Nat.cast_zero]
          <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
          <;> ring_nf
          <;> norm_num
          <;> simp_all [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
          <;> field_simp [Nat.factorial_succ, Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
          <;> ring_nf
          <;> norm_num
          <;> linarith
        exact h₆
      exact h₆
    exact ⟨h₁, h₂⟩
  exact h_main