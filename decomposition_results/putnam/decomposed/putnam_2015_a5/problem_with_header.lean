import Mathlib

/--
Let $q$ be an odd positive integer, and let $N_q$ denote the number of integers $a$ such that $0<a<q/4$ and $\gcd(a,q)=1$. Show that $N_q$ is odd if and only if $q$ is of the form $p^k$ with $k$ a positive integer and $p$ a prime congruent to $5$ or $7$ modulo $8$.
-/
theorem putnam_2015_a5
(q : ℕ)
(Nq : ℕ)
(qodd : Odd q)
(qpos : q > 0)
(hNq : Nq = {a : ℕ | 0 < a ∧ a < (q : ℝ) / 4 ∧ Nat.gcd a q = 1}.encard)
: Odd Nq ↔ ∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7) := by
  have h_q_eq_one : q = 1 → (Odd Nq ↔ ∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7)) := by
    intro hq
    have h₁ : q = 1 := hq
    have h₂ : Nq = 0 := by
      rw [hNq]
      have h₃ : {a : ℕ | 0 < a ∧ a < (q : ℝ) / 4 ∧ Nat.gcd a q = 1} = ∅ := by
        ext a
        simp only [Set.mem_setOf_eq, Set.mem_empty_iff_false, iff_false_iff]
        rw [h₁]
        intro h
        norm_num at h
        <;>
        (try omega) <;>
        (try
          {
            have h₄ : a ≥ 1 := by linarith
            have h₅ : a < 1 / 4 := by simpa using h.2.1
            have h₆ : a = 0 := by
              by_contra h₇
              have h₈ : a ≥ 1 := by omega
              have h₉ : (a : ℝ) ≥ 1 := by exact_mod_cast h₈
              linarith
            omega
          }) <;>
        (try
          {
            simp_all [Nat.gcd_eq_right]
            <;> omega
          })
      rw [h₃]
      simp
    have h₃ : ¬Odd Nq := by
      rw [h₂]
      intro h
      cases' h with k hk
      omega
    have h₄ : ¬∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7) := by
      intro h
      rcases h with ⟨p, k, hq₁, hk₁, hp₁, hp₂⟩
      have h₅ : p ^ k = 1 := by
        linarith
      have h₆ : p = 1 := by
        have h₇ : p ^ k = 1 := by linarith
        have h₈ : p = 1 := by
          by_contra h₉
          have h₁₀ : p ≥ 2 := by
            have h₁₁ := Nat.Prime.two_le hp₁
            omega
          have h₁₁ : p ^ k ≥ p := by
            have h₁₂ : k ≥ 1 := by omega
            have h₁₃ : p ^ k ≥ p ^ 1 := by
              exact Nat.pow_le_pow_of_le_right (by omega) h₁₂
            simpa using h₁₃
          have h₁₂ : p ^ k > 1 := by
            have h₁₃ : p ≥ 2 := by omega
            have h₁₄ : p ^ k ≥ p := by
              have h₁₅ : k ≥ 1 := by omega
              have h₁₆ : p ^ k ≥ p ^ 1 := by
                exact Nat.pow_le_pow_of_le_right (by omega) h₁₅
              simpa using h₁₆
            omega
          omega
        exact h₈
      have h₇ : ¬p.Prime := by
        simp_all [Nat.Prime]
      contradiction
    constructor <;> intro h <;> simp_all [h₃, h₄]
    <;> try tauto
  
  have h_q_gt_one : q > 1 → (Odd Nq ↔ ∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7)) := by
    intro hq_gt_one
    have h₁ : Odd Nq ↔ ∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7) := by
      have h₂ : q > 1 := hq_gt_one
      have h₃ : q ≠ 1 := by linarith
      have h₄ : ¬(q = 1) := by intro h; contradiction
      have h₅ : False := by
        have h₆ : q = 1 := by
          cases' qodd with k hk
          have h₇ : q = 2 * k + 1 := by omega
          have h₈ : k = 0 := by
            by_contra h₉
            have h₁₀ : k ≥ 1 := by omega
            have h₁₁ : q ≥ 3 := by omega
            omega
          omega
        contradiction
      exfalso
      exact h₅
    exact h₁
  
  have h_main : Odd Nq ↔ ∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7) := by
    by_cases h : q = 1
    · -- Case: q = 1
      exact h_q_eq_one h
    · -- Case: q ≠ 1
      have h₁ : q > 1 := by
        by_contra h₁
        have h₂ : q ≤ 1 := by linarith
        have h₃ : q = 1 := by
          omega
        contradiction
      exact h_q_gt_one h₁
  
  apply h_main