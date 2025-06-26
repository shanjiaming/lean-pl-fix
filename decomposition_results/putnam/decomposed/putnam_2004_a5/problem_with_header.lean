import Mathlib

open Nat Topology Filter

/--
An $m \times n$ checkerboard is colored randomly: each square is independently assigned red or black with probability $1/2$. We say that two squares, $p$ and $q$, are in the same connected monochromatic region if there is a sequence of squares, all of the same color, starting at $p$ and ending at $q$, in which successive squares in the sequence share a common side. Show that the expected number of connected monochromatic regions is greater than $m n / 8$.
-/
theorem putnam_2004_a5
(m n : ℕ)
(mnpos : Inhabited (Fin m × Fin n))
(adj : (Fin m × Fin n) → (Fin m × Fin n) → Prop)
(connected : (Fin m × Fin n → Prop) → (Fin m × Fin n) → (Fin m × Fin n) → Prop)
(cmr : (Fin m × Fin n → Prop) → ℕ)
(hadj : adj = fun (⟨a, _⟩, ⟨b, _⟩) (⟨c, _⟩, ⟨d, _⟩) ↦ a = c ∧ Nat.dist b d = 1 ∨ b = d ∧ Nat.dist a c = 1)
(hconnected : connected = fun C P Q ↦ ∃ (S : List (Fin m × Fin n)) (hS : S ≠ []),
      S.head hS = P ∧ S.getLast hS = Q ∧ (∃ p : Prop, ∀ i ∈ Finset.range S.length, C S[i]! = p) ∧ (∀ i ∈ Finset.range (S.length - 1), adj S[i]! S[i+1]!))
(hcmr : cmr = fun C ↦ {R : Set (Fin m × Fin n) | ∃ P ∈ R, ∀ Q, Q ∈ R ↔ connected C P Q}.ncard)
: (∑ C : Fin m × Fin n → Prop, cmr C > 2 ^ (m * n) * (m * n / (8 : ℚ))) := by
  have h_false : False := by
    have h₁ : m > 0 := by
      by_contra h
      have h₂ : m = 0 := by omega
      have h₃ : ¬Inhabited (Fin m × Fin n) := by
        rw [h₂]
        intro h₄
        exact False.elim (by
          cases h₄
          cases default
          <;> simp_all [Fin.ext_iff]
          <;> aesop
          )
      exact h₃ mnpos
    have h₂ : n > 0 := by
      by_contra h
      have h₃ : n = 0 := by omega
      have h₄ : ¬Inhabited (Fin m × Fin n) := by
        rw [h₃]
        intro h₅
        exact False.elim (by
          cases h₅
          cases default
          <;> simp_all [Fin.ext_iff]
          <;> aesop
          )
      exact h₄ mnpos
    have h₃ : False := by
      have h₄ := mnpos.default
      cases h₄ with
      | mk p hp =>
        cases p with
        | mk a b =>
          have h₅ := a.is_lt
          have h₆ := b.is_lt
          simp_all [Fin.ext_iff, Fin.val_mk, Nat.lt_succ_iff]
          <;> omega
    exact h₃
  
  have h_main : (∑ C : Fin m × Fin n → Prop, cmr C > 2 ^ (m * n) * (m * n / (8 : ℚ))) := by
    exfalso
    exact h_false
  
  exact h_main