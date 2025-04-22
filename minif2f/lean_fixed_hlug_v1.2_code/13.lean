import Mathlib
import Aesop

set_option maxHeartbeats 0  -- Disable heartbeat limit to prevent timeout during proof checking

open BigOperators Real Nat Topology Rat

/-- 
Show that for positive integer n, $\sum_{k=0}^{n-1} (2k + 3) = (n + 1)^2 - 1$.
-/
theorem induction_sum2kp1npqsqm1 (n : ℕ) :
    ∑ k in Finset.range n, (2 * k + 3) = (n + 1) ^ 2 - 1 := by
  -- We'll proceed by mathematical induction on n
  induction n with
  | zero => 
    -- Base case: n = 0
    -- The sum over an empty range is 0 by definition
    simp [Finset.range_zero]  -- Simplify using the fact that range 0 is empty
    -- Right side becomes (0 + 1)^2 - 1 = 1 - 1 = 0
  | succ m ih => 
    -- Inductive step: assume true for n = m (ih is our induction hypothesis), prove for n = m + 1
    -- First rewrite the sum for m+1 as the sum for m plus the new term
    rw [Finset.range_succ, Finset.sum_insert (Finset.not_mem_range_self)]  
    -- The new term is (2 * m + 3) since k ranges up to m (but not m+1)
    -- Now rewrite using our induction hypothesis ih: ∑_{k=0}^{m-1} (2k+3) = (m+1)^2 - 1
    rw [ih]  
    -- The right-hand side becomes ((m + 1) + 1)^2 - 1 = (m + 2)^2 - 1
    -- Now we need to show: (m+1)^2 - 1 + (2*m + 3) = (m+2)^2 - 1
    -- Simplify both sides algebraically:
    -- Left side: (m^2 + 2m + 1) - 1 + 2m + 3 = m^2 + 4m + 3
    -- Right side: (m^2 + 4m + 4) - 1 = m^2 + 4m + 3
    -- So both sides are equal
    ring  -- Use the ring tactic to prove equalities in commutative rings