theorem mathd_numbertheory_150 (n : ℕ) (h₀ : ¬Nat.Prime (7 + 30 * n)) : 6 ≤ n:=
  by
  have h₁ : n ≥ 6:= by
    --  by_contra h
    have h₂ : n ≤ 5:= by -- linarith
      linarith
    --  --  interval_cases n <;> norm_num [Nat.Prime] at h₀ ⊢ <;> (try contradiction) <;> (try norm_num) <;> (try decide) <;>
                (try omega) <;>
              norm_num [Nat.Prime] at h₀ ⊢ <;>
            (try contradiction) <;>
          (try norm_num) <;>
        (try decide) <;>
      (try omega)
    hole
  --  linarith
  linarith