theorem h₁ (n : ℕ) (pnat : Equiv.Perm (Fin n) → ℕ → ℕ) (pcount : Equiv.Perm (Fin n) → ℕ) (ngt1 : n > 1) (hpnat : ∀ (p : Equiv.Perm (Fin n)) (k : Fin n), pnat p (↑k : ℕ) = (↑((p : Fin n → Fin n) k) : ℕ)) (hpcount :  ∀ (p : Equiv.Perm (Fin n)),    (↑(pcount p) : ℕ∞) =      {k |          ((↑k : ℕ) = 0 ∨ pnat p ((↑k : ℕ) - 1) < pnat p (↑k : ℕ)) ∧            ((↑k : ℕ) = n - 1 ∨ pnat p (↑k : ℕ) > pnat p ((↑k : ℕ) + 1))}.encard) : False := by
  have h₂ := hpnat (1 : Equiv.Perm (Fin n)) ⟨0, by omega⟩
  have h₃ := hpnat (1 : Equiv.Perm (Fin n)) ⟨0, by omega⟩
  --  --  --  norm_num [Equiv.Perm.one_apply] at h₂ h₃ <;> simp_all (config := { decide := true }) <;> (try omega) <;>
  --        (try
  --            {cases n with
  --            | zero => contradiction
  --            | succ n => simp_all [Fin.ext_iff, Fin.val_zero, Nat.div_eq_of_lt] <;> omega
  --          }) <;>
  --      (try
  --          {cases n with
  --          | zero => contradiction
  --          | succ n => simp_all [Fin.ext_iff, Fin.val_zero, Nat.div_eq_of_lt] <;> omega
  --        }) <;>
  --    (try
  --        {cases n with
  --        | zero => contradiction
  --        | succ n => simp_all [Fin.ext_iff, Fin.val_zero, Nat.div_eq_of_lt] <;> omega
  --      })
  hole