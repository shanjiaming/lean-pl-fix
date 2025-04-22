import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- 
Let f be an injective function from {1,2,3,...} to itself. Prove that for any n we have:
∑_{k=1}^n f(k)/k² ≥ ∑_{k=1}^n 1/k.

The proof uses rearrangement inequality ideas, showing that the minimal sum occurs when f(k) = k.
-/
theorem imo_1978_p5 (n : ℕ) (a : ℕ → ℕ) (h₀ : Function.Injective a) (h₁ : a 0 = 0) (h₂ : 0 < n) :
    (∑ k in Finset.Icc 1 n, (1 : ℝ) / k) ≤ ∑ k in Finset.Icc 1 n, (a k : ℝ) / k ^ 2 := by
  -- First, we'll use the fact that for injective functions on {1,...,n}, the minimal sum occurs
  -- when the function is the identity. This is a consequence of the rearrangement inequality.
  
  -- Define the weights w k = 1/k² which are decreasing in k
  let w : ℕ → ℝ := fun k => 1 / (k : ℝ) ^ 2
  
  -- The key observation is that to minimize the weighted sum ∑ (a k) * w k, we should pair
  -- the smallest a k values with the largest w k values, which occurs when a k = k
  
  -- We'll compare our sum to the identity function's sum
  let a_id : ℕ → ℕ := id
  
  -- The identity function is injective
  have h_id_inj : Function.Injective a_id := Function.injective_id
  
  -- We need to show that the sum with a is at least the sum with the identity function
  suffices ∑ k in Finset.Icc 1 n, (a_id k : ℝ) * w k ≤ ∑ k in Finset.Icc 1 n, (a k : ℝ) * w k by
    -- Convert the inequality back to the desired form
    simp only [a_id, id_eq, mul_one_div] at this
    rwa [← Finset.sum_div] at this
  
  -- This follows from the weighted rearrangement inequality:
  -- For decreasing weights w and any injective function a, ∑ (a k) * w k ≥ ∑ k * w k
  -- We'll prove this by induction
  
  -- First handle the case where a is a permutation of {1,...,n}
  have h_perm : ∀ k ∈ Finset.Icc 1 n, a k ∈ Finset.Icc 1 n := by
    intro k hk
    -- Since a is injective and k ≤ n, a(k) must be ≤ n to avoid collisions
    have : a k ≤ n := by
      by_contra H
      push_neg at H
      -- If a(k) > n, then by injectivity and pigeonhole principle, some value in {1,...,n} is missed
      have card_le : n ≤ Finset.card (Finset.Icc 1 n) := by simp
      have card_lt : Finset.card (Finset.Icc 1 n) < Finset.card (Finset.Icc 1 n) := by
        calc
          _ = Finset.card (Finset.image a (Finset.Icc 1 n)) := (Finset.card_image_of_injective _ h₀).symm
          _ ≤ Finset.card (Finset.Icc 1 (a k)) := ?_
          _ = a k := by simp
          _ ≤ Finset.card (Finset.Icc 1 n) := ?_
      all_goals linarith
    exact Finset.mem_Icc.mpr ⟨by linarith [a k.1.2], this⟩
  
  -- Now we can apply the rearrangement inequality for finite sets
  -- The general statement is: for any permutation σ and decreasing sequence w,
  -- ∑ k * w k ≤ ∑ σ(k) * w k
  
  -- We'll use the version from Mathlib for the Icc 1 n
  let s := Finset.Icc 1 n
  have h_decreasing : StrictMonoOn (fun i => (w i)⁻¹) (Set.Icc 1 n) := by
    -- w k = 1/k², so 1/w k = k² which is strictly increasing
    intro x hx y hy hxy
    simp [w]
    have : 0 < (x : ℝ) ∧ 0 < (y : ℝ) := by norm_cast; linarith
    rw [one_div, one_div]
    apply inv_lt_inv
    repeat positivity
    exact pow_lt_pow_of_lt_left hxy (by linarith) (by norm_num)
  
  -- Convert our weights to the form needed by the theorem
  have hw : ∀ k ∈ s, w k = (fun i => (i : ℝ) ^ 2) k ⁻¹ := by
    intro k hk
    simp [w]
    field_simp
    norm_cast
  
  -- Apply the rearrangement inequality
  apply Finset.sum_le_sum_of_subset_of_nonneg'
  · intro k hk
    exact h_perm k hk
  · intro k _ hk
    exact le_of_lt (hw k hk ▸ inv_pos.mpr (by positivity))
  
  -- The key step: apply the rearrangement inequality
  have := Finset.sum_le_sum_of_inj_on a (fun k => (k : ℝ)^2) s ?_ ?_ ?_
  · convert this using 1
    · simp [w, ← Finset.sum_div, a_id]
    · simp [w, ← Finset.sum_div]
  · exact fun k hk => h_perm k hk
  · exact h₀.injOn _
  · intro k hk
    simp [w]
    positivity
  
  -- Alternative approach using that the minimum is attained at the identity
  -- We can also prove this by showing any transposition increases the sum
  sorry  -- The remaining details would complete this formalization

-- Note: The complete formalization would require either:
-- 1. Finding and applying the appropriate rearrangement inequality in Mathlib, or
-- 2. Completing the inductive argument showing swaps increase the sum
-- The current proof sketch outlines the key ideas and structure.