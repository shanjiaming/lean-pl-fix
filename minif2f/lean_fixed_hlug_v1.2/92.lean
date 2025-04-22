import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $n>1$ is an integer, the notation $a\equiv b\pmod{n}$ means that $(a-b)$ is a multiple of $n$. 
Find the sum of all possible values of $n$ such that both of the following are true: 
$171\equiv80\pmod{n}$ and $468\equiv13\pmod{n}$. Show that it is 111.-/
theorem mathd_numbertheory_303 (S : Finset ℕ)
  (h₀ : ∀ n : ℕ, n ∈ S ↔ 2 ≤ n ∧ 171 ≡ 80 [MOD n] ∧ 468 ≡ 13 [MOD n]) : (∑ k in S, k) = 111 := by
  -- First, we'll find all natural numbers n > 1 that satisfy both congruences
  -- From 171 ≡ 80 [MOD n], we get n divides (171 - 80) = 91
  have h₁ : ∀ n, 171 ≡ 80 [MOD n] ↔ n ∣ (171 - 80) := by exact fun n => Int.modEq_iff_dvd
  -- Similarly, from 468 ≡ 13 [MOD n], we get n divides (468 - 13) = 455
  have h₂ : ∀ n, 468 ≡ 13 [MOD n] ↔ n ∣ (468 - 13) := by exact fun n => Int.modEq_iff_dvd
  
  -- Compute the differences
  have h₃ : 171 - 80 = 91 := by norm_num
  have h₄ : 468 - 13 = 455 := by norm_num
  
  -- So n must be a common divisor of both 91 and 455
  -- First, find all divisors of 91
  have h₅ : Nat.divisors 91 = {1, 7, 13, 91} := by decide
  -- Then find all divisors of 455
  have h₆ : Nat.divisors 455 = {1, 5, 7, 13, 35, 65, 91, 455} := by decide
  
  -- The common divisors are the intersection of these two sets
  have h₇ : {1, 7, 13, 91} ∩ {1, 5, 7, 13, 35, 65, 91, 455} = {1, 7, 13, 91} := by decide
  
  -- Since we need n > 1, we consider {7, 13, 91}
  -- Now we need to verify that S is exactly {7, 13, 91}
  -- First prove that S contains these elements
  have h₈ : 7 ∈ S := by
    rw [h₀]
    refine ⟨by norm_num, ?_, ?_⟩
    · rw [h₁, h₃]
      exact dvd_of_div_eq_one (by norm_num)
    · rw [h₂, h₄]
      exact dvd_of_div_eq_one (by norm_num)
  
  have h₉ : 13 ∈ S := by
    rw [h₀]
    refine ⟨by norm_num, ?_, ?_⟩
    · rw [h₁, h₃]
      exact dvd_of_div_eq_one (by norm_num)
    · rw [h₂, h₄]
      exact dvd_of_div_eq_one (by norm_num)
  
  have h₁₀ : 91 ∈ S := by
    rw [h₀]
    refine ⟨by norm_num, ?_, ?_⟩
    · rw [h₁, h₃]
      exact dvd_of_div_eq_one (by norm_num)
    · rw [h₂, h₄]
      exact dvd_of_div_eq_one (by norm_num)
  
  -- Now prove that S doesn't contain any other elements
  have h₁₁ : ∀ n ∈ S, n ∈ {7, 13, 91} := by
    intro n hn
    rw [h₀] at hn
    rcases hn with ⟨hle, hn₁, hn₂⟩
    rw [h₁, h₃] at hn₁
    rw [h₂, h₄] at hn₂
    have hn_common : n ∈ Nat.divisors 91 ∧ n ∈ Nat.divisors 455 := ⟨hn₁, hn₂⟩
    rw [h₅, h₆] at hn_common
    simp at hn_common
    have hn_gt_1 : 1 < n := hle
    rcases hn_common with ⟨h, _⟩
    simp [Finset.mem_insert, Finset.mem_singleton] at h
    rcases h with (rfl | rfl | rfl | rfl)
    · contradiction  -- excludes n = 1
    · exact Or.inl rfl
    · exact Or.inr (Or.inl rfl)
    · exact Or.inr (Or.inr rfl)
  
  -- Now we can characterize S exactly
  have h₁₂ : S = {7, 13, 91} := by
    apply Finset.ext
    intro n
    constructor
    · intro hn
      exact h₁₁ n hn
    · intro hn
      simp at hn
      rcases hn with (rfl | rfl | rfl)
      · exact h₈
      · exact h₉
      · exact h₁₀
  
  -- Finally, compute the sum
  rw [h₁₂]
  -- Calculate 7 + 13 + 91 = 111
  norm_num