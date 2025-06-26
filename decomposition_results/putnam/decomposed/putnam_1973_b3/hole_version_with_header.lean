import Mathlib

open Nat Set MeasureTheory Topology Filter

/--
Let $p > 1$ be an integer with the property that $x^2 - x + p$ is prime for all $x$ in the range $0 < x < p$. Show there exists exactly one triple of integers $a,b,c$ satisfying $b^2 - 4ac = 1 - 4p$, $0 < a \leq c$, and $-a \leq b < a$.
-/
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1973_b3
(p : ℕ)
(pgt1 : p > 1)
(hprime : ∀ x ∈ Set.Ico 0 p, Nat.Prime (x^2 - x + p))
: ∃! triple : ℤ × ℤ × ℤ, let (a,b,c) := triple; b^2 - 4*a*c = 1 - 4*p ∧ 0 < a ∧ a ≤ c ∧ -a ≤ b ∧ b < a := by
  have h₁ : ∃ (a : ℤ) (b : ℤ) (c : ℤ), b^2 - 4*a*c = (1 - 4*p : ℤ) ∧ 0 < a ∧ a ≤ c ∧ -a ≤ b ∧ b < a := by
    hole_1
  
  have h₂ : ∃! (triple : ℤ × ℤ × ℤ), let (a,b,c) := triple; b^2 - 4*a*c = (1 - 4*p : ℤ) ∧ 0 < a ∧ a ≤ c ∧ -a ≤ b ∧ b < a := by
    use (1, -1, p : ℤ × ℤ × ℤ)
    constructor
    · 
      dsimp
      <;> norm_num [pow_two] <;>
        (try ring_nf) <;>
        (try norm_num) <;>
        (try omega) <;>
        (try
          {
            have h₃ := hprime 0
            have h₄ := hprime 1
            have h₅ := hprime (p - 1)
            simp [Set.mem_Ico] at h₃ h₄ h₅
            <;>
              (try omega) <;>
              (try
                {
                  cases p with
                  | zero => contradiction
                  | succ p' =>
                    cases p' with
                    | zero => contradiction
                    | succ p'' =>
                      simp_all [Nat.Prime]
                      <;> norm_num
                      <;>
                        (try omega) <;>
                        (try
                          {
                            ring_nf at *
                            omega
                          })
                })
          })
    · 
      rintro ⟨a, b, c⟩ ⟨h₁, h₂, h₃, h₄, h₅⟩
      have h₆ : a = 1 := by
        by_contra h₆
        have h₇ : a ≥ 2 := by
          by_contra h₇
          have h₈ : a ≤ 1 := by linarith
          have h₉ : a > 0 := by linarith
          have h₁₀ : a = 1 := by
            omega
          contradiction
        
        have h₈ : (b : ℤ) ^ 2 - 4 * a * c = (1 : ℤ) - 4 * p := by assumption_mod_cast
        have h₉ : 0 < a := by assumption_mod_cast
        have h₁₀ : a ≤ c := by assumption_mod_cast
        have h₁₁ : -a ≤ b := by assumption_mod_cast
        have h₁₂ : b < a := by assumption_mod_cast
        have h₁₃ : (b : ℤ) ^ 2 < a ^ 2 := by
          nlinarith
        have h₁₄ : 4 * a * c ≥ 4 * a ^ 2 := by
          nlinarith
        nlinarith [sq_nonneg (b + 1), sq_nonneg (b - 1)]
      have h₇ : b = -1 := by
        have h₈ : a = 1 := by assumption
        have h₉ : (b : ℤ) ^ 2 - 4 * a * c = (1 : ℤ) - 4 * p := by assumption_mod_cast
        have h₁₀ : 0 < a := by assumption_mod_cast
        have h₁₁ : a ≤ c := by assumption_mod_cast
        have h₁₂ : -a ≤ b := by assumption_mod_cast
        have h₁₃ : b < a := by assumption_mod_cast
        have h₁₄ : (b : ℤ) ^ 2 < a ^ 2 := by
          nlinarith
        have h₁₅ : b ≥ -1 := by
          nlinarith
        have h₁₆ : b < 1 := by
          nlinarith
        have h₁₇ : b = -1 := by
          interval_cases b <;> norm_num [h₈] at h₉ ⊢ <;>
            (try omega) <;>
            (try nlinarith) <;>
            (try
              {
                ring_nf at h₉
                omega
              })
        assumption
      have h₈ : c = p := by
        have h₉ : a = 1 := by assumption
        have h₁₀ : b = -1 := by assumption
        have h₁₁ : (b : ℤ) ^ 2 - 4 * a * c = (1 : ℤ) - 4 * p := by assumption_mod_cast
        have h₁₂ : 0 < a := by assumption_mod_cast
        have h₁₃ : a ≤ c := by assumption_mod_cast
        have h₁₄ : -a ≤ b := by assumption_mod_cast
        have h₁₅ : b < a := by assumption_mod_cast
        have h₁₆ : (b : ℤ) ^ 2 < a ^ 2 := by
          nlinarith
        have h₁₇ : 4 * a * c ≥ 4 * a ^ 2 := by
          nlinarith
        simp [h₉, h₁₀] at h₁₁
        <;>
          (try ring_nf at h₁₁ ⊢) <;>
          (try nlinarith) <;>
          (try omega) <;>
          (try
            {
              norm_num at h₁₁ ⊢
              <;> ring_nf at h₁₁ ⊢ <;> norm_num at h₁₁ ⊢ <;>
                (try omega) <;> (try nlinarith)
            })
        <;>
          (try
            {
              omega
            })
        <;>
          (try
            {
              nlinarith
            })
      simp_all [Prod.ext_iff]
      <;> norm_num <;>
        (try ring_nf at * <;> norm_num) <;>
        (try omega) <;>
        (try nlinarith)
  
  simpa using h₂