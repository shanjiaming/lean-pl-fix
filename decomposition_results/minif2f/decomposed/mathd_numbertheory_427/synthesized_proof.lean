theorem mathd_numbertheory_427 (a : ℕ) (h₀ : a = ∑ k in Nat.divisors 500, k) :
    (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors a), k) = 25 := by
  have h₁ : a = 1092 := by
    simpa
  
  have h₂ : (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors a), k) = 25 := by
    rw [h₁]

    have h₃ : (∑ k in Finset.filter (fun x => Nat.Prime x) (Nat.divisors 1092), k) = 25 := by
      
      admit
    
    linarith
  
  linarith
