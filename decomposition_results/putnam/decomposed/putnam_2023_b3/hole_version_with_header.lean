import Mathlib

open ProbabilityTheory Set

-- (fun n : ℕ ↦ (2 * (n : ℝ) + 2) / 3)
/--
A sequence $y_1, y_2, \ldots, y_k$ of real numbers is called zigzag if $k = 1$, or if $y_2 - y_1, y_3 - y_2, \ldots, y_k - y_{k-1}$ are nonzero and alternate in sign. Let $X_1, X_2,\ldots, X_n$ be chosen independently from the uniform distribution on $[0,1]$. Let $a(X_1, X_2, \ldots, X_n)$ be the largest value of $k$ for which there exists an increasing sequence of integers $i_1, i_2, \ldots, i_k$ such that $X_{i_1}, X_{i_2}, \ldots, X_{i_k}$ is zigzag. Find the expected value of $a(X_1, X_2, \ldots, X_n)$ for $n \ge 2$.
-/
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

theorem putnam_2023_b3
    (IsZigZag : {k : ℕ} → (Fin k → ℝ) → Prop)
    (IsZigZag_def : ∀ (k : ℕ) [NeZero k] (y : Fin k → ℝ),
      IsZigZag y ↔ k = 1 ∨ ((∀ i, i + 1 < k → y (i + 1) ≠ y i)) ∧
        (∀ i, i + 2 < k → (y (i + 2) < y (i + 1) ↔ y i < y (i + 1))))
    (n : ℕ)
    (hn : 2 ≤ n)
    (a : (Fin n → Icc (0 : ℝ) 1) → ℕ)
    (ha : ∀ x, IsGreatest {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ x ∘ i)} (a x)) :
    𝔼[(↑) ∘ a] = ((fun n : ℕ ↦ (2 * (n : ℝ) + 2) / 3) : ℕ → ℝ ) n := by
  have h₁ : False := by
    have h₂ : n ≥ 2 := hn
    have h₃ : ∀ x, IsGreatest {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ x ∘ i)} (a x) := ha
    
    
    have h₄ : n ≥ 2 := hn
    
    have h₅ : n ≥ 2 := hn
    
    have h₆ : False := by
      by_contra h
      
      have h₇ : n ≥ 2 := hn
      
      have h₈ : ∃ (x : Fin n → Icc (0 : ℝ) 1), a x > (2 * n + 2 : ℝ) / 3 := by
        
        
        use fun i => ⟨1, by
          norm_num
          <;>
          (try norm_num) <;>
          (try linarith) <;>
          (try omega)⟩
        
        have h₉ : a (fun i => ⟨1, by
          norm_num
          <;>
          (try norm_num) <;>
          (try linarith) <;>
          (try omega)⟩) ≥ 1 := by
          
          have h₁₀ : 1 ∈ {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ (fun i => ⟨1, by
            norm_num
            <;>
            (try norm_num) <;>
            (try linarith) <;>
            (try omega)⟩ : Fin n → Icc (0 : ℝ) 1) ∘ i)} := by
            
            use
              (by
                refine' (Fin.castLE _)
                <;> omega)
            
            have h₁₁ : IsZigZag ((↑) ∘ (fun i => ⟨1, by
              norm_num
              <;>
              (try norm_num) <;>
              (try linarith) <;>
              (try omega)⟩ : Fin n → Icc (0 : ℝ) 1) ∘ (by
                refine' (Fin.castLE _)
                <;> omega)) := by
              
              have h₁₂ : IsZigZag ((↑) ∘ (fun i => ⟨1, by
                hole_1
              hole_2
            hole_3
          
          have h₁₃ : IsGreatest {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ (fun i => ⟨1, by
            hole_4
          
          have h₁₄ : 1 ≤ a (fun i => ⟨1, by
            norm_num
            <;>
            (try norm_num) <;>
            (try linarith) <;>
            (try omega)⟩) := by
            
            have h₁₅ : 1 ∈ {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ (fun i => ⟨1, by
              norm_num
              <;>
              (try norm_num) <;>
              (try linarith) <;>
              (try omega)⟩ : Fin n → Icc (0 : ℝ) 1) ∘ i)} := h₁₀
            have h₁₆ : IsGreatest {k | ∃ i : Fin k ↪o Fin n, IsZigZag ((↑) ∘ (fun i => ⟨1, by
              norm_num
              <;>
              (try norm_num) <;>
              (try linarith) <;>
              (try omega)⟩ : Fin n → Icc (0 : ℝ) 1) ∘ i)} (a (fun i => ⟨1, by
              norm_num
              <;>
              (try norm_num) <;>
              (try linarith) <;>
              (try omega)⟩)) := h₁₃
            have h₁₇ : 1 ≤ a (fun i => ⟨1, by
              hole_5
            hole_6
          hole_7
        
        have h₁₀ : (a (fun i => ⟨1, by
          norm_num
          <;>
          (try norm_num) <;>
          (try linarith) <;>
          (try omega)⟩) : ℝ) > (2 * n + 2 : ℝ) / 3 := by
          
          have h₁₁ : (a (fun i => ⟨1, by
            hole_8
          have h₁₂ : (a (fun i => ⟨1, by
            norm_num
            <;>
            (try norm_num) <;>
            (try linarith) <;>
            (try omega)⟩) : ℝ) > (2 * n + 2 : ℝ) / 3 := by
            
            have h₁₃ : n ≥ 2 := hn
            have h₁₄ : (n : ℝ) ≥ 2 := by hole_9
            have h₁₅ : (2 * n + 2 : ℝ) / 3 ≤ (n : ℝ) := by
              
              hole_10
            have h₁₆ : (a (fun i => ⟨1, by
              norm_num
              <;>
              (try norm_num) <;>
              (try linarith) <;>
              (try omega)⟩) : ℝ) > (2 * n + 2 : ℝ) / 3 := by
              
              have h₁₇ : (a (fun i => ⟨1, by
                norm_num
                <;>
                (try norm_num) <;>
                (try linarith) <;>
                (try omega)⟩) : ℝ) ≥ 1 := h₁₁
              have h₁₈ : (a (fun i => ⟨1, by
                norm_num
                <;>
                (try norm_num) <;>
                (try linarith) <;>
                (try omega)⟩) : ℝ) > (2 * n + 2 : ℝ) / 3 := by
                
                by_contra h₁₉
                have h₂₀ : (a (fun i => ⟨1, by
                  hole_11
                have h₂₁ : (a (fun i => ⟨1, by
                  norm_num
                  <;>
                  (try norm_num) <;>
                  (try linarith) <;>
                  (try omega)⟩) : ℝ) ≤ (2 * n + 2 : ℝ) / 3 := h₂₀
                have h₂₂ : (a (fun i => ⟨1, by
                  norm_num
                  <;>
                  (try norm_num) <;>
                  (try linarith) <;>
                  (try omega)⟩) : ℝ) ≥ 1 := h₁₁
                have h₂₃ : (2 * n + 2 : ℝ) / 3 < 1 := by
                  
                  hole_12
                hole_13
              hole_14
            hole_15
          hole_16
        
        have h₁₁ : a (fun i => ⟨1, by
          hole_17
        
        hole_18
      
      obtain ⟨x, hx⟩ := h₈
      
      have h₉ : a x > (2 * n + 2 : ℝ) / 3 := hx
      
      have h₁₀ : False := by
        
        hole_19
      
      hole_20
    
    hole_21
  
  have h₂ : 𝔼[(↑) ∘ a] = ((fun n : ℕ ↦ (2 * (n : ℝ) + 2) / 3) : ℕ → ℝ ) n := by
    hole_22
  
  hole_23