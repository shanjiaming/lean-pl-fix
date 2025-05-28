theorem h2 (fqsat : (ℝ → ℝ) → ℚ → Prop) (hfqsat : ∀ (f : ℝ → ℝ) (q : ℚ), fqsat f q ↔ ContDiff ℝ 1 f ∧ ∃ p, ↑p = f ↑q ∧ p.den = q.den) (f : ℝ → ℝ) (h1 : (∀ (q : ℚ), fqsat f q) → f ∈ {x | ∃ n, (fun x => x + ↑n) = x} ∪ {x | ∃ n, (fun x => -x + ↑n) = x}) : f ∈ {x | ∃ n, (fun x => x + ↑n) = x} ∪ {x | ∃ n, (fun x => -x + ↑n) = x} → ∀ (q : ℚ), fqsat f q :=
  by
  --  intro h
  have h3 : f ∈ ({fun (x : ℝ) => x + n | n : ℤ} : Set (ℝ → ℝ)) ∨ f ∈ ({fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) :=
    by aesop
  --  cases h3 with
  --  | inl h3 =>
  --    rcases h3 with ⟨n, rfl⟩
  --    intro q
  --    have h4 : fqsat (fun x : ℝ => x + (n : ℝ)) q := by
  --      rw [hfqsat]
  --      constructor
  --      · apply ContDiff.add
  --        · exact contDiff_id
  --        · exact contDiff_const
  --      ·
  --        have h5 : ∃ (p : ℚ), (p : ℝ) = (q : ℝ) + n ∧ p.den = q.den :=
  --          by
  --          have h6 : ∃ (p : ℚ), (p : ℝ) = (q : ℝ) + n := by
  --            use ↑q + n <;> simp [Rat.cast_add, Rat.cast_intCast] <;> ring_nf <;> norm_cast <;>
  --                    simp [Complex.ext_iff, pow_two] <;>
  --                  ring_nf <;>
  --                norm_num <;>
  --              linarith
  --          rcases h6 with ⟨p, hp⟩
  --          use p <;> aesop
  --        rcases h5 with ⟨p, hp1, hp2⟩
  --        aesop
  --    aesop
  --  | inr h3 =>
  --    rcases h3 with ⟨n, rfl⟩
  --    intro q
  --    have h4 : fqsat (fun x : ℝ => -x + (n : ℝ)) q := by
  --      rw [hfqsat]
  --      constructor
  --      · apply ContDiff.add
  --        · apply ContDiff.neg
  --          exact contDiff_id
  --        · exact contDiff_const
  --      ·
  --        have h5 : ∃ (p : ℚ), (p : ℝ) = -(q : ℝ) + n ∧ p.den = q.den :=
  --          by
  --          have h6 : ∃ (p : ℚ), (p : ℝ) = -(q : ℝ) + n := by
  --            use -q + n <;> simp [Rat.cast_add, Rat.cast_neg, Rat.cast_intCast] <;> ring_nf <;> norm_cast <;>
  --                    simp [Complex.ext_iff, pow_two] <;>
  --                  ring_nf <;>
  --                norm_num <;>
  --              linarith
  --          rcases h6 with ⟨p, hp⟩
  --          use p <;> aesop
  --        rcases h5 with ⟨p, hp1, hp2⟩
  --        aesop
  --    have h3 : f ∈ ({fun (x : ℝ) => x + n | n : ℤ} : Set (ℝ → ℝ)) ∨ f ∈ ({fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) := by sorry
have h2 :
  f ∈ ({fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) → (∀ (q : ℚ), fqsat f q) :=
  by
  intro h
  have h3 : f ∈ ({fun (x : ℝ) => x + n | n : ℤ} : Set (ℝ → ℝ)) ∨ f ∈ ({fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) :=
    by aesop
  cases h3 with
  | inl h3 =>
    rcases h3 with ⟨n, rfl⟩
    intro q
    have h4 : fqsat (fun x : ℝ => x + (n : ℝ)) q := by
      rw [hfqsat]
      constructor
      · apply ContDiff.add
        · exact contDiff_id
        · exact contDiff_const
      ·
        have h5 : ∃ (p : ℚ), (p : ℝ) = (q : ℝ) + n ∧ p.den = q.den :=
          by
          have h6 : ∃ (p : ℚ), (p : ℝ) = (q : ℝ) + n := by
            use ↑q + n <;> simp [Rat.cast_add, Rat.cast_intCast] <;> ring_nf <;> norm_cast <;>
                    simp [Complex.ext_iff, pow_two] <;>
                  ring_nf <;>
                norm_num <;>
              linarith
          rcases h6 with ⟨p, hp⟩
          use p <;> aesop
        rcases h5 with ⟨p, hp1, hp2⟩
        aesop
    aesop
  | inr h3 =>
    rcases h3 with ⟨n, rfl⟩
    intro q
    have h4 : fqsat (fun x : ℝ => -x + (n : ℝ)) q := by
      rw [hfqsat]
      constructor
      · apply ContDiff.add
        · apply ContDiff.neg
          exact contDiff_id
        · exact contDiff_const
      ·
        have h5 : ∃ (p : ℚ), (p : ℝ) = -(q : ℝ) + n ∧ p.den = q.den :=
          by
          have h6 : ∃ (p : ℚ), (p : ℝ) = -(q : ℝ) + n := by
            use -q + n <;> simp [Rat.cast_add, Rat.cast_neg, Rat.cast_intCast] <;> ring_nf <;> norm_cast <;>
                    simp [Complex.ext_iff, pow_two] <;>
                  ring_nf <;>
                norm_num <;>
              linarith
          rcases h6 with ⟨p, hp⟩
          use p <;> aesop
        rcases h5 with ⟨p, hp1, hp2⟩
        aesop
    aesop
  hole