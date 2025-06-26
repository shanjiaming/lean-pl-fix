import Mathlib

open Filter Topology Set Nat

/--
Let $p$ be a prime number. Let $h(x)$ be a polynomial with integer coefficients such that $h(0), h(1), \dots, h(p^2-1)$ are distinct modulo $p^2$. Show that $h(0), h(1), \dots, h(p^3-1)$ are distinct modulo $p^3$.
-/
theorem putnam_2008_b4
(p : ℕ)
(hp : Nat.Prime p)
(h : Polynomial ℤ)
(hh : ∀ i j : Finset.range (p ^ 2), h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 2] → i = j)
: (∀ i j : Finset.range (p ^ 3), h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 3] → i = j) := by
  have h_main : ∀ (i j : ℕ), i < p ^ 3 → j < p ^ 3 → h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 3] → i = j := by
    intro i j hi hj hij
    have h₁ : i < p ^ 3 := hi
    have h₂ : j < p ^ 3 := hj
    have h₃ : h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 3] := hij
    have h₄ : h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 2] := by
      -- Since p^3 divides p^2 when p ≥ 1, the congruence modulo p^3 implies congruence modulo p^2
      exact h₃.of_dvd (by
        -- Prove that p^2 divides p^3 for p ≥ 1
        norm_num [pow_two, pow_three]
        <;>
          ring_nf at *
        <;>
          use p
        <;>
          ring_nf
        <;>
          nlinarith [hp.two_le]
        )
    -- Use the given condition to show that i ≡ j mod p^2
    have h₅ : (i : ℕ) % (p ^ 2) = (j : ℕ) % (p ^ 2) := by
      have h₅₁ : h.eval ((i : ℕ) % (p ^ 2) : ℤ) ≡ h.eval ((j : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := by
        have h₅₂ : h.eval (i : ℤ) ≡ h.eval ((i : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := by
          have h₅₃ : (i : ℤ) ≡ ((i : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := by
            simp [Int.ModEq, Int.emod_emod]
            <;> norm_cast
            <;> omega
          exact (h.sub_dvd_eval_sub ((i : ℤ)) ((i : ℕ) % (p ^ 2) : ℤ)).symm.trans (h₅₃.symm.pow 1 |>.map (h.eval : ℤ → ℤ))
        have h₅₄ : h.eval (j : ℤ) ≡ h.eval ((j : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := by
          have h₅₅ : (j : ℤ) ≡ ((j : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := by
            simp [Int.ModEq, Int.emod_emod]
            <;> norm_cast
            <;> omega
          exact (h.sub_dvd_eval_sub ((j : ℤ)) ((j : ℕ) % (p ^ 2) : ℤ)).symm.trans (h₅₅.symm.pow 1 |>.map (h.eval : ℤ → ℤ))
        have h₅₆ : h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 2] := h₄
        have h₅₇ : h.eval ((i : ℕ) % (p ^ 2) : ℤ) ≡ h.eval ((j : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := h₅₂.trans (h₅₆.trans h₅₄)
        exact h₅₇
      -- Use the given condition to show that i ≡ j mod p^2
      have h₅₈ : (i : ℕ) % (p ^ 2) = (j : ℕ) % (p ^ 2) := by
        have h₅₉ : (i : ℕ) % (p ^ 2) < p ^ 2 := Nat.mod_lt _ (by
          have h₅₁₀ : p ≥ 2 := Nat.Prime.two_le hp
          have h₅₁₁ : p ^ 2 > 0 := by positivity
          linarith)
        have h₅₁₀ : (j : ℕ) % (p ^ 2) < p ^ 2 := Nat.mod_lt _ (by
          have h₅₁₁ : p ≥ 2 := Nat.Prime.two_le hp
          have h₅₁₂ : p ^ 2 > 0 := by positivity
          linarith)
        -- Use the given condition to show that i ≡ j mod p^2
        have h₅₁₁ : (i : ℕ) % (p ^ 2) = (j : ℕ) % (p ^ 2) := by
          by_contra h₅₁₂
          -- If i mod p^2 ≠ j mod p^2, then h(i mod p^2) ≡ h(j mod p^2) mod p^2 implies i mod p^2 = j mod p^2, a contradiction
          have h₅₁₃ : (i : ℕ) % (p ^ 2) ≠ (j : ℕ) % (p ^ 2) := h₅₁₂
          have h₅₁₄ : (i : ℕ) % (p ^ 2) < p ^ 2 := Nat.mod_lt _ (by
            have h₅₁₅ : p ≥ 2 := Nat.Prime.two_le hp
            have h₅₁₆ : p ^ 2 > 0 := by positivity
            linarith)
          have h₅₁₅ : (j : ℕ) % (p ^ 2) < p ^ 2 := Nat.mod_lt _ (by
            have h₅₁₆ : p ≥ 2 := Nat.Prime.two_le hp
            have h₅₁₇ : p ^ 2 > 0 := by positivity
            linarith)
          have h₅₁₆ : (i : ℕ) % (p ^ 2) ≠ (j : ℕ) % (p ^ 2) := h₅₁₃
          have h₅₁₇ : h.eval ((i : ℕ) % (p ^ 2) : ℤ) ≡ h.eval ((j : ℕ) % (p ^ 2) : ℤ) [ZMOD p ^ 2] := h₅₁
          have h₅₁₈ : (i : ℕ) % (p ^ 2) = (j : ℕ) % (p ^ 2) := by
            have h₅₁₉ : (i : ℕ) % (p ^ 2) ∈ Finset.range (p ^ 2) := by
              apply Finset.mem_range.mpr
              <;> omega
            have h₅₂₀ : (j : ℕ) % (p ^ 2) ∈ Finset.range (p ^ 2) := by
              apply Finset.mem_range.mpr
              <;> omega
            have h₅₂₁ : (i : ℕ) % (p ^ 2) = (j : ℕ) % (p ^ 2) := by
              have h₅₂₂ := hh ⟨(i : ℕ) % (p ^ 2), by
                apply Finset.mem_range.mpr
                <;> omega⟩ ⟨(j : ℕ) % (p ^ 2), by
                apply Finset.mem_range.mpr
                <;> omega⟩
              simpa [Finset.mem_range, Int.ModEq] using h₅₂₂ h₅₁₇
            exact h₅₂₁
          contradiction
        exact h₅₁₁
      exact h₅₈
    -- Since i ≡ j mod p^2, we can write j = i + k p^2 for some integer k
    have h₆ : j = i + (j - i) := by omega
    have h₇ : p ^ 2 ∣ j - i := by
      have h₇₁ : (i : ℕ) % (p ^ 2) = (j : ℕ) % (p ^ 2) := h₅
      have h₇₂ : (p ^ 2 : ℕ) ∣ j - i := by
        rw [← Nat.mod_add_div i (p ^ 2), ← Nat.mod_add_div j (p ^ 2)] at *
        simp [h₇₁, Nat.dvd_iff_mod_eq_zero, Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_eq_of_lt] at *
        <;>
        ring_nf at *
        <;>
        omega
      exact h₇₂
    have h₈ : j - i = 0 := by
      by_contra h₈₁
      have h₈₂ : p ^ 2 ∣ j - i := h₇
      have h₈₃ : p ^ 2 ≤ j - i := Nat.le_of_dvd (by
        have h₈₄ : j - i > 0 := by
          by_contra h₈₅
          have h₈₆ : j - i = 0 := by omega
          omega
        omega
        ) h₈₂
      have h₈₄ : j < p ^ 3 := hj
      have h₈₅ : i < p ^ 3 := hi
      have h₈₆ : j - i < p ^ 3 := by omega
      have h₈₇ : p ^ 2 ≤ j - i := h₈₃
      have h₈₈ : p ^ 2 < p ^ 3 := by
        have h₈₉ : p ≥ 2 := Nat.Prime.two_le hp
        have h₉₀ : p ^ 2 < p ^ 3 := by
          calc
            p ^ 2 < p ^ 3 := by
              exact Nat.pow_lt_pow_right (by omega) (by omega)
            _ = p ^ 3 := by rfl
        exact h₉₀
      omega
    omega
  
  have h_finset : ∀ (i j : Finset.range (p ^ 3)), h.eval (i : ℤ) ≡ h.eval (j : ℤ) [ZMOD p ^ 3] → i = j := by
    intro i j h₁
    have h₂ : i.val < p ^ 3 := Finset.mem_range.mp i.2
    have h₃ : j.val < p ^ 3 := Finset.mem_range.mp j.2
    have h₄ : i.val = j.val := h_main i.val j.val h₂ h₃ (by simpa using h₁)
    have h₅ : i = j := by
      simp_all [Finset.ext_iff]
      <;> aesop
    exact h₅
  
  intro i j h₁
  exact h_finset i j h₁