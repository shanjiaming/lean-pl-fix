import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the sum of the four positive factors of the positive integer value of $\sqrt{196}$? Show that it is 24.-/
theorem mathd_numbertheory_35 (S : Finset ℕ) (h₀ : ∀ n : ℕ, n ∈ S ↔ n ∣ Nat.sqrt 196) :
    (∑ k in S, k) = 24 := by
  -- First, compute the integer square root of 196
  have sqrt_196 : Nat.sqrt 196 = 14 := by
    -- The square root of 196 is exactly 14 since 14² = 196
    norm_num
  rw [sqrt_196] at h₀

  -- The positive divisors of 14 are exactly 1, 2, 7, and 14
  -- We'll prove that S must be {1, 2, 7, 14}
  have S_eq : S = {1, 2, 7, 14} := by
    -- Use the extensionality of finsets
    apply Finset.ext
    intro n
    -- Rewrite using our hypothesis about membership in S
    rw [h₀]
    -- The divisors of 14 are exactly these four numbers
    rw [Nat.dvd_iff_exists_eq_mul_left]
    -- Prove equivalence by enumerating cases
    cases n with
    | zero => simp -- 0 is not a positive divisor
    | succ n =>
      match n with
      | 0 => simp [Nat.succ_eq_add_one] -- n = 1 case
      | 1 => simp [Nat.succ_eq_add_one] -- n = 2 case
      | 6 => simp [Nat.succ_eq_add_one] -- n = 7 case
      | 13 => simp [Nat.succ_eq_add_one] -- n = 14 case
      | _ =>
        -- For other numbers, show they're not divisors
        simp only [Nat.succ_eq_add_one, add_zero]
        intro k hk
        -- Numbers larger than 14 can't divide 14
        have : 14 < n.succ := by omega
        contradiction

  -- Now rewrite the goal using the equality we just proved
  rw [S_eq]

  -- Compute the sum of the elements {1, 2, 7, 14}
  -- This can be done by direct computation
  simp