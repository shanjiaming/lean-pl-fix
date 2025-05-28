theorem mathd_numbertheory_427 (a : ℕ) (h₀ : a = ∑ k ∈ divisors 500, k) : ∑ k ∈ {x ∈ a.divisors | Nat.Prime x}, k = 25 :=
  by
  have h₁ : a = 1092 := by sorry
  have h₂ : (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors a), k) = 25 := by sorry
  --  exact h₂
  linarith