import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Which of the following is equal to the [[product]]
$\frac{8}{4}\cdot\frac{12}{8}\cdot\frac{16}{12}\cdot\cdots\cdot\frac{4n+4}{4n}\cdot\cdots\cdot\frac{2008}{2004}?$

$\textbf{(A)}\ 251\qquad\textbf{(B)}\ 502\qquad\textbf{(C)}\ 1004\qquad\textbf{(D)}\ 2008\qquad\textbf{(E)}\ 4016$ Show that it is \textbf{(B)}.-/
theorem amc12a_2008_p4 : (∏ k in Finset.Icc (1 : ℕ) 501, ((4 : ℝ) * k + 4) / (4 * k)) = 502 := by
  -- First, we simplify the general term of the product
  -- The term is (4k + 4)/(4k) which can be rewritten as 4(k + 1)/(4k) = (k + 1)/k
  have term_simplification : ∀ k : ℕ, ((4 : ℝ) * k + 4) / (4 * k) = (k + 1)/k := by
    intro k
    -- Factor out 4 from numerator
    rw [← add_mul, mul_comm 4 k, add_mul]
    -- Simplify numerator and denominator
    rw [mul_div_mul_left]
    -- The 4's cancel out
    exact (div_self (by norm_num : (4 : ℝ) ≠ 0)).symm ▸ rfl
    -- Ensure denominator is non-zero (k ≥ 1 in our product range)
    exact mul_ne_zero four_ne_zero (Nat.cast_ne_zero.mpr (k.ne_of_gt (Nat.pos_of_mem_Icc (k ∈ Finset.Icc 1 501))))
  
  -- Rewrite the product using the simplified term
  rw [Finset.prod_congr rfl term_simplification]
  
  -- Now we have a telescoping product ∏_{k=1}^501 (k+1)/k
  -- This can be written as (2/1) * (3/2) * (4/3) * ... * (502/501)
  -- Most terms cancel out, leaving just 502/1 = 502
  
  -- To formalize this, we use the theorem Finset.prod_range_div which states:
  -- ∏ i in range n, (f (i + 1) / f i) = f n / f 0 when f 0 ≠ 0
  -- Here, we adapt it to our Icc case
  
  -- First, convert Icc to range
  rw [Finset.Icc_eq_range, Finset.range_add_one]
  
  -- Now we have ∏ k in range 501, (k + 2)/(k + 1)
  -- We can rewrite this as ∏ k in range 501, f (k + 1)/f k where f k = k + 1
  have telescoping : (∏ k in Finset.range 501, ((k + 1) + 1)/(k + 1)) = 
      ((501 + 1) + 1)/(0 + 1) := by
    -- Apply the telescoping product theorem
    refine Finset.prod_range_div (fun n => (n + 1 : ℝ)) ?_
    -- Show the base case is non-zero (f 0 = 1 ≠ 0)
    norm_num
  
  -- Simplify the telescoping result
  rw [telescoping]
  -- The numerator is 502 + 1 = 503, but this seems wrong - we need to re-examine our indexing
  
  -- Actually, we made an indexing mistake. Let's correct the approach:
  
  -- The product ∏_{k=1}^n (k+1)/k = n+1
  -- Here n = 501, so the product should be 502
  
  -- Alternative approach using Finset.prod_range_succ:
  rw [Finset.Icc_eq_range, Finset.prod_range_add_one]
  simp only [Nat.cast_add, Nat.cast_one, add_le_iff_nonpos_right, nonpos_iff_eq_zero, 
    Finset.range_zero, Finset.prod_empty, div_one, one_mul]
  
  -- Now we have (501 + 1)/1 = 502
  norm_cast
  simp