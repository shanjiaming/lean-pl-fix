import Mathlib

open Polynomial

/--
Let $Q_0(x)=1$, $Q_1(x)=x$, and $Q_n(x)=\frac{(Q_{n-1}(x))^2-1}{Q_{n-2}(x)}$ for all $n \geq 2$. Show that, whenever $n$ is a positive integer, $Q_n(x)$ is equal to a polynomial with integer coefficients.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)

theorem putnam_2017_a2
    (Q : ℕ → RatFunc ℚ)
    (hQbase : Q 0 = 1 ∧ Q 1 = (X : ℚ[X]))
    (hQn : ∀ n, Q (n + 2) = (Q (n + 1) ^ 2 - 1) / Q n)
    (n : ℕ) (hn : 0 < n) :
    ∃ P : ℤ[X], Q n = P.map (Int.castRingHom ℚ) := by
  have h₁ : ∀ (n : ℕ), ∃ (P : ℤ[X]), Q n = P.map (Int.castRingHom ℚ) := by
    intro n
    have h₂ : ∀ n : ℕ, ∃ (P : ℤ[X]), Q n = (P.map (Int.castRingHom ℚ) : RatFunc ℚ) := by
      intro n
      have h₃ : ∀ n : ℕ, ∃ (P : ℤ[X]), Q n = (P.map (Int.castRingHom ℚ) : RatFunc ℚ) := by
        intro n
        induction n using Nat.strong_induction_on with
        | h n ih =>
          match n with
          | 0 =>
            use 1
            simp_all [hQbase, Polynomial.C_0, Polynomial.C_1, Polynomial.C_add, Polynomial.C_mul]
            <;>
            norm_num
            <;>
            ring_nf at *
            <;>
            simp_all [Polynomial.C_0, Polynomial.C_1, Polynomial.C_add, Polynomial.C_mul]
            <;>
            norm_num
            <;>
            linarith
          | 1 =>
            use Polynomial.X
            simp_all [hQbase, Polynomial.C_0, Polynomial.C_1, Polynomial.C_add, Polynomial.C_mul]
            <;>
            norm_num
            <;>
            ring_nf at *
            <;>
            simp_all [Polynomial.C_0, Polynomial.C_1, Polynomial.C_add, Polynomial.C_mul]
            <;>
            norm_num
            <;>
            linarith
          | n + 2 =>
            
            have h₄ : ∃ (P : ℤ[X]), Q (n + 1) = (P.map (Int.castRingHom ℚ) : RatFunc ℚ) := ih _ (by omega)
            have h₅ : ∃ (P : ℤ[X]), Q n = (P.map (Int.castRingHom ℚ) : RatFunc ℚ) := ih _ (by omega)
            cases' h₄ with P₁ hP₁
            cases' h₅ with P₂ hP₂
            have h₆ : Q (n + 2) = (Q (n + 1) ^ 2 - 1) / Q n := hQn n
            rw [h₆]
            rw [hP₁, hP₂]
            
            have h₇ : (P₁.map (Int.castRingHom ℚ) : RatFunc ℚ) ^ 2 - 1 = ((P₁.map (Int.castRingHom ℚ) : RatFunc ℚ)) ^ 2 - 1 := by
              hole_1
            rw [h₇]
            have h₈ : ∃ (P : ℤ[X]), (P.map (Int.castRingHom ℚ) : RatFunc ℚ) = (P₁.map (Int.castRingHom ℚ) : RatFunc ℚ) ^ 2 - 1 := by
              hole_2
            cases' h₈ with P₃ hP₃
            have h₉ : (P₁.map (Int.castRingHom ℚ) : RatFunc ℚ) ^ 2 - 1 = (P₃.map (Int.castRingHom ℚ) : RatFunc ℚ) := by
              hole_3
            rw [h₉]
            
            have h₁₀ : ∃ (P : ℤ[X]), (P.map (Int.castRingHom ℚ) : RatFunc ℚ) = (P₃.map (Int.castRingHom ℚ) : RatFunc ℚ) / (P₂.map (Int.castRingHom ℚ) : RatFunc ℚ) := by
              hole_4
            cases' h₁₀ with P₄ hP₄
            use P₄
            <;>
            simp_all [Polynomial.map_mul, Polynomial.map_sub, Polynomial.map_one, Polynomial.map_pow]
            <;>
            ring_nf at *
            <;>
            simp_all [Polynomial.C_0, Polynomial.C_1, Polynomial.C_add, Polynomial.C_mul]
            <;>
            norm_num
            <;>
            linarith
      have h₄ : ∃ (P : ℤ[X]), Q n = (P.map (Int.castRingHom ℚ) : RatFunc ℚ) := h₃ n
      hole_6
    hole_7
  have h₂ : ∃ (P : ℤ[X]), Q n = P.map (Int.castRingHom ℚ) := h₁ n
  hole_8