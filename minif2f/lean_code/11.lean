import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- A sequence of numbers is defined recursively by $a_1 = 1$, $a_2 = \frac{3}{7}$, and
$a_n=\frac{a_{n-2} \cdot a_{n-1}}{2a_{n-2} - a_{n-1}}$for all $n \geq 3$ Then $a_{2019}$ can be written as $\frac{p}{q}$, where $p$ and $q$ are relatively prime positive integers. What is $p+q ?$

$\textbf{(A) } 2020 \qquad\textbf{(B) } 4039 \qquad\textbf{(C) } 6057 \qquad\textbf{(D) } 6061 \qquad\textbf{(E) } 8078$ Show that it is \textbf{(E) }8078.-/
theorem amc12a_2019_p9 (a : ℕ → ℚ) (h₀ : a 1 = 1) (h₁ : a 2 = 3 / 7)
  (h₂ : ∀ n, a (n + 2) = a n * a (n + 1) / (2 * a n - a (n + 1))) :
  ↑(a 2019).den + (a 2019).num = 8078 := by
  -- Define the reciprocal sequence b_n = 1 / a_n
  let b : ℕ → ℚ := fun n => 1 / a n
  -- Show that b satisfies the recurrence b_{n+2} = 2b_{n+1} - b_n
  have hb : ∀ n, b (n + 2) = 2 * b (n + 1) - b n := by
    intro n
    -- Compute b (n + 2) = 1 / a (n + 2) using the recurrence for a
    rw [h₂ n]
    -- Simplify the expression using the definition of b
    field_simp [b]
    -- The recurrence for b follows from algebraic manipulation
    ring
  -- Initial conditions for b: b 1 = 1 and b 2 = 7/3
  have hb0 : b 1 = 1 := by rw [b, h₀, one_div_one]
  have hb1 : b 2 = 7 / 3 := by rw [b, h₁, one_div, inv_div]
  -- The recurrence for b is linear with constant coefficients
  -- The general solution is b n = A + B * (n - 1)
  -- We solve for A and B using the initial conditions
  have hb_general : ∀ n, b n = 1 + (4 / 3) * (n - 1) := by
    -- Prove by induction
    intro n
    induction n using Nat.recAux with
    | zero => simp
    | succ n ih =>
      cases n with
      | zero => exact hb0
      | succ n =>
        cases n with
        | zero => exact hb1
        | succ n =>
          -- Use the recurrence relation and induction hypothesis
          rw [hb n, ih n, ih (n + 1)]
          -- Simplify to show the general form holds
          ring
  -- Now, derive the closed form for a_n = 1 / b_n = 3 / (4n - 1)
  have ha_general : ∀ n, a n = 3 / (4 * n - 1) := by
    intro n
    rw [← one_div, b, hb_general n]
    -- Simplify the expression
    field_simp
    ring
  -- Compute a 2019 using the closed form
  have ha2019 : a 2019 = 3 / (4 * 2019 - 1) := ha_general 2019
  -- Simplify the denominator
  have denom : 4 * 2019 - 1 = 8075 := by norm_num
  rw [ha2019, denom]
  -- Show that 3 / 8075 is in reduced form (gcd(3, 8075) = 1)
  have gcd_eq : Nat.gcd 3 8075 = 1 := by
    -- Compute the prime factorization of 8075 = 5^2 * 17 * 19
    -- 3 does not divide 8075
    rw [Nat.gcd_eq_left (Nat.dvd_gcd_iff.mpr ⟨by decide, by decide⟩)]
  -- The numerator and denominator are coprime
  have reduced : (3 / 8075).num = 3 ∧ (3 / 8075).den = 8075 := by
    apply Rat.num_den_mk
    · exact Nat.Prime.ne_one (by decide) (Nat.gcd_eq_one_iff_coprime.mp gcd_eq)
    · exact gcd_eq
  -- Extract numerator and denominator
  rcases reduced with ⟨hnum, hden⟩
  rw [hnum, hden]
  -- Compute p + q = 3 + 8075 = 8078
  norm_num