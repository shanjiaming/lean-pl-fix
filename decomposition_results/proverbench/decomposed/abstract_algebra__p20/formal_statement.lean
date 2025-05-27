theorem leading_coefficient_divisibility (h_div : ∀ x : ℤ, m ∣ P.eval x) :
m ∣ Nat.factorial (P.natDegree) * P.leadingCoeff :=