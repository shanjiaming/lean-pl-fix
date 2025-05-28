theorem putnam_2022_a2 (n : ℕ) (hn : n ≥ 2) (S : Set ℝ[X]) (hS : S = {P | natDegree P = n}) (negs : ℝ[X] → ℕ)
  (hnegs : ∀ P : ℝ[X], negs P = ∑ i in Finset.range (P.natDegree + 1), if P.coeff i < 0 then 1 else 0) :
  sSup ({negs (P ^ 2) | P ∈ S}) = ((fun n => 2 * n - 2) : ℕ → ℕ) n:=
  by
  have h₁ : sSup ({negs (P ^ 2) | P ∈ S}) = (2 * n - 2 : ℕ):= by -- sorry
    hole
  have h₂ : ((fun n => 2 * n - 2) : ℕ → ℕ) n = (2 * n - 2 : ℕ):= by -- sorry
    norm_num
  have h₃ : sSup ({negs (P ^ 2) | P ∈ S}) = ((fun n => 2 * n - 2) : ℕ → ℕ) n:= by -- sorry
    linarith
  --  exact h₃
  linarith