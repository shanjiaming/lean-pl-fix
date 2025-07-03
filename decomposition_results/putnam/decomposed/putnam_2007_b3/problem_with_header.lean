import Mathlib

open Set Nat Function

-- (2 ^ 2006 / Real.sqrt 5) * (((1 + Real.sqrt 5) / 2) ^ 3997 - ((1 + Real.sqrt 5) / 2) ^ (-3997 : ℤ))
/--
Let $x_0 = 1$ and for $n \geq 0$, let $x_{n+1} = 3x_n + \lfloor x_n \sqrt{5} \rfloor$. In particular, $x_1 = 5$, $x_2 = 26$, $x_3 = 136$, $x_4 = 712$. Find a closed-form expression for $x_{2007}$. ($\lfloor a \rfloor$ means the largest integer $\leq a$.)
-/
theorem putnam_2007_b3
(x : ℕ → ℝ)
(hx0 : x 0 = 1)
(hx : ∀ n : ℕ, x (n + 1) = 3 * (x n) + ⌊(x n) * Real.sqrt 5⌋)
: (x 2007 = ((2 ^ 2006 / Real.sqrt 5) * (((1 + Real.sqrt 5) / 2) ^ 3997 - ((1 + Real.sqrt 5) / 2) ^ (-3997 : ℤ)) : ℝ )) := by
  have h1 : x 1 = 5 := by
    have h1₁ : x 1 = 3 * (x 0) + ⌊(x 0) * Real.sqrt 5⌋ := by
      rw [hx] <;> simp [hx0]
    rw [h1₁, hx0]
    have h1₂ : ⌊(1 : ℝ) * Real.sqrt 5⌋ = 2 := by
      norm_num [Int.floor_eq_iff, Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
      <;>
      (try norm_num) <;>
      (try
        {
          nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
        }) <;>
      (try
        {
          constructor <;>
          nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
        })
    rw [h1₂] <;> norm_num <;>
    nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  
  have h2 : x 2 = 26 := by
    have h2₁ : x 2 = 3 * (x 1) + ⌊(x 1) * Real.sqrt 5⌋ := by
      rw [hx] <;> simp [h1]
    rw [h2₁, h1]
    have h2₂ : ⌊(5 : ℝ) * Real.sqrt 5⌋ = 11 := by
      rw [Int.floor_eq_iff]
      constructor
      · norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
        <;>
          nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
      · norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
        <;>
          nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
    rw [h2₂]
    <;> norm_num <;>
      nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  
  have h3 : x 3 = 136 := by
    have h3₁ : x 3 = 3 * (x 2) + ⌊(x 2) * Real.sqrt 5⌋ := by
      rw [hx]
      <;> simp [h2]
    rw [h3₁, h2]
    have h3₂ : ⌊(26 : ℝ) * Real.sqrt 5⌋ = 58 := by
      rw [Int.floor_eq_iff]
      constructor
      · norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
        <;>
          nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
      · norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
        <;>
          nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
    rw [h3₂]
    <;> norm_num
    <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  
  have h4 : x 4 = 712 := by
    have h4₁ : x 4 = 3 * (x 3) + ⌊(x 3) * Real.sqrt 5⌋ := by
      rw [hx]
      <;> simp [h3]
    rw [h4₁, h3]
    have h4₂ : ⌊(136 : ℝ) * Real.sqrt 5⌋ = 304 := by
      rw [Int.floor_eq_iff]
      constructor
      · norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
        <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
      · norm_num [Real.le_sqrt, Real.sqrt_lt, Nat.cast_le]
        <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
    rw [h4₂]
    <;> norm_num
    <;> nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  
  have h_main : x 2007 = ((2 ^ 2006 / Real.sqrt 5) * (((1 + Real.sqrt 5) / 2) ^ 3997 - ((1 + Real.sqrt 5) / 2) ^ (-3997 : ℤ)) : ℝ) := by
    have h5 : x 0 = 1 := hx0
    have h6 : x 1 = 5 := h1
    have h7 : x 2 = 26 := h2
    have h8 : x 3 = 136 := h3
    have h9 : x 4 = 712 := h4
    have h10 : ∀ n : ℕ, x (n + 1) = 3 * (x n) + ⌊(x n) * Real.sqrt 5⌋ := hx
    norm_num at h5 h6 h7 h8 h9 ⊢
    <;> simp_all [h5, h6, h7, h8, h9, h10]
    <;> norm_num
    <;> linarith
  
  apply h_main