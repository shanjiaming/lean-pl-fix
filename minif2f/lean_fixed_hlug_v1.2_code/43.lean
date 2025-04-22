import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Solve the equation $\cos^2{x}+\cos^2{2x}+\cos^2{3x}=1$.-/
theorem imo_1962_p4 (S : Set ℝ)
    (h₀ : S = { x : ℝ | Real.cos x ^ 2 + Real.cos (2 * x) ^ 2 + Real.cos (3 * x) ^ 2 = 1 }) :
    S =
      { x : ℝ |
        ∃ m : ℤ,
          x = Real.pi / 2 + m * Real.pi ∨
            x = Real.pi / 4 + m * Real.pi / 2 ∨ x = Real.pi / 6 + m * Real.pi / 6 ∨ x = 5 * Real.pi / 6 + m * Real.pi / 6 } := by
  -- First, we'll set the equation to solve: cos²x + cos²2x + cos²3x = 1
  -- Let's simplify the equation using trigonometric identities
  ext x  -- Extensionality: prove two sets are equal by showing they have the same elements
  rw [h₀]  -- Rewrite using the definition of S
  -- Apply double angle formula for cos(2x) and triple angle formula for cos(3x)
  have trig_expand : cos x ^ 2 + cos (2 * x) ^ 2 + cos (3 * x) ^ 2 =
      3/2 + (cos (6*x) + cos (4*x) + cos (2*x))/2 := by
    -- Expand each term using trigonometric identities
    have h1 : cos (2*x) = 2 * cos x ^ 2 - 1 := by exact cos_two_mul x
    have h2 : cos (3*x) = 4 * cos x ^ 3 - 3 * cos x := by exact cos_three_mul x
    -- Square each term and expand
    rw [h1, h2]
    -- Perform algebraic simplification
    ring_nf  -- Normalize the ring expression
    -- Convert to multiple angle form using power reduction identities
    rw [cos_sq]
    rw [cos_sq]
    rw [cos_sq]
    ring_nf
    -- Final simplification
    field_simp
    ring
  -- Rewrite the original equation using the expanded form
  rw [trig_expand]
  -- Simplify the equation: 3/2 + (cos(6x) + cos(4x) + cos(2x))/2 = 1
  -- Which becomes: cos(6x) + cos(4x) + cos(2x) = -1
  have simplified_eq : (3/2 + (cos (6*x) + cos (4*x) + cos (2*x))/2 = 1) ↔ 
      (cos (6*x) + cos (4*x) + cos (2*x) = -1 := by
    -- Move terms around to isolate the trigonometric sum
    field_simp
    linarith
  rw [simplified_eq]
  -- Now use sum-to-product identities to combine terms
  have sum_cos : cos (6*x) + cos (2*x) = 2 * cos (4*x) * cos (2*x) := by
    exact cos_add_cos _ _ (by ring : 6*x = 4*x + 2*x) (by ring : 2*x = 4*x - 2*x)
  rw [sum_cos, add_assoc]
  -- Equation becomes: 2 * cos(4x) * cos(2x) + cos(4x) = -1
  -- Factor out cos(4x): cos(4x)(2cos(2x) + 1) = -1
  -- Let's set y = 2x to simplify
  let y := 2*x
  have y_def : y = 2*x := rfl
  -- Rewrite equation in terms of y
  have eq_in_y : cos (2*y) * (2 * cos y + 1) = -1 := by
    rw [y_def]
    -- cos(4x) = cos(2*(2x)) = cos(2y)
    -- Now the equation is cos(2y)(2cos(y) + 1) = -1
    ring_nf
  -- Expand cos(2y) using double angle formula
  rw [cos_two_mul] at eq_in_y
  -- Equation becomes: (2cos²y - 1)(2cos y + 1) = -1
  -- Expand the product
  have poly_eq : (2 * cos y ^ 2 - 1) * (2 * cos y + 1) + 1 = 0 := by
    rw [← eq_in_y]
    ring
  -- Simplify the polynomial equation
  rw [← sub_eq_zero] at poly_eq
  simp at poly_eq
  -- After expansion: 4cos³y + 2cos²y - 2cos y = 0
  -- Factor out 2cos y: 2cos y (2cos²y + cos y - 1) = 0
  have factored : 2 * cos y * (2 * cos y ^ 2 + cos y - 1) = 0 := by
    rw [← poly_eq]
    ring
  -- Solve the factored equation
  rw [mul_eq_zero, mul_eq_zero] at factored
  -- Three cases to consider:
  -- 1. 2 = 0 (impossible)
  -- 2. cos y = 0
  -- 3. 2cos²y + cos y - 1 = 0
  -- Case 1 is trivial, case 2 gives cos y = 0, case 3 is quadratic in cos y
  have case2 : cos y = 0 ↔ ∃ k : ℤ, y = π/2 + k * π := by
    exact cos_eq_zero_iff
  have case3 : 2 * cos y ^ 2 + cos y - 1 = 0 ↔ cos y = -1 ∨ cos y = 1/2 := by
    -- Solve quadratic equation
    have quad_sol := by
      let a := cos y
      have : 2*a^2 + a - 1 = 0 ↔ a = (-1 + sqrt (1 + 8))/4 ∨ a = (-1 - sqrt (1 + 8))/4 := by
        apply quadratic_eq_zero_iff
        norm_num
      rw [this]
      -- Simplify solutions
      have sqrt9 : sqrt 9 = 3 := by exact Real.sqrt_eq_iff_sq_eq.mpr (by norm_num)
      rw [sqrt9]
      -- Solutions simplify to cos y = 1/2 or cos y = -1
      constructor <;> intro h <;> cases h <;> simp [h] <;> norm_num
    exact quad_sol
  -- Now combine all cases
  rw [case2, case3] at factored
  -- Convert back to x using y = 2x
  rw [y_def] at *
  -- For each solution of cos(2x), find all x that satisfy it
  simp_rw [exists_or, ← or_assoc]
  -- Case 1: cos(2x) = 0 → x = π/4 + kπ/2
  have sol1 : cos (2 * x) = 0 ↔ ∃ m : ℤ, x = π/4 + m * π/2 := by
    rw [cos_eq_zero_iff]
    simp [mul_comm, eq_comm]
  -- Case 2: cos(2x) = -1 → x = π/2 + kπ
  have sol2 : cos (2 * x) = -1 ↔ ∃ m : ℤ, x = π/2 + m * π := by
    rw [cos_eq_neg_one_iff]
    simp [mul_comm, eq_comm]
  -- Case 3: cos(2x) = 1/2 → 2x = ±π/3 + 2kπ → x = ±π/6 + kπ
  have sol3 : cos (2 * x) = 1/2 ↔ (∃ m : ℤ, x = π/6 + m * π) ∨ (∃ m : ℤ, x = -π/6 + m * π) := by
    rw [cos_eq_one_half_iff]
    simp [mul_comm, eq_comm]
    constructor <;> intro h <;> cases h <;> simp [h] <;> norm_num
  -- Combine all solutions
  rw [sol1, sol2, sol3]
  -- The negative solution -π/6 can be rewritten as 5π/6 - π using periodicity
  have neg_sol : (∃ m : ℤ, x = -π/6 + m * π) ↔ ∃ m : ℤ, x = 5*π/6 + m * π := by
    constructor
    · intro ⟨m, hm⟩
      use m + 1
      rw [hm]
      field_simp
      ring
    · intro ⟨m, hm⟩
      use m - 1
      rw [hm]
      field_simp
      ring
  rw [neg_sol]
  -- Final form of the solution set
  simp_rw [exists_or]
  -- Combine all cases with proper formatting
  simp only [exists_or, ← or_assoc]
  -- The solution now matches the required form
  rfl