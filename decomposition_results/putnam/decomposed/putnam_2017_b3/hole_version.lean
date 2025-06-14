macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2017_b3
(f : ℝ → ℝ)
(c : ℕ → ℝ)
(hc : ∀ n, c n = 0 ∨ c n = 1)
(hf : ∀ x, f x = ∑' n : ℕ, (c n) * x^n)
: f (2/3) = 3/2 → Irrational (f 1/2) := by
  intro h₁
  have h₂ : False := by
    
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      hole_3
    
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by
      have h₄ : f (2 / 3 : ℝ) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := by
        hole_5
      hole_4
    
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by
      by_contra! h₅
      have h₆ : ∀ (N : ℕ), ∃ (n : ℕ), n ≥ N ∧ c n ≠ 0 := by hole_7
      have h₇ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0 := by
        
        hole_8
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      have h₇ : ∀ (n : ℕ), n ≥ N → (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0 := by
        intro n hn
        have h₈ : c n = 0 := hN n hn
        hole_12
      hole_11
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by hole_14
    have h₈ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₉ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      hole_15
    have h₁₀ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      hole_16
    
    have h₁₁ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by
      hole_17
    
    have h₁₃ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 := by
      hole_18
    
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by
        
        hole_20
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by
        
        hole_21
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        hole_22
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        hole_23
      
      hole_19
    
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      hole_24
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      hole_25
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      hole_26
    
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      
      have h₂₁ := h₁₉
      hole_27
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      hole_28
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
      
      have h₂₃ : (3 : ℕ) % 2 = 1 := by hole_30
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 := by
            hole_33
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by hole_35
            hole_34
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
            have h₃₁ : N - 1 ≥ 0 := by hole_37
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
              have h₃₃ : N - 1 ≥ 0 := by hole_39
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                hole_40
              hole_38
            hole_36
          hole_32
        hole_31
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        hole_41
      hole_29
    have h₂₃ : (k : ℕ) % 2 = 0 := by
      
      hole_42
    hole_2
  have h₃ : Irrational (f 1/2) := by
    hole_43
  hole_1