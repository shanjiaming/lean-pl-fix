theorem h₂ (f : Fin 10 → Equiv.Perm ℤ) (mijcomp : ℕ → (ℕ → Fin 10) → ℕ → ℤ → ℤ) (F : Finset (ℤ → ℤ)) (hf : ∀ (n : ℤ), ∃ m i, m ≥ 1 ∧ mijcomp m i 0 0 = n) (hmijcomp :  ∀ m ≥ 1,    ∀ (i : ℕ → Fin 10) (j : Fin m),      mijcomp m i ↑j = if ↑j = m - 1 then ⇑(f (i ↑j)) else ⇑(f (i ↑j)) ∘ mijcomp m i (↑j + 1)) (hF :  ↑F =    {g |      ∃ e,        g =          (⇑(f 0))^[↑(e 0)] ∘            (⇑(f 1))^[↑(e 1)] ∘              (⇑(f 2))^[↑(e 2)] ∘                (⇑(f 3))^[↑(e 3)] ∘                  (⇑(f 4))^[↑(e 4)] ∘                    (⇑(f 5))^[↑(e 5)] ∘ (⇑(f 6))^[↑(e 6)] ∘ (⇑(f 7))^[↑(e 7)] ∘ (⇑(f 8))^[↑(e 8)] ∘ (⇑(f 9))^[↑(e 9)]}) (h₁ : False) : ∀ (A : Finset ℤ), A.Nonempty → {g ∈ F | g '' ↑A = ↑A}.card ≤ 512 :=
  by
  intro A hA
  exfalso
  exact h₁