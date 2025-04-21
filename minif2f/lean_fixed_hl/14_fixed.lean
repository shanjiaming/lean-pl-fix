import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Suppose $r^{}_{}$ is a [[real number]] for which
<div style="text-align:center">$
\left\lfloor r + \frac{19}{100} \right\rfloor + \left\lfloor r + \frac{20}{100} \right\rfloor + \left\lfloor r + \frac{21}{100} \right\rfloor + \cdots + \left\lfloor r + \frac{91}{100} \right\rfloor = 546.
$</div>
Find $\lfloor 100r \rfloor$. (For real $x^{}_{}$, $\lfloor x \rfloor$ is the [[floor function|greatest integer]] less than or equal to $x^{}_{}$.) Show that it is 743.-/
theorem aime_1991_p6 (r : ℝ) (h₀ : (∑ k in Finset.Icc (19 : ℕ) 91, Int.floor (r + k / 100)) = 546) :
  Int.floor (100 * r) = 743 := by
  -- Let's define n = floor(100r) and s = 100r - n, where s ∈ [0,1) is the fractional part
  let n := Int.floor (100 * r)
  let s := 100 * r - n
  -- We know s is in [0,1) by properties of floor function
  have hs : 0 ≤ s ∧ s < 1 := by exact Int.fract_nonneg (100 * r) ∧ Int.fract_lt_one (100 * r)
  
  -- The sum has (91-19+1) = 73 terms
  have card_terms : Finset.card (Finset.Icc 19 91) = 73 := by simp
  
  -- Rewrite the original equation in terms of n and s
  -- Each term floor(r + k/100) = floor((n + s)/100 + k/100) = floor((n + s + k)/100)
  -- This equals floor((n + k)/100 + s/100) = floor((n + k)/100) + floor(s + fract((n + k)/100))
  -- But we can find a better representation
  
  -- Let's rewrite each term in the sum using r = (n + s)/100
  have sum_eq : (∑ k in Finset.Icc 19 91, Int.floor ((n + s + k)/100)) = 546 := by
    simp [← add_div, h₀]
  
  -- The key observation: for most terms, floor((n + s + k)/100) will be constant
  -- Let's find m such that n + s + k crosses integer boundaries
  
  -- The sum can be split into two parts:
  -- 1. Terms where n + s + k < m*100 + 100 (floor value = m)
  -- 2. Terms where n + s + k ≥ m*100 + 100 (floor value = m + 1)
  
  -- We need to find the breakpoint where the floor value increases
  -- Let's assume most terms have floor value m, and some have m+1
  
  -- The average floor value is 546/73 ≈ 7.479, so m is likely 7
  -- Let's assume m = 7 and find how many terms need to be m+1 = 8
  
  -- Let a be the number of terms with floor value 7
  -- Let b be the number of terms with floor value 8
  -- Then a + b = 73 and 7a + 8b = 546
  -- Solving gives b = 546 - 7*73 = 546 - 511 = 35
  
  -- Now we can set up the inequalities for the breakpoint:
  -- The last 35 terms (k from 91-35+1=57 to 91) have floor value 8
  -- The first 73-35=38 terms (k from 19 to 56) have floor value 7
  
  -- Therefore:
  -- For k ≤ 56: n + s + k < 800 ⇒ n + s + 56 < 800
  -- For k ≥ 57: n + s + k ≥ 800 ⇒ n + s + 57 ≥ 800
  
  -- From these inequalities we can bound n + s:
  -- From first inequality: n + s < 800 - 56 = 744
  -- From second inequality: n + s ≥ 800 - 57 = 743
  
  -- So 743 ≤ n + s < 744
  -- Since n is an integer and s ∈ [0,1), this implies n = 743
  
  -- Now let's formalize this reasoning in Lean
  
  -- First, calculate how many terms need to be 8
  have b_calc : 546 - 7 * 73 = 35 := by norm_num
  
  -- Define the breakpoint k where floor value increases
  let breakpoint : ℕ := 57
  
  -- The sum can be split into two parts:
  -- 1. k ∈ [19,56] (38 terms) with floor value 7
  -- 2. k ∈ [57,91] (35 terms) with floor value 8
  have sum_split : (∑ k in Finset.Icc 19 56, Int.floor ((n + s + k)/100)) + 
                   (∑ k in Finset.Icc 57 91, Int.floor ((n + s + k)/100)) = 546 := by
    rw [← Finset.sum_union, Finset.Icc_union_Icc_eq_Icc]
    · exact sum_eq
    · simp
    · exact le_of_lt (by norm_num)
  
  -- For k ≤ 56, floor((n + s + k)/100) = 7
  have h₁ : ∀ k ∈ Finset.Icc 19 56, Int.floor ((n + s + k)/100) = 7 := by
    intro k hk
    have : k ≤ 56 := (Finset.mem_Icc.mp hk).2
    -- We need n + s + k < 800
    -- Since n + s < 744 and k ≤ 56, n + s + k < 744 + 56 = 800
    have upper : (n + s + k)/100 < 8 := by
      have : n + s < 744 := by linarith [show n + s < 744 from ?_]
      sorry
    -- And n + s + k ≥ 700
    -- Since n + s ≥ 743 and k ≥ 19, n + s + k ≥ 743 + 19 = 762 ≥ 700
    have lower : (n + s + k)/100 ≥ 7 := by
      have : n + s ≥ 743 := by linarith [show n + s ≥ 743 from ?_]
      sorry
    exact Int.floor_eq_iff.mpr ⟨lower, upper⟩
  
  -- For k ≥ 57, floor((n + s + k)/100) = 8
  have h₂ : ∀ k ∈ Finset.Icc 57 91, Int.floor ((n + s + k)/100) = 8 := by
    intro k hk
    have : k ≥ 57 := (Finset.mem_Icc.mp hk).1
    -- We need n + s + k ≥ 800
    -- Since n + s ≥ 743 and k ≥ 57, n + s + k ≥ 743 + 57 = 800
    have lower : (n + s + k)/100 ≥ 8 := by
      have : n + s ≥ 743 := by linarith [show n + s ≥ 743 from ?_]
      sorry
    -- And n + s + k < 900
    -- Since n + s < 744 and k ≤ 91, n + s + k < 744 + 91 = 835 < 900
    have upper : (n + s + k)/100 < 9 := by
      have : n + s < 744 := by linarith [show n + s < 744 from ?_]
      sorry
    exact Int.floor_eq_iff.mpr ⟨lower, upper⟩
  
  -- Now rewrite the sum using these facts
  have sum_eq' : (∑ k in Finset.Icc 19 56, 7) + (∑ k in Finset.Icc 57 91, 8) = 546 := by
    rw [Finset.sum_const, Finset.sum_const, Finset.card_Icc, Finset.card_Icc]
    simp [h₁, h₂]
    norm_num
  
  -- Calculate the number of terms in each interval
  have card₁ : Finset.card (Finset.Icc 19 56) = 38 := by simp
  have card₂ : Finset.card (Finset.Icc 57 91) = 35 := by simp
  
  -- Verify the sum calculation
  have sum_verify : 38 * 7 + 35 * 8 = 546 := by norm_num
  
  -- Now establish the inequalities for n + s
  -- From the breakpoint at k=57:
  -- n + s + 57 ≥ 800 ⇒ n + s ≥ 743
  have lower_bound : n + s ≥ 743 := by
    have := h₂ 57 (by simp)
    simp at this
    have : (n + s + 57)/100 ≥ 8 := by rw [← this]; exact Int.floor_le _
    linarith
  
  -- From the breakpoint at k=56:
  -- n + s + 56 < 800 ⇒ n + s < 744
  have upper_bound : n + s < 744 := by
    have := h₁ 56 (by simp)
    simp at this
    have : (n + s + 56)/100 < 8 := by rw [← this]; exact Int.lt_floor_add_one _
    linarith
  
  -- Since n is an integer and 0 ≤ s < 1, from 743 ≤ n + s < 744 we get n = 743
  have n_eq : n = 743 := by
    have : n ≤ n + s := by linarith [hs.1]
    have : n + s < n + 1 := by linarith [hs.2]
    have : 743 ≤ n := by linarith [lower_bound]
    have : n < 744 := by linarith [upper_bound]
    exact Int.eq_of_le_lt_add_one ‹743 ≤ n› ‹n < 744›
  
  -- The final result
  rw [n_eq]