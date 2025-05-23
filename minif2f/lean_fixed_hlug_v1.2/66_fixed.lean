import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Define a sequence recursively by $t_1 = 20$, $t_2 = 21$, and$t_n = \frac{5t_{n-1}+1}{25t_{n-2}}$for all $n \ge 3$. Then $t_{2020}$ can be expressed as $\frac{p}{q}$, where $p$ and $q$ are relatively prime positive integers. Find $p+q$. Show that it is 626.-/
theorem aimeII_2020_p6 (t : ℕ → ℚ) (h₀ : t 1 = 20) (h₁ : t 2 = 21)
  (h₂ : ∀ n ≥ 3, t n = (5 * t (n - 1) + 1) / (25 * t (n - 2))) :
  ↑(t 2020).den + (t 2020).num = 626 := by
  -- First, we'll compute the first few terms to look for a pattern
  have t3 := h₂ 3 (by linarith)
  -- Compute t₃ using the recurrence relation
  rw [h₀, h₁] at t3
  -- Simplify t₃: (5*21 + 1)/(25*20) = 106/500 = 53/250
  simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t3
  norm_num at t3

  have t4 := h₂ 4 (by linarith)
  -- Compute t₄ using t₂ and t₃
  rw [h₁, t3] at t4
  -- Simplify t₄: (5*(53/250) + 1)/(25*21) = (53/50 + 1)/525 = (103/50)/525 = 103/26250
  simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t4
  norm_num at t4

  have t5 := h₂ 5 (by linarith)
  -- Compute t₅ using t₃ and t₄
  rw [t3, t4] at t5
  -- Simplify t₅: (5*(103/26250) + 1)/(25*(53/250)) = (103/5250 + 1)/(53/10) = (5353/5250)/(53/10) = 101/525
  simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t5
  norm_num at t5

  have t6 := h₂ 6 (by linarith)
  -- Compute t₆ using t₄ and t₅
  rw [t4, t5] at t6
  -- Simplify t₆: (5*(101/525) + 1)/(25*(103/26250)) = (101/105 + 1)/(103/1050) = (206/105)/(103/1050) = 20
  simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t6
  norm_num at t6

  have t7 := h₂ 7 (by linarith)
  -- Compute t₇ using t₅ and t₆
  rw [t5, t6] at t7
  -- Simplify t₇: (5*20 + 1)/(25*(101/525)) = 101/(101/21) = 21
  simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t7
  norm_num at t7

  -- We observe that the sequence is periodic with period 5:
  -- t₁ = 20, t₂ = 21, t₃ = 53/250, t₄ = 103/26250, t₅ = 101/525, t₆ = 20, t₇ = 21, ...
  -- Therefore, tₙ = t_{n mod 5} (with adjustment when n mod 5 = 0)

  -- Since 2020 ≡ 0 mod 5 (because 2020 = 5 × 404), we'll have t₂₀₂₀ = t₅ = 101/525
  -- Now we need to prove this periodicity

  -- First, prove the base cases of the periodicity
  have periodicity : ∀ n, t (n + 5) = t n := by
    -- We'll use strong induction
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      -- Cases for n < 5
      cases' n with n
      · -- n = 0 case (though our sequence starts at 1)
        simp
      cases' n with n
      · -- n = 1 case
        rw [h₀, ← t6]
        simp
      cases' n with n
      · -- n = 2 case
        rw [h₁, ← t7]
        simp
      cases' n with n
      · -- n = 3 case
        have t8 := h₂ 8 (by linarith)
        rw [t6, t7] at t8
        simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t8
        norm_num at t8
        rw [t3, t8]
      cases' n with n
      · -- n = 4 case
        have t8 := h₂ 8 (by linarith)
        rw [t6, t7] at t8
        simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t8
        norm_num at t8
        have t9 := h₂ 9 (by linarith)
        rw [t7, t8] at t9
        simp only [Nat.cast_ofNat, sub_self, add_zero, sub_zero, mul_one] at t9
        norm_num at t9
        rw [t4, t9]
      · -- n ≥ 5 case
        -- Use the recurrence relation and induction hypothesis
        have hrec := h₂ (n + 5) (by linarith)
        rw [hrec]
        -- Rewrite using induction hypothesis for (n+5)-1 and (n+5)-2
        rw [ih (n + 4) (by linarith), ih (n + 3) (by linarith)]
        -- Now use the recurrence relation for t (n + 3)
        have hrec' := h₂ (n + 3) (by linarith)
        rw [hrec']
        -- The expressions should now match by definition
        rfl

  -- Now compute t 2020 using the periodicity
  have key : t 2020 = t 5 := by
    -- 2020 = 5 × 404 + 0
    rw [← periodicity 0]
    simp only [Nat.cast_ofNat, zero_add, mul_eq_zero]
    -- Apply periodicity 404 times
    have : 2020 = 5 * 404 := by norm_num
    rw [this]
    -- General lemma: t (5 * k) = t 5 for any k
    suffices ∀ k, t (5 * k) = t 5 by
      apply this
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [Nat.mul_succ, add_comm, periodicity, ih]

  -- We already computed t5 = 101/525
  rw [key, t5]
  -- Now we need to show that 101/525 is in reduced form and compute num + den
  -- First, show numerator and denominator are coprime
  have : (101 : ℤ).Coprime 525 := by
    rw [Int.coprime_iff_nat_coprime]
    -- 101 is prime and doesn't divide 525
    have h101 : Nat.Prime 101 := by norm_num
    have : 525 = 3 * 5^2 * 7 := by norm_num
    rw [this]
    apply Nat.Coprime.coprime_mul_left
    · apply Nat.Coprime.coprime_mul_left
      · apply h101.coprime_iff_not_dvd.mpr
        decide
      · apply h101.coprime_iff_not_dvd.mpr
        decide
    · apply h101.coprime_iff_not_dvd.mpr
      decide
  -- Now simplify the rational number
  simp only [Rat.num_den', Rat.reduce, if_neg, Nat.cast_ofNat, not_false_eq_true]
  -- The reduced form is indeed 101/525
  -- Compute numerator + denominator
  norm_num