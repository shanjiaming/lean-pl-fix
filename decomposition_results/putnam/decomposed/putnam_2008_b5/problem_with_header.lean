import Mathlib

open Filter Topology Set Nat

-- {fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ}
/--
Find all continuously differentiable functions f : \mathbb{R} \to \mathbb{R} such that for every rational number $q$, the number $f(q)$ is rational and has the same denominator as $q$.
-/
theorem putnam_2008_b5
(fqsat : (ℝ → ℝ) → ℚ → Prop)
(hfqsat : ∀ f q, fqsat f q ↔ ContDiff ℝ 1 f ∧ (∃ p : ℚ, p = f q ∧ p.den = q.den)) :
∀ f : (ℝ → ℝ), (∀ q : ℚ, fqsat f q) ↔ f ∈ (({fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ}) : Set (ℝ → ℝ)) := by
  have h_main : ∀ (f : ℝ → ℝ), (∀ (q : ℚ), fqsat f q) ↔ f ∈ ({fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) := by
    intro f
    have h1 : (∀ (q : ℚ), fqsat f q) → f ∈ ({fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) := by
      intro h
      -- We start by assuming that `f` satisfies the given conditions and show it must be in the union of the two sets.
      have h2 := h (0 : ℚ)
      have h3 := h (1 : ℚ)
      have h4 := h (-1 : ℚ)
      have h5 := h (1/2 : ℚ)
      have h6 := h (-1/2 : ℚ)
      -- Normalize the conditions to derive properties of `f`.
      norm_num [hfqsat, ContDiff] at h2 h3 h4 h5 h6
      -- Use the derived properties to conclude `f` is in the union of the sets.
      <;> simp_all [Set.mem_union, Set.mem_setOf_eq]
      <;>
      (try
        {
          exfalso
          <;>
          norm_num at *
          <;>
          (try
            {
              obtain ⟨p, hp1, hp2⟩ := h2.2
              obtain ⟨p', hp1', hp2'⟩ := h3.2
              obtain ⟨p'', hp1'', hp2''⟩ := h4.2
              obtain ⟨p''', hp1''', hp2'''⟩ := h5.2
              obtain ⟨p'''', hp1'''', hp2''''⟩ := h6.2
              norm_cast at *
              <;>
              simp_all [Rat.den_eq_one_iff]
              <;>
              ring_nf at *
              <;>
              norm_cast at *
              <;>
              field_simp at *
              <;>
              norm_cast at *
              <;>
              ring_nf at *
              <;>
              norm_cast at *
              <;>
              omega
            })
          <;>
          (try
            {
              obtain ⟨p, hp1, hp2⟩ := h2.2
              obtain ⟨p', hp1', hp2'⟩ := h3.2
              obtain ⟨p'', hp1'', hp2''⟩ := h4.2
              obtain ⟨p''', hp1''', hp2'''⟩ := h5.2
              obtain ⟨p'''', hp1'''', hp2''''⟩ := h6.2
              norm_cast at *
              <;>
              simp_all [Rat.den_eq_one_iff]
              <;>
              ring_nf at *
              <;>
              norm_cast at *
              <;>
              field_simp at *
              <;>
              norm_cast at *
              <;>
              ring_nf at *
              <;>
              norm_cast at *
              <;>
              omega
            })
        })
      <;>
      (try
        {
          -- Use Aesop to complete the proof.
          aesop
        })
    have h2 : f ∈ ({fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) → (∀ (q : ℚ), fqsat f q) := by
      intro h
      -- We assume `f` is in the union of the two sets and show it satisfies the conditions.
      have h3 : f ∈ ({fun (x : ℝ) => x + n | n : ℤ} : Set (ℝ → ℝ)) ∨ f ∈ ({fun (x : ℝ) => -x + n | n : ℤ} : Set (ℝ → ℝ)) := by
        aesop
      cases h3 with
      | inl h3 =>
        -- Case 1: `f(x) = x + n` for some integer `n`.
        rcases h3 with ⟨n, rfl⟩
        intro q
        have h4 : fqsat (fun x : ℝ => x + (n : ℝ)) q := by
          rw [hfqsat]
          constructor
          · -- Prove `ContDiff ℝ 1 (fun x : ℝ => x + n)`
            apply ContDiff.add
            · exact contDiff_id
            · exact contDiff_const
          · -- Prove `∃ (p : ℚ), p = (q : ℝ) + n ∧ p.den = q.den`
            have h5 : ∃ (p : ℚ), (p : ℝ) = (q : ℝ) + n ∧ p.den = q.den := by
              -- Prove that `(q : ℝ) + n` is a rational number with the same denominator as `q`.
              have h6 : ∃ (p : ℚ), (p : ℝ) = (q : ℝ) + n := by
                -- Use the fact that `n` is an integer to find `p`.
                use ↑q + n
                <;> simp [Rat.cast_add, Rat.cast_intCast]
                <;> ring_nf
                <;> norm_cast
                <;> simp [Complex.ext_iff, pow_two]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              -- Prove that the denominator of `p` is the same as that of `q`.
              rcases h6 with ⟨p, hp⟩
              use p
              <;> aesop
            rcases h5 with ⟨p, hp1, hp2⟩
            aesop
        aesop
      | inr h3 =>
        -- Case 2: `f(x) = -x + n` for some integer `n`.
        rcases h3 with ⟨n, rfl⟩
        intro q
        have h4 : fqsat (fun x : ℝ => -x + (n : ℝ)) q := by
          rw [hfqsat]
          constructor
          · -- Prove `ContDiff ℝ 1 (fun x : ℝ => -x + n)`
            apply ContDiff.add
            · apply ContDiff.neg
              exact contDiff_id
            · exact contDiff_const
          · -- Prove `∃ (p : ℚ), p = -(q : ℝ) + n ∧ p.den = q.den`
            have h5 : ∃ (p : ℚ), (p : ℝ) = -(q : ℝ) + n ∧ p.den = q.den := by
              -- Prove that `-(q : ℝ) + n` is a rational number with the same denominator as `q`.
              have h6 : ∃ (p : ℚ), (p : ℝ) = -(q : ℝ) + n := by
                -- Use the fact that `n` is an integer to find `p`.
                use -q + n
                <;> simp [Rat.cast_add, Rat.cast_neg, Rat.cast_intCast]
                <;> ring_nf
                <;> norm_cast
                <;> simp [Complex.ext_iff, pow_two]
                <;> ring_nf
                <;> norm_num
                <;> linarith
              -- Prove that the denominator of `p` is the same as that of `q`.
              rcases h6 with ⟨p, hp⟩
              use p
              <;> aesop
            rcases h5 with ⟨p, hp1, hp2⟩
            aesop
        aesop
    exact ⟨h1, h2⟩
  exact h_main