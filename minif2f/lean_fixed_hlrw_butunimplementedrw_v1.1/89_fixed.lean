import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for positive integers $n$ and $k$, if $k \leq n$, then $\sum_{k=1}^n (k*C_n^k) = n * 2^{n-1}$.-/
theorem numbertheory_sumkmulnckeqnmul2pownm1 (n : ℕ) (h₀ : 0 < n) :
    (∑ k in Finset.Icc 1 n, k * Nat.choose n k) = n * 2 ^ (n - 1) := by
  -- We'll prove this using induction on n. The base case is n = 1.
  induction' n using Nat.strong_induction_on with n ih
  -- Handle the base case where n = 1
  cases' n with n
  · -- This case is n = 0, which contradicts our hypothesis 0 < n
    contradiction
  · -- Now we have n = Nat.succ n (n+1 in usual notation)
    cases' n with n
    · -- Base case: n = 1
      -- The sum is just k=1 term: 1 * C(1,1) = 1
      simp only [Finset.Icc_1_1, Finset.sum_singleton, Nat.choose_self, mul_one]
      -- Right side is 1 * 2^(0) = 1
      rw [Nat.sub_self, pow_zero, mul_one]
    · -- Inductive step: assume true for all m < n+2, prove for n+2
      -- The sum we want to compute is from k=1 to n+2 of k*C(n+2,k)
      -- We'll use the binomial coefficient identity: C(n+2,k) = C(n+1,k) + C(n+1,k-1)
      have sum_split : (∑ k in Finset.Icc 1 (n + 2), k * Nat.choose (n + 2) k) =
          (∑ k in Finset.Icc 1 (n + 2), k * Nat.choose (n + 1) k) +
          (∑ k in Finset.Icc 1 (n + 2), k * Nat.choose (n + 1) (k - 1)) := by
        -- Apply the binomial coefficient identity to each term
        simp_rw [Nat.choose_succ_succ, add_mul]
        -- Split the sum into two sums
        rw [Finset.sum_add_distrib]
      
      -- The first sum can be written as the sum from 1 to n+1 (since C(n+1,n+2)=0)
      have sum1_eq : (∑ k in Finset.Icc 1 (n + 2), k * Nat.choose (n + 1) k) =
          (∑ k in Finset.Icc 1 (n + 1), k * Nat.choose (n + 1) k) := by
        -- The extra term at n+2 is zero because C(n+1,n+2)=0
        rw [Finset.Icc_1_eq_Ioc]
        rw [Finset.sum_Ioc_eq_sum_Icc]
        apply Finset.sum_congr
        · rw [Finset.Icc_eq_Ioc, Nat.lt_succ_iff, Nat.succ_le_iff]
          exact Nat.zero_lt_succ _
        · intro k hk
          rfl
        · simp only [Nat.choose_eq_zero_of_lt]
          simp only [Finset.mem_Icc] at hk
          rw [Nat.lt_succ_iff] at hk
          exact hk.2

      -- The second sum can be reindexed by setting j = k-1
      have sum2_eq : (∑ k in Finset.Icc 1 (n + 2), k * Nat.choose (n + 1) (k - 1)) =
          (∑ j in Finset.Icc 0 (n + 1), (j + 1) * Nat.choose (n + 1) j) := by
        -- Reindex the sum using k = j + 1
        rw [Finset.sum_Icc_Ico_Ioc_Ioo]
        apply Finset.sum_bij (fun k _ => k - 1)
        · intro k hk
          simp at hk
          simp [hk.1, Nat.sub_le]
        · intro k hk
          simp at hk
          rw [Nat.sub_add_cancel hk.1]
        · intro k₁ k₂ hk₁ hk₂ h
          exact Nat.sub_right_inj h
        · intro j hj
          simp at hj
          use j + 1
          simp [hj.1, Nat.succ_le_succ hj.2, Nat.add_sub_cancel]
      
      -- Now we can apply the induction hypothesis to the first sum
      have ih1 := ih (n + 1) (Nat.lt_succ_self _)
      -- The first sum becomes (n+1)*2^n
      rw [sum1_eq] at sum_split
      rw [ih1] at sum_split
      
      -- For the second sum, we split it into two parts
      have sum2_split : (∑ j in Finset.Icc 0 (n + 1), (j + 1) * Nat.choose (n + 1) j) =
          (∑ j in Finset.Icc 0 (n + 1), j * Nat.choose (n + 1) j) +
          (∑ j in Finset.Icc 0 (n + 1), Nat.choose (n + 1) j) := by
        -- Split (j+1)*C(n+1,j) into j*C(n+1,j) + C(n+1,j)
        simp_rw [add_mul, one_mul]
        rw [Finset.sum_add_distrib]
      
      -- The first part of the split sum2 is almost the same as sum1
      have sum2_part1 : (∑ j in Finset.Icc 0 (n + 1), j * Nat.choose (n + 1) j) =
          (∑ j in Finset.Icc 1 (n + 1), j * Nat.choose (n + 1) j) := by
        -- The j=0 term is zero, so we can start from j=1
        rw [← Finset.sum_Ico_Ioc_Icc]
        rw [Finset.Ico_eq_empty]
        rw [Finset.sum_empty]
        rw [zero_add]
        simp [Nat.succ_pos]
      
      -- The second part is just the sum of binomial coefficients 2^(n+1)
      have sum2_part2 : (∑ j in Finset.Icc 0 (n + 1), Nat.choose (n + 1) j) = 2 ^ (n + 1) := by
        -- This is the well-known sum of binomial coefficients
        rw [Finset.sum_Icc_eq_sum_range]
        simp [Nat.choose_symm, Nat.sum_choose]
      
      -- Now apply the induction hypothesis to sum2_part1
      rw [sum2_part1] at sum2_split
      rw [ih1] at sum2_split
      rw [sum2_part2] at sum2_split
      
      -- Now combine all the results
      rw [sum2_eq, sum2_split] at sum_split
      -- Simplify the expression
      rw [sum_split]
      -- We now have: (n+1)*2^n + (n+1)*2^n + 2^(n+1) = (n+2)*2^(n+1)
      -- Let's simplify this
      ring_nf
      -- (n+1)*2^n + (n+1)*2^n = 2*(n+1)*2^n = (n+1)*2^(n+1)
      rw [← mul_add]
      rw [← pow_succ]
      -- Now we have (n+1)*2^(n+1) + 2^(n+1) = (n+2)*2^(n+1)
      rw [← add_mul, add_comm _ 1]
      -- Which simplifies to (n+2)*2^(n+1) as required
      simp only [Nat.add_succ_sub_one, add_zero]