import Mathlib

open Filter Topology Bornology Set Polynomial

/--
Let $a_{m,n}$ denote the coefficient of $x^n$ in the expansion of $(1+x+x^2)^m$.  Prove that for all [integers] $k\geq 0$, \[0\leq \sum_{i=0}^{\lfloor \frac{2k}{3}\rfloor} (-1)^i a_{k-i,i}\leq 1.\]
-/
theorem putnam_1997_b4
    (a : ℕ → ℕ → ℤ)
    (ha : ∀ m n, a m n = coeff ((1 + X + X ^ 2) ^ m) n)
    (k : ℕ) :
    (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ∈ Icc 0 1 := by
  have h₁ : (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ≥ 0 := by
    have h₂ : ∀ (k : ℕ), (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ≥ 0 := by
      intro k
      have h₃ : (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ≥ 0 := by
        -- Use the fact that the sum is non-negative for all k
        norm_num [ha, Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat]
        <;>
        (try cases k <;> norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add,
          Nat.cast_mul, Nat.cast_ofNat]) <;>
        (try ring_nf at * <;> norm_num) <;>
        (try linarith) <;>
        (try nlinarith) <;>
        (try omega) <;>
        (try ring_nf at * <;> norm_num) <;>
        (try linarith) <;>
        (try nlinarith) <;>
        (try omega)
        <;>
        (try
          {
            norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
              Nat.cast_ofNat] at *
            <;>
            ring_nf at *
            <;>
            norm_num at *
            <;>
            linarith
          })
        <;>
        (try
          {
            norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
              Nat.cast_ofNat] at *
            <;>
            ring_nf at *
            <;>
            norm_num at *
            <;>
            nlinarith
          })
        <;>
        (try
          {
            norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
              Nat.cast_ofNat] at *
            <;>
            ring_nf at *
            <;>
            norm_num at *
            <;>
            omega
          })
      exact h₃
    exact h₂ k
    <;>
    (try cases k <;> norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add,
      Nat.cast_mul, Nat.cast_ofNat]) <;>
    (try ring_nf at * <;> norm_num) <;>
    (try linarith) <;>
    (try nlinarith) <;>
    (try omega) <;>
    (try ring_nf at * <;> norm_num) <;>
    (try linarith) <;>
    (try nlinarith) <;>
    (try omega)
    <;>
    (try
      {
        norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at *
        <;>
        ring_nf at *
        <;>
        norm_num at *
        <;>
        linarith
      })
    <;>
    (try
      {
        norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at *
        <;>
        ring_nf at *
        <;>
        norm_num at *
        <;>
        nlinarith
      })
    <;>
    (try
      {
        norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at *
        <;>
        ring_nf at *
        <;>
        norm_num at *
        <;>
        omega
      })
  
  have h₂ : (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ≤ 1 := by
    have h₃ : ∀ (k : ℕ), (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ≤ 1 := by
      intro k
      have h₄ : (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ≤ 1 := by
        -- Use the fact that the sum is at most 1 for all k
        norm_num [ha, Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat]
        <;>
        (try cases k <;> norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add,
          Nat.cast_mul, Nat.cast_ofNat]) <;>
        (try ring_nf at * <;> norm_num) <;>
        (try linarith) <;>
        (try nlinarith) <;>
        (try omega) <;>
        (try ring_nf at * <;> norm_num) <;>
        (try linarith) <;>
        (try nlinarith) <;>
        (try omega)
        <;>
        (try
          {
            norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
              Nat.cast_ofNat] at *
            <;>
            ring_nf at *
            <;>
            norm_num at *
            <;>
            linarith
          })
        <;>
        (try
          {
            norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
              Nat.cast_ofNat] at *
            <;>
            ring_nf at *
            <;>
            norm_num at *
            <;>
            nlinarith
          })
        <;>
        (try
          {
            norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
              Nat.cast_ofNat] at *
            <;>
            ring_nf at *
            <;>
            norm_num at *
            <;>
            omega
          })
      exact h₄
    exact h₃ k
    <;>
    (try cases k <;> norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add,
      Nat.cast_mul, Nat.cast_ofNat]) <;>
    (try ring_nf at * <;> norm_num) <;>
    (try linarith) <;>
    (try nlinarith) <;>
    (try omega) <;>
    (try ring_nf at * <;> norm_num) <;>
    (try linarith) <;>
    (try nlinarith) <;>
    (try omega)
    <;>
    (try
      {
        norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at *
        <;>
        ring_nf at *
        <;>
        norm_num at *
        <;>
        linarith
      })
    <;>
    (try
      {
        norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at *
        <;>
        ring_nf at *
        <;>
        norm_num at *
        <;>
        nlinarith
      })
    <;>
    (try
      {
        norm_num [Finset.sum_range_succ, coeff_add, coeff_mul, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at *
        <;>
        ring_nf at *
        <;>
        norm_num at *
        <;>
        omega
      })
  
  have h₃ : (∑ i in Finset.Iic ⌊2 * (k : ℚ) / 3⌋₊, (-1 : ℤ) ^ i * a (k - i) i) ∈ Icc 0 1 := by
    constructor
    · -- Prove the lower bound 0 ≤ ∑ ...
      exact h₁
    · -- Prove the upper bound ∑ ... ≤ 1
      exact h₂
  
  exact h₃