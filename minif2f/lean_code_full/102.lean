import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Let $a$ and $b$ be positive integers such that $ab + 1$ divides $a^{2} + b^{2}$. Show that
$
\frac {a^{2} + b^{2}}{ab + 1}
$
is the square of an integer.-/
theorem imo_1988_p6 (a b : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a * b + 1 ∣ a ^ 2 + b ^ 2) :
  ∃ x : ℕ, (x ^ 2 : ℝ) = (a ^ 2 + b ^ 2) / (a * b + 1) := by
  -- First, extract the positivity hypotheses for a and b
  rcases h₀ with ⟨ha, hb⟩
  
  -- Define k as the ratio (a² + b²)/(ab + 1), which is a natural number by divisibility
  set k := (a^2 + b^2) / (a*b + 1) with hk_def
  have hk_nat : k ∈ ℕ := by
    rw [← Nat.div_eq_of_eq_mul_right (by linarith) h₁]
    exact Nat.div_mul_le_self _ _

  -- We proceed by well-founded induction using the sum a + b as the decreasing metric
  revert a b ha hb h₁
  apply Nat.strong_induction_on (a + b)
  intro a b sum ih ha hb h₁

  -- Case 1: If a = b, then the ratio simplifies to (2a²)/(a² + 1), which must be integer
  by_cases h_eq : a = b
  · subst h_eq
    -- When a = b, k = (2a²)/(a² + 1)
    have hk : k = (2*a^2)/(a^2 + 1) := by
      simp [hk_def, mul_comm]
    -- Since a² + 1 divides 2a², we must have a = 1 (as a > 0)
    have ha1 : a = 1 := by
      have : a^2 + 1 ≤ 2*a^2 := by
        rw [hk] at hk_nat
        exact Nat.le_of_dvd (by positivity) hk_nat
      linarith [pow_two_sub_one a]
    -- When a = b = 1, k = 1 which is 1²
    subst ha1
    use 1
    simp [hk_def]

  -- Case 2: If a ≠ b, we can assume without loss of generality that a > b
  · wlog h_ab : a > b using a b
    -- If b > a, we can swap them and use symmetry
    · cases lt_or_gt_of_ne h_eq with
      | inl h => exact this b a (by rwa [add_comm]) h hb ha (by rwa [add_comm, pow_two, pow_two])
      | inr h => exact h
    
    -- Now we have a > b > 0
    -- Consider the quadratic equation x² - k*b*x + b² - k = 0, which a satisfies
    -- We know a is a root, let a' be the other root
    -- By Vieta's formulas, a + a' = k*b and a*a' = b² - k
    -- We'll show that (a', b) is a "smaller" solution
    
    -- Express k in terms of a and b
    have hk : k = (a^2 + b^2)/(a*b + 1) := rfl
    -- Rewrite the divisibility condition as an equation
    have h_eqn : a^2 + b^2 = k*(a*b + 1) := by
      exact Nat.eq_mul_of_div_eq (by linarith) hk_def.symm
    
    -- The quadratic equation x² - k*b*x + (b² - k) = 0
    -- We know a is a root, so we can factor:
    have h_quad : a^2 - k*b*a + (b^2 - k) = 0 := by
      linear_combination h_eqn - k
    
    -- Find the other root a' using Vieta's formula
    have a'_def : k*b - a = (a^2 + b^2)/(a*b + 1) * b - a := by rw [hk]
    have a'_nat : k*b - a ∈ ℕ := by
      rw [a'_def]
      apply Nat.sub_of_le
      suffices a^2*b ≤ a^2*b + (a + b^2*b) by simpa [mul_add, add_assoc, mul_comm]
      exact le_self_add
    
    set a' := k*b - a with ha'
    -- Verify that a' is indeed the other root
    have h_a'root : a'^2 - k*b*a' + (b^2 - k) = 0 := by
      rw [ha']
      linear_combination h_quad
    
    -- Show that a' is a natural number
    have ha'_pos : 0 < a' := by
      rw [ha', ← Nat.cast_lt (α := ℝ), Nat.cast_sub a'_nat, Nat.cast_mul, Nat.cast_add]
      -- Since a > b and k = (a² + b²)/(ab + 1) < a/b for a > b
      have : (k : ℝ) < a / b := by
        rw [hk]
        apply (div_lt_div_right ?_).mpr
        · simp only [Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_pow]
          have : b^2 < a*b := by nlinarith
          linarith
        · exact Nat.cast_pos.mpr hb
      calc (k : ℝ) * b - a < a/b * b - a := by linarith
           _ = a - a := by rw [mul_div_cancel' _ (Nat.cast_ne_zero.mpr hb.ne')]
           _ = 0 := by ring
      linarith
    
    -- Now we have a' positive and a' + b < a + b (since a' = k*b - a < a when a > b)
    have h_sum_lt : a' + b < a + b := by
      rw [ha']
      have : a' < a := by
        rw [ha', ← Nat.cast_lt (α := ℝ), Nat.cast_sub a'_nat, Nat.cast_mul, Nat.cast_add]
        -- Using the same estimate as before
        have : (k : ℝ) < a / b := by
          rw [hk]
          apply (div_lt_div_right ?_).mpr
          · simp only [Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_pow]
            have : b^2 < a*b := by nlinarith
            linarith
          · exact Nat.cast_pos.mpr hb
        calc (k : ℝ) * b - a < a/b * b - a := by linarith
             _ = a - a := by rw [mul_div_cancel' _ (Nat.cast_ne_zero.mpr hb.ne')]
             _ = 0 := by ring
        linarith
      linarith
    
    -- The pair (a', b) satisfies the same conditions with smaller sum
    have h₁' : a' * b + 1 ∣ a'^2 + b^2 := by
      rw [ha', ← h_eqn]
      -- After substitution and simplification, we get divisibility
      refine' ⟨k - a^2, _⟩
      linear_combination -h_quad
    
    -- Apply the induction hypothesis to (a', b)
    obtain ⟨x, hx⟩ := ih (a' + b) h_sum_lt a' b ha'_pos hb h₁'
    
    -- The same x works for our original (a, b) pair
    use x
    -- The ratio k is the same for both (a, b) and (a', b) pairs
    have hk_same : (a'^2 + b^2)/(a'*b + 1 : ℝ) = (a^2 + b^2)/(a*b + 1 : ℝ) := by
      rw [ha', ← h_eqn]
      simp only [Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_pow]
      field_simp
      ring
    rwa [← hk_same] at hx