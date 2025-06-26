import Mathlib

open Set Topology Filter

-- fun k => ((k+1)/k)^k
/--
Let $k$ be an integer greater than 1. Suppose $a_0 > 0$, and define \[ a_{n+1} = a_n + \frac{1}{\sqrt[k]{a_n}} \] for $n > 0$. Evaluate \[\lim_{n \to \infty} \frac{a_n^{k+1}}{n^k}.\]
-/
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
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

theorem putnam_2006_b6
(k : ℕ)
(hk : k > 1)
(a : ℕ → ℝ)
(ha0 : a 0 > 0)
(ha : ∀ n : ℕ, a (n + 1) = a n + 1/((a n)^((1 : ℝ)/k)))
: Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 (((fun k => ((k+1)/k)^k) : ℕ → ℝ ) k)) := by
  have h_main : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
    have h₁ : ∀ n : ℕ, a n > 0 := by
      hole_5
    have h₂ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := by
      hole_6
    have h₃ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
      
      
      
      have h₄ : k ≥ 1 := by hole_7
      have h₅ : (k : ℝ) ≥ 1 := by hole_8
      have h₆ : (k : ℝ) > 0 := by hole_9
      have h₇ : (k : ℝ) + 1 > 0 := by hole_10
      have h₈ : ((k : ℝ) + 1) / k > 0 := by hole_11
      
      
      
      have h₉ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
        
        
        
        have h₁₀ : ∀ n : ℕ, a n > 0 := h₁
        have h₁₁ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := h₂
        
        
        
        have h₁₂ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
          
          
          
          have h₁₃ : ∀ n : ℕ, a n > 0 := h₁
          have h₁₄ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := h₂
          
          
          
          have h₁₅ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
            
            
            
            have h₁₆ : ∀ n : ℕ, a n > 0 := h₁
            have h₁₇ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := h₂
            
            
            
            have h₁₈ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
              
              
              
              have h₁₉ : ∀ n : ℕ, a n > 0 := h₁
              have h₂₀ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := h₂
              
              
              
              have h₂₁ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
                
                
                
                have h₂₂ : ∀ n : ℕ, a n > 0 := h₁
                have h₂₃ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := h₂
                
                
                
                have h₂₄ : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 ((((k:ℝ)+1)/k)^k)) := by
                  
                  
                  
                  have h₂₅ : ∀ n : ℕ, a n > 0 := h₁
                  have h₂₆ : ∀ n : ℕ, a (n + 1) = a n + 1 / (a n) ^ ((1 : ℝ) / k) := h₂
                  
                  
                  
                  hole_12
                hole_13
              hole_14
            hole_15
          hole_16
        hole_17
      hole_18
    hole_19
  have h_final : Tendsto (fun n => (a n)^(k+1)/(n ^ k)) atTop (𝓝 (((fun k => ((k+1)/k)^k) : ℕ → ℝ ) k)) := by
    have h₁ : (((fun k => ((k+1)/k)^k) : ℕ → ℝ ) k) = ((((k:ℝ)+1)/k)^k) := by
      hole_20
    hole_21
  hole_22