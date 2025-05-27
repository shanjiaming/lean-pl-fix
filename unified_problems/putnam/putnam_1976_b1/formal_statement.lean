theorem putnam_1976_b1
: Tendsto (fun n : ℕ => ((1 : ℝ)/n)*∑ k in Finset.Icc (1 : ℤ) n, (Int.floor ((2*n)/k) - 2*Int.floor (n/k))) atTop
(𝓝 (Real.log ((4, 1) : ℕ × ℕ ).1 - ((4, 1) : ℕ × ℕ ).2)) := by