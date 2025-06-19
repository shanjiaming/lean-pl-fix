macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)

macro "hole_10" : tactic => `(tactic| admit)

theorem putnam_2017_b3
(f : ℝ → ℝ)
(c : ℕ → ℝ)
(hc : ∀ n, c n = 0 ∨ c n = 1)
(hf : ∀ x, f x = ∑' n : ℕ, (c n) * x^n)
: f (2/3) = 3/2 → Irrational (f 1/2) := by
  intro h₁
  have h₂ : False := by
    
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      admit
    
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by
      have h₄ : f (2 / 3 : ℝ) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := by
        admit
      linarith
    
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by
      by_contra! h₅
      have h₆ : ∀ (N : ℕ), ∃ (n : ℕ), n ≥ N ∧ c n ≠ 0 := by simpa
      have h₇ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0 := by
        
        admit
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      have h₇ : ∀ (n : ℕ), n ≥ N → (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0 := by
        intro n hn
        have h₈ : c n = 0 := hN n hn
        simpa
      admit
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by admit
    have h₈ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₉ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      admit
    have h₁₀ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      admit
    
    have h₁₁ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by
      admit
    
    have h₁₃ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 := by
      admit
    
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by
        
        admit
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by
        
        admit
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        admit
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        admit
      
      admit
    
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      admit
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      admit
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      admit
    
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      
      have h₂₁ := h₁₉
      admit
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      admit
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
      
      have h₂₃ : (3 : ℕ) % 2 = 1 := by norm_num
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 := by
            admit
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by admit
            admit
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
            have h₃₁ : N - 1 ≥ 0 := by admit
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
              have h₃₃ : N - 1 ≥ 0 := by admit
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                admit
              admit
            admit
          admit
        admit
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        admit
      admit
    have h₂₃ : (k : ℕ) % 2 = 0 := by
      
      admit
    admit
  have h₃ : Irrational (f 1/2) := by
    norm_cast
  simpa
