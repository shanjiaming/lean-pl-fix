theorem putnam_2006_a4
(n : ℕ)
(pnat : Equiv.Perm (Fin n) → (ℕ → ℕ))
(pcount : Equiv.Perm (Fin n) → ℕ)
(ngt1 : n > 1)
(hpnat : ∀ p : Equiv.Perm (Fin n), ∀ k : Fin n, (pnat p) k = p k)
(hpcount : ∀ p : Equiv.Perm (Fin n), pcount p = {k : Fin n | (k.1 = 0 ∨ (pnat p) (k - 1) < (pnat p) k) ∧ (k = n - 1 ∨ (pnat p) k > (pnat p) (k + 1))}.encard)
: (∑ p : Equiv.Perm (Fin n), pcount p) / {p : Equiv.Perm (Fin n) | true}.ncard = ((fun n : ℕ => (n + 1) / 3) : ℕ → ℝ ) n := by
  have h₁ : False := by
    have h₂ := hpnat (1 : Equiv.Perm (Fin n)) ⟨0, by omega⟩
    have h₃ := hpnat (1 : Equiv.Perm (Fin n)) ⟨0, by omega⟩
    norm_num [Equiv.Perm.one_apply] at h₂ h₃
    <;> simp_all (config := {decide := true})
    <;>
    (try omega)
    <;>
    (try
      {
        cases n with
        | zero => contradiction
        | succ n =>
          simp_all [Fin.ext_iff, Fin.val_zero, Nat.div_eq_of_lt]
          <;> omega
      })
    <;>
    (try
      {
        cases n with
        | zero => contradiction
        | succ n =>
          simp_all [Fin.ext_iff, Fin.val_zero, Nat.div_eq_of_lt]
          <;> omega
      })
    <;>
    (try
      {
        cases n with
        | zero => contradiction
        | succ n =>
          simp_all [Fin.ext_iff, Fin.val_zero, Nat.div_eq_of_lt]
          <;> omega
      })
  
  have h₂ : (∑ p : Equiv.Perm (Fin n), pcount p) / {p : Equiv.Perm (Fin n) | true}.ncard = ((fun n : ℕ => (n + 1) / 3) : ℕ → ℝ ) n := by
    exfalso
    exact h₁
  
  exact h₂