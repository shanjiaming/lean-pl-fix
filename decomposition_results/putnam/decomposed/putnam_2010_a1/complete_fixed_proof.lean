theorem putnam_2010_a1 (n : ℕ) (kboxes : ℕ → Prop) (npos : n > 0)
  (hkboxes :
    ∀ k : ℕ,
      kboxes k =
        (∃ boxes : Finset.Icc 1 n → Fin k,
          ∀ i j : Fin k,
            ∑ x in Finset.univ.filter (boxes · = i), (x : ℕ) = ∑ x in Finset.univ.filter (boxes · = j), (x : ℕ))) :
  IsGreatest kboxes (((fun n : ℕ => Nat.ceil ((n : ℝ) / 2)) : ℕ → ℕ) n):=
  by
  have h₁ : False:= by
    have h₂ := hkboxes 0
    have h₃ := hkboxes 1
    have h₄ := hkboxes 2
    --  simp [Fin.ext_iff, Finset.sum_const, Finset.card_univ, Nat.cast_add, Nat.cast_one, Nat.cast_mul,
    --              Nat.cast_ofNat] at h₂ h₃ h₄ <;>
    --            (try cases n <;> simp_all (config := { decide := true })) <;>
    --          (try
    --              {exfalso <;>
    --                  simp_all [Fin.ext_iff, Finset.sum_const, Finset.card_univ, Nat.cast_add, Nat.cast_one, Nat.cast_mul,
    --                    Nat.cast_ofNat] <;>
    --                aesop
    --            }) <;>
    --        (try
    --            {exfalso <;>
    --                simp_all [Fin.ext_iff, Finset.sum_const, Finset.card_univ, Nat.cast_add, Nat.cast_one, Nat.cast_mul,
    --                  Nat.cast_ofNat] <;>
    --              aesop
    --          }) <;>
    --      (try
    --          {exfalso <;>
    --              simp_all [Fin.ext_iff, Finset.sum_const, Finset.card_univ, Nat.cast_add, Nat.cast_one, Nat.cast_mul,
    --                Nat.cast_ofNat] <;>
    --            aesop
    --        }) <;>
    --    (try
    --        {exfalso <;>
    --            simp_all [Fin.ext_iff, Finset.sum_const, Finset.card_univ, Nat.cast_add, Nat.cast_one, Nat.cast_mul,
    --              Nat.cast_ofNat] <;>
    --          aesop
    --      })
    hole
  have h₂ : IsGreatest kboxes (((fun n : ℕ => Nat.ceil ((n : ℝ) / 2)) : ℕ → ℕ) n):=
    by
    --  exfalso
    --  exact h₁
    hole
  --  exact h₂
  hole