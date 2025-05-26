theorem binomial_sum_equiv_product (n : ℕ) (x : ℝ) :
 ∑ k in range (2 * n + 1), (Nat.choose n (k/2)) * x^k = (1 + x) * (1 + x^2)^n :=