import Mathlib

open Topology Filter

/--
Suppose that $f(x) = \sum_{i=0}^\infty c_i x^i$ is a power series for which each coefficient $c_i$ is $0$ or $1$. Show that if $f(2/3) = 3/2$, then $f(1/2)$ must be irrational.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
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
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
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
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)

theorem putnam_2017_b3
(f : ℝ → ℝ)
(c : ℕ → ℝ)
(hc : ∀ n, c n = 0 ∨ c n = 1)
(hf : ∀ x, f x = ∑' n : ℕ, (c n) * x^n)
: f (2/3) = 3/2 → Irrational (f 1/2) := by
  intro h₁
  have h₂ : False := by
    
    have h_sum : Summable fun n : ℕ => (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      hole_1
    
    have h₃ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = (3 / 2 : ℝ) := by
      have h₄ : f (2 / 3 : ℝ) = (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := by
        hole_2
      hole_3
    
    have h₄ : ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N → c n = 0 := by
      by_contra! h₅
      have h₆ : ∀ (N : ℕ), ∃ (n : ℕ), n ≥ N ∧ c n ≠ 0 := by hole_4
      have h₇ : ∃ (u : ℕ → ℕ), StrictMono u ∧ ∀ (n : ℕ), c (u n) ≠ 0 := by
        
        hole_7
    have h₆ : (∑' n : ℕ, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) = ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n := by
      have h₇ : ∀ (n : ℕ), n ≥ N → (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = 0 := by
        intro n hn
        have h₈ : c n = 0 := hN n hn
        hole_9
      hole_11
    rw [h₆] at h₃
    have h₇ : ∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n = (3 / 2 : ℝ) := by hole_12
    have h₈ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n) := rfl
    have h₉ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      hole_13
    have h₁₀ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := by
      hole_14
    
    have h₁₁ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) =
      (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    
    have h₁₂ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (3 / 2 : ℝ) := by
      hole_15
    
    have h₁₃ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) := rfl
    
    have h₁₄ : ∀ n ∈ Finset.range N, c n = 0 ∨ c n = 1 := by
      hole_16
    
    have h₁₅ : ∃ (k : ℕ), (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      
      use (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) |>.toNat
      have h₁₆ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) ≥ 0 := by
        
        hole_17
      have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) ≥ 0 := by
        
        hole_18
      have h₁₈ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        hole_19
      have h₁₉ : ((∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) * (3 : ℝ) ^ (N - 1) : ℝ) ≥ 0 := by
        hole_20
      
      hole_21
    
    obtain ⟨k, h₁₆⟩ := h₁₅
    have h₁₇ : (∑ n in Finset.range N, (c n : ℝ) * ((2 / 3 : ℝ) : ℝ) ^ n : ℝ) = (k : ℝ) / (3 : ℝ) ^ (N - 1) := by
      hole_22
    have h₁₈ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      hole_23
    have h₁₉ : (k : ℝ) / (3 : ℝ) ^ (N - 1) = (3 / 2 : ℝ) := by
      hole_24
    
    have h₂₀ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      
      have h₂₁ := h₁₉
      hole_25
    have h₂₁ : (k : ℕ) = (3 : ℕ) * (3 : ℕ) ^ (N - 1) / 2 := by
      hole_26
    have h₂₂ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
      
      have h₂₃ : (3 : ℕ) % 2 = 1 := by hole_27
      have h₂₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        
        have h₂₅ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
          have h₂₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℕ) ^ n % 2 = 1 := by
            hole_28
          have h₂₇ : N ≥ 1 := by
            by_contra h₂₈
            have h₂₉ : N = 0 := by hole_29
            hole_30
          have h₃₀ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
            have h₃₁ : N - 1 ≥ 0 := by hole_31
            have h₃₂ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
              have h₃₃ : N - 1 ≥ 0 := by hole_32
              have h₃₄ : (3 : ℕ) ^ (N - 1) % 2 = 1 := by
                hole_33
              hole_34
            hole_35
          hole_36
        hole_37
      have h₂₈ : (3 : ℕ) * (3 : ℕ) ^ (N - 1) % 2 = 1 := by
        hole_38
      hole_39
    have h₂₃ : (k : ℕ) % 2 = 0 := by
      
      hole_40
    hole_41
  have h₃ : Irrational (f 1/2) := by
    hole_42
  hole_43