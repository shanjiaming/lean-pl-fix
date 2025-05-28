theorem h₂ (a : ℕ) (h₀ : a = ∑ k ∈ divisors 500, k) (h₁ : a = 1092) : ∑ k ∈ {x ∈ a.divisors | Nat.Prime x}, k = 25 :=
  by
  rw [h₁]
  have h₃ : (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors 1092), k) = 25 := by sorry
  exact h₃