theorem putnam_2012_b6 (p : ℕ) (hpodd : Odd p) (hpprime : Nat.Prime p) (hpmod3 : p ≡ 2 [MOD 3]) (P : Equiv.Perm (Fin p))
  (hP : ∀ i : Fin p, P i = (i * i * i)) : Equiv.Perm.signAux P = 1 ↔ (p ≡ 3 [MOD 4]):=
  by
  have h_forward : p ≡ 3 [MOD 4] → Equiv.Perm.signAux P = 1:=
    by
    --  intro h
    have h₁ : p ≡ 3 [MOD 4] := h
    have h₂ : p % 4 = 3:= by
      --  rw [Nat.ModEq] at h₁
      --  omega
      simpa
    have h₃ : p % 3 = 2:= by
      --  rw [Nat.ModEq] at hpmod3
      --  omega
      simpa
    have h₄ : p ≠ 0:= by
      --  intro h₄
      --  rw [h₄] at hpprime
      --  norm_num at hpprime <;> contradiction
      omega
    have h₅ : p ≠ 0 := h₄
    have h₆ : p ≥ 2 := Nat.Prime.two_le hpprime
    have h₇ : Equiv.Perm.signAux P = 1:= by
      --  cases p with
      --  | zero => contradiction
      --  | succ p =>
      --    cases p with
      --    | zero => contradiction
      --    | succ p =>
      --      cases p with
      --      | zero => contradiction
      --      | succ p =>
      --        cases p with
      --        | zero => contradiction
      --        | succ p =>
      --          simp_all [Nat.ModEq, Equiv.Perm.signAux, Fin.forall_fin_succ, Fin.val_zero, Fin.val_succ, Nat.add_assoc,
      --                          Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm,
      --                          Nat.mod_eq_of_lt] <;>
      --                        (try decide) <;>
      --                      (try omega) <;>
      --                    (try ring_nf at *) <;>
      --                  (try norm_num at *) <;>
      --                (try contradiction) <;>
      --              (try simp_all [Equiv.Perm.signAux]) <;>
      --            (try omega)
      hole
    --  exact h₇
    hole
  have h_backward : Equiv.Perm.signAux P = 1 → p ≡ 3 [MOD 4]:=
    by
    --  intro h
    have h₁ : Equiv.Perm.signAux P = 1 := h
    have h₂ : p % 4 = 3:= by
      --  by_contra h₃
      have h₄ : p % 4 = 1:=
        by
        have h₅ : p % 4 = 1 ∨ p % 4 = 3:=
          by
          have h₅₁ : p % 2 = 1:= by
            --  cases' hpodd with k hk
            --  omega
            hole
          have h₅₂ : p % 4 = 1 ∨ p % 4 = 3:= by -- omega
            omega
          --  exact h₅₂
          omega
        --  cases' h₅ with h₅ h₅
        --  · omega
        --  · contradiction
        hole
      have h₅ : p % 3 = 2:= by
        --  rw [Nat.ModEq] at hpmod3
        --  omega
        simpa
      have h₆ : p ≠ 0:= by
        --  intro h₆
        --  rw [h₆] at hpprime
        --  norm_num at hpprime <;> contradiction
        omega
      have h₇ : p ≥ 2 := Nat.Prime.two_le hpprime
      have h₈ : Equiv.Perm.signAux P = 1:= by
        --  cases p with
        --  | zero => contradiction
        --  | succ p =>
        --    cases p with
        --    | zero => contradiction
        --    | succ p =>
        --      cases p with
        --      | zero => contradiction
        --      | succ p =>
        --        cases p with
        --        | zero => contradiction
        --        | succ p =>
        --          simp_all [Nat.ModEq, Equiv.Perm.signAux, Fin.forall_fin_succ, Fin.val_zero, Fin.val_succ, Nat.add_assoc,
        --                          Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm,
        --                          Nat.mod_eq_of_lt] <;>
        --                        (try decide) <;>
        --                      (try omega) <;>
        --                    (try ring_nf at *) <;>
        --                  (try norm_num at *) <;>
        --                (try contradiction) <;>
        --              (try simp_all [Equiv.Perm.signAux]) <;>
        --            (try omega)
        simpa
      --  omega
      hole
    have h₃ : p ≡ 3 [MOD 4]:= by
      --  rw [Nat.ModEq]
      --  exact h₂
      simpa
    --  exact h₃
    hole
  --  exact ⟨h_backward, h_forward⟩
  hole