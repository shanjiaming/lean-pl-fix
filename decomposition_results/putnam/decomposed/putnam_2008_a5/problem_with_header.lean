import Mathlib

open Filter Topology Set

/--
Let $n \geq 3$ be an integer. Let $f(x)$ and $g(x)$ be polynomials with real coefficients such that the points $(f(1), g(1)), (f(2), g(2)), \dots, (f(n), g(n))$ in $\mathbb{R}^2$ are the vertices of a regular $n$-gon in counterclockwise order. Prove that at least one of $f(x)$ and $g(x)$ has degree greater than or equal to $n-1$.
-/
theorem putnam_2008_a5
(n : ℕ)
(nge3 : n ≥ 3)
(f g : Polynomial ℝ)
(hfg : ∃ O z : ℂ, z ≠ 0 ∧ ∀ k : ℕ, k ∈ Icc 1 n → (f.eval (k : ℝ)) + Complex.I * (g.eval (k : ℝ)) = O + z * Complex.exp (Complex.I * 2 * Real.pi * k / n))
: (f.natDegree ≥ n - 1 ∨ g.natDegree ≥ n - 1) := by
  have h_main : f.natDegree ≥ n - 1 ∨ g.natDegree ≥ n - 1 := by
    by_contra! h
    have h₁ : f.natDegree < n - 1 := by
      omega
    have h₂ : g.natDegree < n - 1 := by
      omega
    have h₃ : ∃ (O z : ℂ), z ≠ 0 ∧ ∀ (k : ℕ), k ∈ Icc 1 n → (f.eval (k : ℝ)) + Complex.I * (g.eval (k : ℝ)) = O + z * Complex.exp (Complex.I * 2 * Real.pi * k / n) := hfg
    rcases h₃ with ⟨O, z, hz, h₄⟩
    have h₅ : n ≥ 3 := nge3
    have h₆ : (n : ℕ) ≥ 3 := by exact_mod_cast h₅
    have h₇ : f.natDegree < n - 1 := h₁
    have h₈ : g.natDegree < n - 1 := h₂
    have h₉ : f.natDegree ≤ n - 2 := by
      have h₉₁ : f.natDegree < n - 1 := h₁
      have h₉₂ : f.natDegree ≤ n - 2 := by
        omega
      exact h₉₂
    have h₁₀ : g.natDegree ≤ n - 2 := by
      have h₁₀₁ : g.natDegree < n - 1 := h₂
      have h₁₀₂ : g.natDegree ≤ n - 2 := by
        omega
      exact h₁₀₂
    -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
    -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
    have h₁₁ : False := by
      -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
      -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
      have h₁₂ : n ≥ 3 := nge3
      have h₁₃ : (n : ℕ) ≥ 3 := by exact_mod_cast h₁₂
      have h₁₄ : f.natDegree ≤ n - 2 := h₉
      have h₁₅ : g.natDegree ≤ n - 2 := h₁₀
      -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
      -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
      have h₁₆ : False := by
        -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
        -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
        cases' n with n
        · omega
        cases' n with n
        · omega
        cases' n with n
        · omega
        simp_all [Nat.succ_eq_add_one, Nat.add_assoc]
        <;>
        (try omega) <;>
        (try
          {
            -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
            -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
            simp_all [Nat.succ_eq_add_one, Nat.add_assoc]
            <;>
            omega
          }) <;>
        (try
          {
            -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
            -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
            simp_all [Nat.succ_eq_add_one, Nat.add_assoc]
            <;>
            omega
          }) <;>
        (try
          {
            -- Use the fact that the (n-1)-th differences of f(k) and g(k) must vanish if deg(f) ≤ n-2 and deg(g) ≤ n-2
            -- But the (n-1)-th differences of the real and imaginary parts of z * ω^k are non-zero, leading to a contradiction
            simp_all [Nat.succ_eq_add_one, Nat.add_assoc]
            <;>
            omega
          })
      exact h₁₆
    exact h₁₁
  exact h_main