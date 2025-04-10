import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find an integer $n$ such that $0\leq n<398$ and $n$ is a multiplicative inverse to 7 modulo 398. Show that it is 57.-/
theorem mathd_numbertheory_33 (n : ℕ) (h₀ : n < 398) (h₁ : n * 7 % 398 = 1) : n = 57 := by
  -- We need to find the multiplicative inverse of 7 modulo 398, i.e., a number n such that 7*n ≡ 1 mod 398
  -- This is equivalent to finding integers n and k such that 7n = 398k + 1
  -- We can solve this using the Extended Euclidean Algorithm to find the coefficients of Bézout's identity

  -- First, we'll compute gcd(7, 398) using the Euclidean algorithm to verify that an inverse exists
  rw [inv_inv]
    rw [gcd_rec, gcd_rec, gcd_rec, gcd_rec, gcd_rec]
    norm_num
  -- Since gcd(7, 398) = 1, an inverse exists

  -- Now we'll find the inverse using the Extended Euclidean Algorithm
  -- We want to express 1 as a combination of 7 and 398: 1 = 7*x + 398*y
  -- The x coefficient will be our inverse (mod 398)

  -- Applying the Extended Euclidean Algorithm step-by-step:
  -- 398 = 56 * 7 + 6
  -- 7 = 1 * 6 + 1
  -- 6 = 6 * 1 + 0
  -- Now back-substitute to express 1 in terms of 7 and 398:
  -- 1 = 7 - 1 * 6
  --   = 7 - 1 * (398 - 56 * 7)
  --   = 57 * 7 - 1 * 398

  -- Therefore, the coefficient for 7 is 57, which is our inverse

  -- Now we need to verify that 57 is indeed the inverse modulo 398
  have key_identity : 57 * 7 - 1 = 398 * 1 := by norm_num
  -- This shows that 57 * 7 ≡ 1 mod 398

  -- Since inverses are unique modulo 398 (because gcd(7,398)=1), and both n and 57 are < 398,
  -- they must be equal

  -- Convert the modular equation to a divisibility statement
  have h_div : 398 ∣ 7 * n - 1 := by
    rw [← h₁]
    exact mod_eq_zero_of_dvd (dvd_mul_of_dvd_right (dvd_refl 7) n)

  -- From our key identity, we also know 398 ∣ 7 * 57 - 1
  have h_div_57 : 398 ∣ 7 * 57 - 1 := by
    rw [key_identity]
    exact dvd_refl 398

  -- Therefore, 398 divides the difference: 398 ∣ 7*(n - 57)
  have h_diff : 398 ∣ 7 * (n - 57) := by
    rw [mul_sub]
    exact dvd_sub h_div h_div_57

  -- Since gcd(7,398)=1, by Euclid's lemma, 398 must divide (n - 57)
  have h_final : 398 ∣ n - 57 :=
    dvd_of_mul_dvd_mul_left (by exact gcd_eq.symm ▸ Nat.one_pos) h_diff

  -- Now we know n ≡ 57 mod 398
  -- But both n and 57 are natural numbers less than 398 (from h₀ and by computation)
  have h_57_lt : 57 < 398 := by norm_num

  -- Therefore, the only possibility is n = 57
  exact (eq_of_abs_sub_lt_dvd h_final (by omega)).symm