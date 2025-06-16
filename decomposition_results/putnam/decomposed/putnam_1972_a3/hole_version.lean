macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1972_a3
    (climit_exists : (ℕ → ℝ) → Prop)
    (supercontinuous : (ℝ → ℝ) → Prop)
    (hclimit_exists : ∀ x, climit_exists x ↔ ∃ C : ℝ, Tendsto (fun n => (∑ i in Finset.range n, (x i))/(n : ℝ)) atTop (𝓝 C))
    (hsupercontinuous : ∀ f, supercontinuous f ↔ ∀ (x : ℕ → ℝ), (∀ i : ℕ, x i ∈ Icc 0 1) → climit_exists x → climit_exists (fun i => f (x i))) :
    {f | supercontinuous f} = (({f | ∃ A B : ℝ, ∀ x ∈ Set.Icc 0 1, f x = A * x + B}) : Set (ℝ → ℝ) ) := by
  have h₁ : {f | supercontinuous f} = {f | ∃ (A B : ℝ), ∀ x ∈ Set.Icc 0 1, f x = A * x + B} := by
    
    apply Set.ext
    intro f
    simp only [Set.mem_setOf_eq, Set.mem_setOf_eq]
    constructor
    
    · intro hf
      
      have h₂ : supercontinuous f := hf
      
      have h₃ : ∀ (x : ℕ → ℝ), (∀ i : ℕ, x i ∈ Icc 0 1) → climit_exists x → climit_exists (fun i => f (x i)) := (hsupercontinuous f).mp h₂
      
      
      sorry
    
    · intro hf
      
      have h₂ : ∃ (A B : ℝ), ∀ x ∈ Set.Icc 0 1, f x = A * x + B := hf
      
      have h₃ : supercontinuous f := by
        
        have h₄ : ∀ (x : ℕ → ℝ), (∀ i : ℕ, x i ∈ Icc 0 1) → climit_exists x → climit_exists (fun i => f (x i)) := by
          
          hole_4
        
        hole_3
      
      
      hole_2
  
  hole_1