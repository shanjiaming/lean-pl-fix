theorem putnam_2002_a6
(f : ℕ → ℕ → ℝ)
(hf : ∀ b : ℕ, f b 1 = 1 ∧ f b 2 = 2 ∧ ∀ n ∈ Ici 3, f b n = n * f b (Nat.digits b n).length)
: {b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} = (({2}) : Set ℕ ) := by
  have h2 : 2 ∈ ({b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} : Set ℕ) := by
    have h2₁ : 2 ∈ Ici 2 := by admit
    have h2₂ : ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f 2 n)) atTop (𝓝 L) := by admit
    admit
  
  have h3 : ∀ (b : ℕ), b ∈ ({b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} : Set ℕ) → b = 2 := by
    intro b hb
    
    have h₀ : b ∈ Ici 2 := hb.1
    have h₁ : ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L) := hb.2
    have h₂ : b ≥ 2 := by admit
    
    by_contra h
    
    have h₃ : b ≠ 2 := h
    have h₄ : b ≥ 3 := by
      admit
    
    have h₅ : b ≥ 3 := h₄
    
    have h₆ : ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L) := h₁
    
    have h₇ : False := by admit
    
    admit
  
  have h4 : ({b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} : Set ℕ) = (({2}) : Set ℕ) := by
    apply Set.Subset.antisymm
    · 
      intro b hb
      have h₁ : b = 2 := h3 b hb
      admit
  
  have h_main : {b ∈ Ici 2 | ∃ L : ℝ, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, 1/(f b n)) atTop (𝓝 L)} = (({2}) : Set ℕ) := by
    admit
  
  admit