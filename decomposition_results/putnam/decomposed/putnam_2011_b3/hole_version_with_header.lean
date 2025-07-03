import Mathlib

open Topology Filter Matrix

-- True
/--
Let $f$ and $g$ be (real-valued) functions defined on an open interval containing $0$, with $g$ nonzero and continuous at $0$. If $fg$ and $f/g$ are differentiable at $0$, must $f$ be differentiable at $0$?
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

theorem putnam_2011_b3 :
  ((∀ f g : ℝ → ℝ,
    g 0 ≠ 0 → ContinuousAt g 0 →
    DifferentiableAt ℝ (fun x ↦ f x * g x) 0 →
    DifferentiableAt ℝ (fun x ↦ f x / g x) 0 →
    (DifferentiableAt ℝ f 0))
  ↔ ((True) : Prop )) := by
  have h_forward : (∀ (f g : ℝ → ℝ), g 0 ≠ 0 → ContinuousAt g 0 → DifferentiableAt ℝ (fun x => f x * g x) 0 → DifferentiableAt ℝ (fun x => f x / g x) 0 → DifferentiableAt ℝ f 0) → True := by
    hole_1

  have h_backward : True → (∀ (f g : ℝ → ℝ), g 0 ≠ 0 → ContinuousAt g 0 → DifferentiableAt ℝ (fun x => f x * g x) 0 → DifferentiableAt ℝ (fun x => f x / g x) 0 → DifferentiableAt ℝ f 0) := by
    intro h
    intro f g hg0 hg_cont hfg_diff hf_divg_diff
    have h₁ : DifferentiableAt ℝ f 0 := by
      
      have h₂ : DifferentiableAt ℝ (fun x => f x - f 0) 0 := by
        
        have h₃ : DifferentiableAt ℝ (fun x => (f x - f 0) * g x) 0 := by
          have h₄ : (fun x => (f x - f 0) * g x) = (fun x => f x * g x - f 0 * g x) := by
            hole_2
          rw [h₄]
          
          have h₅ : DifferentiableAt ℝ (fun x => f x * g x) 0 := hfg_diff
          have h₆ : DifferentiableAt ℝ (fun x => (f 0 : ℝ) * g x) 0 := by
            hole_3
          hole_4
        
        have h₇ : DifferentiableAt ℝ (fun x => (f x - f 0) / g x) 0 := by
          have h₈ : (fun x => (f x - f 0) / g x) = (fun x => f x / g x - f 0 / g x) := by
            hole_5
          rw [h₈]
          
          have h₉ : DifferentiableAt ℝ (fun x => f x / g x) 0 := hf_divg_diff
          have h₁₀ : DifferentiableAt ℝ (fun x => (f 0 : ℝ) / g x) 0 := by
            hole_6
          hole_7
        
        have h₁₁ : g 0 ≠ 0 := hg0
        have h₁₂ : ContinuousAt g 0 := hg_cont
        have h₁₃ : DifferentiableAt ℝ (fun x => (f x - f 0) * g x) 0 := h₃
        have h₁₄ : DifferentiableAt ℝ (fun x => (f x - f 0) / g x) 0 := h₇
        
        have h₁₅ : DifferentiableAt ℝ (fun x => f x - f 0) 0 := by
          
          have h₁₆ : (fun x => f x - f 0) = fun x => (f x - f 0) := rfl
          have h₁₇ : DifferentiableAt ℝ (fun x => (f x - f 0) * g x) 0 := h₃
          have h₁₈ : DifferentiableAt ℝ (fun x => (f x - f 0) / g x) 0 := h₇
          
          have h₁₉ : DifferentiableAt ℝ (fun x => f x - f 0) 0 := by
            
            have h₂₀ : DifferentiableAt ℝ (fun x => f x - f 0) 0 := by
              
              have h₂₁ : DifferentiableAt ℝ (fun x => (f x - f 0)) 0 := by
                
                have h₂₂ : (fun x => f x - f 0) = fun x => ((fun x => (f x - f 0) / g x) x) * g x := by
                  funext x
                  have h₂₃ : g x ≠ 0 → (f x - f 0) = ((f x - f 0) / g x) * g x := by
                    hole_8
                  by_cases h₂₄ : g x = 0
                  · have h₂₅ : x = 0 := by
                      by_contra h₂₅
                      have h₂₆ : g x ≠ 0 := by
                        have h₂₇ : ContinuousAt g 0 := hg_cont
                        have h₂₈ : ∀ᶠ (x : ℝ) in nhds 0, g x ≠ 0 := by
                          have h₂₉ : ContinuousAt g 0 := hg_cont
                          have h₃₀ : g 0 ≠ 0 := hg0
                          hole_9
                        have h₃₁ : g x ≠ 0 := by
                          have h₃₂ : ∀ᶠ (x : ℝ) in nhds 0, g x ≠ 0 := h₂₈
                          have h₃₃ : g x ≠ 0 := by
                            have h₃₄ : x ∈ nhds 0 := by
                              
                              have h₃₅ : x ≠ 0 := by hole_10
                              hole_11
                            hole_12 at h₃₄
                            aesop
                          exact h₃₃
                        aesop
                      subst_vars
                      simp_all
                    simp_all
                  · have h₂₅ : (f x - f 0) = ((f x - f 0) / g x) * g x := by
                      apply h₂₃
                      exact h₂₄
                    simp_all
                  <;> ring
                  <;> field_simp [h₂₄]
                  <;> ring
                rw [h₂₂]
                have h₂₆ : DifferentiableAt ℝ (fun x => ((fun x => (f x - f 0) / g x) x) * g x) 0 := by
                  apply DifferentiableAt.mul
                  · exact h₁₄
                  · exact hg_cont.differentiableAt (by
                      
                      exact isOpen_univ.mem_nhds (by simp))
                exact h₂₆
              exact h₂₁
            exact h₂₀
          exact h₁₉
        exact h₁₅
      
      have h₂₂ : DifferentiableAt ℝ (fun x => f x - f 0) 0 := h₂
      have h₂₃ : DifferentiableAt ℝ f 0 := by
        have h₂₄ : DifferentiableAt ℝ (fun x => f x - f 0) 0 := h₂
        have h₂₅ : DifferentiableAt ℝ (fun x => (f x - f 0) + f 0) 0 := by
          apply DifferentiableAt.add
          · exact h₂₄
          · exact differentiableAt_const _
        have h₂₆ : (fun x => (f x - f 0) + f 0) = (fun x => f x) := by
          funext x
          ring
        rw [h₂₆] at h₂₅
        exact h₂₅
      exact h₂₃
    exact h₁
  
  constructor
  · intro h
    apply h_forward
    exact h
  · intro h
    apply h_backward
    exact h