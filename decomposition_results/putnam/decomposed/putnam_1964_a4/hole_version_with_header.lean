import Mathlib

open Set Function

/--
The sequence of integers $u_n$ is bounded and satisfies
\[
u_n = \frac{u_{n-1} + u_{n-2} + u_{n-3}u_{n-4}}{u_{n-1}u_{n-2} + u_{n-3} + u_{n-4}}.
\]
Show that it is periodic for sufficiently large $n$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)

theorem putnam_1964_a4
(u : ℕ → ℤ)
(boundedu : ∃ B T : ℤ, ∀ n : ℕ, B ≤ u n ∧ u n ≤ T)
(hu : ∀ n ≥ 4, u n = ((u (n - 1) + u (n - 2) + u (n - 3) * u (n - 4)) : ℝ) / (u (n - 1) * u (n - 2) + u (n - 3) + u (n - 4)) ∧ (u (n - 1) * u (n - 2) + u (n - 3) + u (n - 4)) ≠ 0)
: (∃ N c : ℕ, c > 0 ∧ ∀ n ≥ N, u (n + c) = u n) := by
  have h_main : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
    obtain ⟨B, T, h_bounds⟩ := boundedu
    have h₁ : B ≤ T := by
      have h₂ := h_bounds 0
      have h₃ : B ≤ u 0 := h₂.1
      have h₄ : u 0 ≤ T := h₂.2
      hole_1
    
    have h₂ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
      have h₃ : ∀ n : ℕ, B ≤ u n := by
        hole_2
      have h₄ : ∀ n : ℕ, u n ≤ T := by
        hole_3
      
      have h₅ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
        
        have h₆ : B ≤ T := h₁
        
        have h₇ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
          
          have h₈ : ∀ n : ℕ, B ≤ u n := h₃
          have h₉ : ∀ n : ℕ, u n ≤ T := h₄
          
          
          
          
          
          
          have h₁₀ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
            
            
            
            classical
            
            have h₁₁ : Set.Finite (Set.range fun n : ℕ => (u n, u (n + 1), u (n + 2), u (n + 3))) := by
              
              have h₁₂ : Set.Finite (Set.range fun n : ℕ => (u n, u (n + 1), u (n + 2), u (n + 3))) := by
                
                have h₁₃ : (Set.range fun n : ℕ => (u n, u (n + 1), u (n + 2), u (n + 3))) ⊆ Set.Icc (B, B, B, B) (T, T, T, T) := by
                  hole_4
                
                have h₁₄ : Set.Finite (Set.Icc (B, B, B, B) (T, T, T, T)) := by
                  hole_5
                
                hole_6
              
              hole_7
            
            have h₁₅ : ∃ (N c : ℕ), c > 0 ∧ ∀ n ≥ N, u (n + c) = u n := by
              
              hole_8
            
            exact h₁₅
          
          hole_10
        
        hole_11
      
      hole_12
    
    hole_13
  hole_14