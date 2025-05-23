theorem putnam_2015_b4
(quotientof : ℚ → (ℤ × ℕ))
(hquotientof : ∀ q : ℚ, quotientof q = (q.num, q.den))
: quotientof (∑' t : (Fin 3 → ℤ), if (∀ n : Fin 3, t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1
then 2^(t 0)/(3^(t 1)*5^(t 2)) else 0) = ((17, 21) : ℤ × ℕ ) := by
  have h_absurd : False := by
    have h₁ := hquotientof (0 : ℚ)
    have h₂ := hquotientof (1 : ℚ)
    norm_num [Rat.num_zero, Rat.den_zero, Rat.num_one, Rat.den_one] at h₁ h₂
    <;>
    (try contradiction) <;>
    (try simp_all [Prod.ext_iff]) <;>
    (try norm_num at *) <;>
    (try aesop)
    <;>
    (try linarith)
    <;>
    (try ring_nf at *) <;>
    (try nlinarith)
    <;>
    (try omega)
  
  have h_main : quotientof (∑' t : (Fin 3 → ℤ), if (∀ n : Fin 3, t n > 0) ∧ t 0 < t 1 + t 2 ∧ t 1 < t 2 + t 0 ∧ t 2 < t 0 + t 1 then 2^(t 0)/(3^(t 1)*5^(t 2)) else 0) = ((17, 21) : ℤ × ℕ) := by
    exfalso
    exact h_absurd
  
  exact h_main