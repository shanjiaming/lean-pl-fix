import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The positive integers $A, B, A-B, $ and $A+B$ are all prime numbers. The sum of these four primes is

$\mathrm{(A)}\ \mathrm{even}
\qquad\mathrm{(B)}\ \mathrm{divisible\ by\ }3
\qquad\mathrm{(C)}\ \mathrm{divisible\ by\ }5
\qquad\mathrm{(D)}\ \mathrm{divisible\ by\ }7
\qquad\mathrm{(E)}\ \mathrm{prime}$ Show that it is \mathrm{(E)}\ \text{prime}.-/
theorem amc12b_2002_p11 (a b : ℕ) (h₀ : Nat.Prime a) (h₁ : Nat.Prime b) (h₂ : Nat.Prime (a + b))
  (h₃ : Nat.Prime (a - b)) : Nat.Prime (a + b + (a - b + (a + b))) := by
  -- First, let's simplify the expression we need to prove prime
  -- The original expression is: a + b + (a - b + (a + b))
  -- Let's simplify it step by step:
  -- 1. a - b + (a + b) = a - b + a + b = 2a
  -- 2. Then the full expression becomes a + b + 2a = 3a + b
  have simplified : a + b + (a - b + (a + b)) = 3 * a + b := by
    -- First step: expand the inner parentheses
    rw [add_assoc (a - b) a b]
    -- a - b + a + b = (a + a) + (b - b) = 2a + 0 = 2a
    rw [← add_assoc, Nat.add_sub_of_le (Nat.le_of_prime_sub h₀ h₁ h₃), add_comm b, add_sub_cancel]
    -- Now the expression is a + b + 2a
    rw [add_comm (a + b) (2 * a), ← add_assoc]
    -- Which simplifies to 3a + b
    rw [two_mul, ← add_assoc, add_assoc a a a]
    simp only [Nat.succ_mul, zero_mul, zero_add]
  
  -- Rewrite the goal using our simplified expression
  rw [simplified]
  
  -- Now we need to prove that 3a + b is prime
  -- Given that a, b, a-b, and a+b are all primes, let's analyze possible values
  
  -- Since a and b are primes ≥ 2, and a - b is also prime (so a > b)
  have a_gt_b : a > b := by
    exact Nat.lt_of_le_of_ne (Nat.le_of_prime_sub h₀ h₁ h₃) (Ne.symm (ne_of_lt (Nat.sub_ne_zero_of_lt (Nat.prime_gt_one h₀))))
  
  -- The smallest possible prime is 2, so let's consider cases based on b
  -- Case 1: b = 2 (the only even prime)
  -- Case 2: b is an odd prime (≥ 3)
  cases' eq_or_ne b 2 with b_eq_2 b_ne_2
  
  -- Case 1: b = 2
  · rw [b_eq_2] at *
    -- Now we know a is a prime > 2 (since a > b = 2)
    have a_odd : Odd a := Nat.Prime.odd_of_ne_two h₀ (ne_of_gt (gt_trans (by decide) a_gt_b))
    
    -- Since a + b = a + 2 is prime, and a is odd, then a + 2 is odd + even = odd
    -- Similarly a - b = a - 2 is prime
    -- The only three primes that satisfy this are (a-2, a, a+2) being a prime triplet
    -- The only prime triplet is (3, 5, 7)
    have a_eq_5 : a = 5 := by
      -- Test possible values for a
      have h : a ∈ [3, 5, 7] := by
        -- We know a is prime, a > 2, and both a-2 and a+2 are primes
        -- Let's check primes between 3 and 7
        interval_cases a
        · exact (Nat.not_prime_one (h₃.trans_eq (by rfl))).elim
        · have h₃' := h₃.trans_eq (by rfl)
          simp [Nat.Prime] at h₃'
        · simp [h₀, h₂.trans_eq (by rfl), h₃.trans_eq (by rfl)]
        · have h₃' := h₃.trans_eq (by rfl)
          simp [Nat.Prime] at h₃'
        · have h₂' := h₂.trans_eq (by rfl)
          simp [Nat.Prime] at h₂'
        · have h₂' := h₂.trans_eq (by rfl)
          simp [Nat.Prime] at h₂'
      -- Only a = 5 satisfies all conditions
      cases h with
      | head _ h => exact absurd h (Nat.not_prime_one (h₃.trans_eq (by rfl)))
      | next _ h => exact absurd h (by decide)
      | next _ h => exact h
      | next _ h => exact absurd h (by decide)
    
    -- Now substitute a = 5 and b = 2
    rw [a_eq_5, b_eq_2]
    -- Our expression becomes 3*5 + 2 = 17, which is prime
    exact Nat.prime_17  -- Mathlib has this fact
    
  -- Case 2: b is an odd prime (≥ 3)
  · -- Since b is odd and a is prime > b, a must be even or odd
    -- But a - b is prime, and b is odd ≥ 3
    -- If a were even, then a = 2 (only even prime), but a > b ≥ 3 → contradiction
    have a_not_even : ¬Even a := by
      intro a_even
      have a_eq_2 : a = 2 := Nat.eq_two_of_prime_even h₀ a_even
      rw [a_eq_2] at a_gt_b
      exact Nat.not_lt_zero 2 (gt_trans a_gt_b (Nat.prime_gt_one h₁)))
    
    -- So a is odd, b is odd
    -- Then a + b is even and prime, so must be 2
    have a_plus_b_eq_2 : a + b = 2 := by
      exact Nat.eq_two_of_prime_even h₂ (Nat.even_add.mpr ⟨Odd.of_not_even a_not_even, Odd.of_not_even (Nat.prime_odd_of_ne_two h₁ b_ne_2)⟩))
    
    -- But a ≥ b + 1 (since a > b and both are integers)
    -- And b ≥ 3, so a ≥ 4, then a + b ≥ 4 + 3 = 7 > 2 → contradiction
    have b_ge_3 : b ≥ 3 := Nat.Prime.two_le h₁ b_ne_2
    have a_ge_b_plus_1 : a ≥ b + 1 := Nat.succ_le_of_lt a_gt_b
    have absurd : a + b ≥ 3 + (3 + 1) := by
      rw [← add_assoc]
      apply add_le_add b_ge_3 a_ge_b_plus_1
    linarith only [a_plus_b_eq_2, absurd]