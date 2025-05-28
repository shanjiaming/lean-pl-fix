theorem h6 (n : ℕ) (h1 :  ∑ k ∈ Finset.range (n + 1), C ((-1) ^ k * ↑(n.choose k)) * (X - C ↑k) ^ n =    ∑ k ∈ Finset.range (n + 1),      C ((-1) ^ k * ↑(n.choose k)) * ∑ i ∈ Finset.range (n + 1), C (↑(n.choose i) * (-↑k) ^ (n - i)) * X ^ i) (h2 :  ∑ k ∈ Finset.range (n + 1),      C ((-1) ^ k * ↑(n.choose k)) * ∑ i ∈ Finset.range (n + 1), C (↑(n.choose i) * (-↑k) ^ (n - i)) * X ^ i =    ∑ i ∈ Finset.range (n + 1),      (∑ k ∈ Finset.range (n + 1), (-1) ^ k * ↑(n.choose k) * (↑(n.choose i) * (-↑k) ^ (n - i))) • X ^ i) (i : ℕ) (hi : i ∈ Finset.range (n + 1)) (h4 : i < n + 1) (h5 : i ≤ n) : ∑ k ∈ Finset.range (n + 1), (-1) ^ k * ↑(n.choose k) * (↑(n.choose i) * (-↑k) ^ (n - i)) =
    if i = n then ↑n.factorial else 0 :=
  by
  have h7 : i ≤ n := by sorry
  have h8 :
    (∑ k in Finset.range (n + 1), ((-1 : ℤ) ^ k * (Nat.choose n k : ℤ) * ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)))) =
      if i = n then (Nat.factorial n : ℤ) else 0 := by sorry
  exact h8