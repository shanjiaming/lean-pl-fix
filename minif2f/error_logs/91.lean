import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $x$ and $y$ are positive integers for which $2^x3^y=1296$, what is the value of $x+y$?

$(\mathrm {A})\ 8 \qquad (\mathrm {B})\ 9 \qquad (\mathrm {C})\ 10 \qquad (\mathrm {D})\ 11 \qquad (\mathrm {E})\ 12$ Show that it is 8.-/
theorem amc12b_2004_p3 (x y : ℕ) (h₀ : 2 ^ x * 3 ^ y = 1296) : x + y = 8 := by
  -- First, we factorize 1296 to understand its prime components
  have h1296 : 1296 = 6^4 := by norm_num
  -- Expand 6^4 to (2*3)^4 to make the prime factors visible
  have h_expand : 6^4 = (2*3)^4 := by rfl
  -- Use the property of exponents to distribute the exponent over multiplication
  have h_distrib : (2*3)^4 = 2^4 * 3^4 := by exact mul_pow 2 3 4
  -- Now we can rewrite the original equation using these facts
  rw [h₀, h1296, h_expand, h_distrib] at h₀
  -- After substitution, we have: 2^x * 3^y = 2^4 * 3^4
  -- Since prime factorizations are unique, we can equate exponents
  have h2 : x = 4 := by
    -- The exponent of 2 on both sides must be equal
    -- We can use the injectivity of the exponential function (base 2)
    apply pow_injective (by norm_num) (by norm_num)
    -- Cancel out the 3^y and 3^4 terms by dividing both sides by 3^4
    have h_aux := congr_arg (fun n => n / (3^4)) h₀
    simp [mul_div_assoc, div_self (pow_ne_zero 4 (by norm_num))] at h_aux
    exact h_aux
  have h3 : y = 4 := by
    -- Similarly, the exponent of 3 on both sides must be equal
    apply pow_injective (by norm_num) (by norm_num)
    -- Cancel out the 2^x and 2^4 terms by dividing both sides by 2^4
    have h_aux := congr_arg (fun n => n / (2^4)) h₀
    simp [mul_div_right_comm, div_self (pow_ne_zero 4 (by norm_num))] at h_aux
    exact h_aux
  -- Now that we have x = 4 and y = 4, we can compute x + y
  rw [h2, h3]
  -- 4 + 4 = 8, which is option A
  norm_num