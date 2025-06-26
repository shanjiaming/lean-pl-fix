import Mathlib

open Topology Filter Set Polynomial Function

/--
Prove that, for infinitely many positive integers $n$, all primes $p$ that divide $n^2 + 3$ also divide $k^2 + 3$ for some integer $k$ such that $k^2 < n$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)

theorem putnam_1981_b3
    (P : ℕ → Prop)
    (hP : ∀ n, P n ↔
      ∀ p : ℕ, (Nat.Prime p ∧ p ∣ n^2 + 3) →
        ∃ k : ℕ, (p : ℤ) ∣ (k : ℤ)^2 + 3 ∧ k^2 < n) :
    ∀ n : ℕ, ∃ m : ℕ, (m : ℤ) > n ∧ P m :=
  by
  have h_main : ∀ n : ℕ, ∃ m : ℕ, (m : ℤ) > n ∧ P m := by
    intro n
    have h₁ : ∃ m : ℕ, (m : ℤ) > n ∧ P m := by
      
      use 3 * (n + 1)
      constructor
      · 
        norm_num [mul_add, mul_one, add_assoc]
        <;> nlinarith
      · 
        rw [hP]
        intro p hp
        have h₂ : p ∣ (3 * (n + 1)) ^ 2 + 3 := by hole_1
        have h₃ : Nat.Prime p := hp.1
        
        have h₄ : p = 2 ∨ p = 3 ∨ p ≥ 5 := by
          have h₅ := h₃.two_le
          have h₆ := h₃.eq_two_or_odd
          hole_6
        rcases h₄ with (rfl | rfl | h₄)
        · 
          use 1
          constructor
          · 
            norm_num
          · 
            have h₅ : 1 ^ 2 < 3 * (n + 1) := by
              hole_7
            exact h₅
        · 
          use 0
          constructor
          · 
            norm_num
          · 
            have h₅ : 0 ^ 2 < 3 * (n + 1) := by
              hole_8
            exact h₅
        · 
          have h₅ : p ≥ 5 := h₄
          have h₆ : p ∣ (3 * (n + 1)) ^ 2 + 3 := h₂
          have h₇ : ∃ k : ℕ, (p : ℤ) ∣ (k : ℤ) ^ 2 + 3 ∧ k ^ 2 < 3 * (n + 1) := by
            
            use 0
            constructor
            · 
              norm_num at h₆ ⊢
              <;>
              (try omega) <;>
              (try
                {
                  norm_num at h₅ ⊢
                  <;>
                  omega
                }) <;>
              (try
                {
                  norm_num [Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₆ ⊢ <;>
                  omega
                })
              <;>
              (try
                {
                  omega
                })
            · 
              have h₈ : 0 ^ 2 < 3 * (n + 1) := by
                hole_9
              hole_10
          hole_11
    hole_12
  hole_13