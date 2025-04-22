import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- For any integer $a$, show that $a^2 \equiv 0 \pmod{4}$ or $a^2 \equiv 1 \pmod{4}$.-/
theorem numbertheory_sqmod4in01d (a : ℤ) : a ^ 2 % 4 = 0 ∨ a ^ 2 % 4 = 1 := by
  -- The key observation is that any integer is either even or odd, and we can
  -- consider these two cases separately.
  
  -- First, we use the lemma `Int.emod_two_eq_zero_or_one` which states that
  -- for any integer x, x % 2 = 0 ∨ x % 2 = 1. This represents the parity of x.
  rcases Int.emod_two_eq_zero_or_one a with (ha | ha)
  
  -- Case 1: a is even (a % 2 = 0)
  · -- If a is even, then a = 2k for some integer k
    -- Then a² = (2k)² = 4k², which is clearly divisible by 4
    -- So a² ≡ 0 mod 4
    
    -- We can rewrite a using the fact that a % 2 = 0
    rw [← Int.emod_add_ediv a 2] at ha
    -- Now ha: a = 2 * (a / 2) + 0
    simp [ha]
    -- Now a is expressed as 2 * (a / 2)
    
    -- Compute a²
    rw [pow_two]
    rw [mul_assoc]
    -- Now a² = 4 * (a / 2)²
    
    -- Taking mod 4 of this expression
    rw [Int.mul_emod, Int.mul_emod]
    -- Since 4 mod 4 = 0, the entire expression mod 4 is 0
    simp [Int.emod_self]
    -- Therefore a² % 4 = 0 in this case
    exact Or.inl rfl
    
  -- Case 2: a is odd (a % 2 = 1)
  · -- If a is odd, then a = 2k + 1 for some integer k
    -- Then a² = (2k + 1)² = 4k² + 4k + 1 = 4(k² + k) + 1
    -- So a² ≡ 1 mod 4
    
    -- We can rewrite a using the fact that a % 2 = 1
    rw [← Int.emod_add_ediv a 2] at ha
    -- Now ha: a = 2 * (a / 2) + 1
    simp [ha]
    -- Now a is expressed as 2 * (a / 2) + 1
    
    -- Compute a²
    rw [pow_two]
    -- Now a² = (2 * (a / 2) + 1)²
    -- Expand the square
    rw [add_sq]
    rw [mul_assoc]
    -- Now a² = 4*(a/2)² + 4*(a/2) + 1
    
    -- Taking mod 4 of this expression
    rw [Int.add_emod, Int.add_emod, Int.mul_emod, Int.mul_emod]
    -- Simplify each term mod 4
    simp [Int.emod_self]
    -- The first two terms become 0, leaving just 1 % 4 = 1
    norm_num
    -- Therefore a² % 4 = 1 in this case
    exact Or.inr rfl