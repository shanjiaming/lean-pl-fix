import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Define a function on the positive integers recursively by $f(1) = 2$, $f(n) = f(n-1) + 1$ if $n$ is even, 
and $f(n) = f(n-2) + 2$ if $n$ is odd and greater than $1$. What is $f(2017)$?

$ \textbf{(A)}\ 2017 \qquad\textbf{(B)}\ 2018 \qquad\textbf{(C)}\ 4034 \qquad\textbf{(D)}\ 4035 \qquad\textbf{(E)}\ 4036 $ 
Show that it is \textbf{(B)}.-/
theorem amc12a_2017_p7 (f : ℕ → ℝ) (h₀ : f 1 = 2) (h₁ : ∀ n, 1 < n ∧ Even n → f n = f (n - 1) + 1)
  (h₂ : ∀ n, 1 < n ∧ Odd n → f n = f (n - 2) + 2) : f 2017 = 2018 := by
  -- First, we'll prove a general lemma that gives a closed form for f(n)
  have lemma : ∀ n : ℕ, f n = n + 1 := by
    -- We'll prove this by strong induction
    apply Nat.strong_induction_on
    intro n hn
    -- Base case when n = 1
    cases' n with n
    · simp [h₀]  -- f(1) = 2 = 1 + 1
    cases' n with n
    · simp [h₀]  -- f(1) = 2 = 1 + 1
    -- Now consider two cases based on parity of (n+1)
    cases' Nat.even_or_odd (n + 1) with even_n odd_n
    -- Case 1: n+1 is even
    · have n_gt_1 : 1 < n + 1 := by linarith
      specialize h₁ (n + 1) ⟨n_gt_1, even_n⟩
      -- Use recursive definition for even case
      rw [h₁]
      -- Apply induction hypothesis to (n+1-1) = n
      have IH := hn n (by linarith)
      rw [IH]
      -- Simplify: (n + 1) + 1 = (n + 1 + 1)
      ring
    -- Case 2: n+1 is odd
    · have n_gt_1 : 1 < n + 1 := by linarith
      specialize h₂ (n + 1) ⟨n_gt_1, odd_n⟩
      -- Use recursive definition for odd case
      rw [h₂]
      -- Apply induction hypothesis to (n+1-2) = n-1
      have IH := hn (n - 1) (by linarith)
      rw [IH]
      -- Simplify: (n - 1 + 1) + 2 = n + 2 = (n + 1) + 1
      ring
  -- Now apply the lemma to n = 2017
  specialize lemma 2017
  -- Simplify: 2017 + 1 = 2018
  rw [lemma]
  norm_cast