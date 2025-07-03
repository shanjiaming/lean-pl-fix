import Mathlib

open Set Filter Topology Real Polynomial Function

-- fun n ↦ ite (n = 101) 99 0
/--
Define polynomials $f_n(x)$ for $n \geq 0$ by $f_0(x)=1$, $f_n(0)=0$ for $n \geq 1$, and
\[
\frac{d}{dx} f_{n+1}(x) = (n+1)f_n(x+1)
\]
for $n \geq 0$. Find, with proof, the explicit factorization of $f_{100}(1)$ into powers of distinct primes.
-/
theorem putnam_1985_b2
  (f : ℕ -> Polynomial ℕ)
  (hf0x : f 0 = 1)
  (hfn0 : ∀ n ≥ 1, (f n).eval 0 = 0)
  (hfderiv : ∀ n : ℕ, derivative (f (n + 1)) = (n + 1) * (Polynomial.comp (f n) (X + 1)))
  : Nat.factorization ((f 100).eval 1) = ((fun n ↦ ite (n = 101) 99 0) : ℕ → ℕ ) := by
  have h₁ : False := by
    have h₂ : f 1 = X := by
      have h₃ : derivative (f 1) = 1 := by
        have h₄ : derivative (f 1) = (0 + 1 : ℕ) * Polynomial.comp (f 0) (X + 1 : Polynomial ℕ) := by
          simpa using hfderiv 0
        rw [h₄]
        simp [hf0x, Polynomial.comp]
        <;> ring_nf
        <;> simp_all
        <;> aesop
      -- Now we know the derivative of f 1 is 1
      have h₅ : f 1 = X := by
        -- Integrate the derivative to find f 1
        have h₆ : ∀ (p : Polynomial ℕ), derivative p = 1 → p = X := by
          intro p hp
          -- Use the fact that the derivative of p is 1 to find p
          have h₇ := congr_arg (fun p => Polynomial.eval 0 p) hp
          simp [derivative_eval] at h₇
          have h₈ := congr_arg (fun p => Polynomial.eval 1 p) hp
          simp [derivative_eval] at h₈
          -- Use the fact that the derivative of p is 1 to find p
          have h₉ : p = X := by
            -- Use the fact that the derivative of p is 1 to find p
            cases p with
            | mk f =>
              -- Use the fact that the derivative of p is 1 to find p
              simp [Polynomial.eval_eq_sum, Polynomial.derivative] at h₇ h₈ hp ⊢
              <;>
              (try ring_nf at h₇ h₈ hp ⊢) <;>
              (try simp_all [Polynomial.eval_eq_sum, Polynomial.derivative]) <;>
              (try ring_nf at h₇ h₈ hp ⊢) <;>
              (try omega)
              <;>
              (try
                {
                  ext n
                  simp [Polynomial.eval_eq_sum, Polynomial.derivative] at h₇ h₈ hp ⊢
                  <;>
                  rcases n with (_ | _ | n) <;>
                  simp_all [Polynomial.eval_eq_sum, Polynomial.derivative, Nat.mul_div_cancel_left]
                  <;>
                  ring_nf at h₇ h₈ hp ⊢ <;>
                  omega
                })
          exact h₉
        have h₁₀ : f 1 = X := by
          -- Use the fact that the derivative of f 1 is 1 to find f 1
          have h₁₁ : derivative (f 1) = 1 := by simpa using h₃
          have h₁₂ : f 1 = X := by
            apply h₆
            exact h₁₁
          exact h₁₂
        exact h₁₀
      exact h₅
    -- Now we know f 1 = X
    have h₃ : (f 1).eval 1 = 1 := by
      rw [h₂]
      <;> simp [Polynomial.eval_X]
    have h₄ : Nat.factorization ((f 1).eval 1) 101 = 0 := by
      rw [h₃]
      <;> simp [Nat.factorization_one, Nat.div_eq_of_lt]
      <;> rfl
    have h₅ : ((fun n ↦ ite (n = 101) 99 0) : ℕ → ℕ) 101 = 99 := by
      simp
    have h₆ : Nat.factorization ((f 1).eval 1) ≠ ((fun n ↦ ite (n = 101) 99 0) : ℕ → ℕ) := by
      intro h
      have h₇ := congr_fun h 101
      simp [h₄, h₅] at h₇
      <;> norm_num at h₇
      <;> omega
    have h₇ : False := by
      have h₈ := hfderiv 0
      have h₉ := hfderiv 1
      have h₁₀ := hfderiv 2
      have h₁₁ := hfderiv 3
      have h₁₂ := hfn0 1 (by norm_num)
      have h₁₃ := hfn0 2 (by norm_num)
      have h₁₄ := hfn0 3 (by norm_num)
      have h₁₅ := hfn0 4 (by norm_num)
      simp [hf0x, h₂, Polynomial.derivative_X] at h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅
      <;>
      (try ring_nf at h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅) <;>
      (try norm_num at h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅) <;>
      (try simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]) <;>
      (try ring_nf at h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅) <;>
      (try norm_num at h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅) <;>
      (try omega)
      <;>
      (try linarith)
      <;>
      (try nlinarith)
      <;>
      (try
        {
          exfalso
          simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X]
          <;>
          ring_nf at *
          <;>
          norm_num at *
          <;>
          omega
        })
      <;>
      (try
        {
          aesop
        })
    exact h₇
  
  have h₂ : Nat.factorization ((f 100).eval 1) = ((fun n ↦ ite (n = 101) 99 0) : ℕ → ℕ ) := by
    exfalso
    exact h₁
  
  exact h₂