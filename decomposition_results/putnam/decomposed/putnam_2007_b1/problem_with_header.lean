import Mathlib

open Set Nat

/--
Let $f$ be a nonconstant polynomial with positive integer coefficients. Prove that if $n$ is a positive integer, then $f(n)$ divides $f(f(n) + 1)$ if and only if $n = 1$
-/
theorem putnam_2007_b1
(f : Polynomial ℤ)
(hf : ∀ n : ℕ, f.coeff n ≥ 0)
(hfnconst : ∃ n : ℕ, n > 0 ∧ f.coeff n > 0)
(n : ℤ)
(hn : n > 0)
: f.eval n ∣ f.eval (f.eval n + 1) ↔ n = 1 := by
  have h1 : Polynomial.eval 1 f > 0 := by
    obtain ⟨m, hm, hm'⟩ := hfnconst
    have h2 : (∑ i in f.support, (f.coeff i : ℤ)) ≥ (f.coeff m : ℤ) := by
      have h3 : (f.coeff m : ℤ) ≤ (∑ i in f.support, (f.coeff i : ℤ)) := by
        have h4 : (f.coeff m : ℤ) ≤ (∑ i in f.support, (f.coeff i : ℤ)) := by
          have h5 : (m : ℕ) ∈ f.support := by
            by_contra h6
            rw [Polynomial.mem_support_iff] at h6
            norm_cast at h6
            <;> simp_all [h6]
            <;> norm_num at hm' ⊢
            <;> linarith
          -- We need to show that the coeff m is less than or equal to the sum of all coeffs.
          have h7 : (f.coeff m : ℤ) ≤ (∑ i in f.support, (f.coeff i : ℤ)) := by
            have h8 : (f.coeff m : ℤ) ≤ (∑ i in f.support, (f.coeff i : ℤ)) := by
              apply Finset.single_le_sum (fun i _ => by exact_mod_cast (hf i)) h5
            exact h8
          exact h7
        exact h4
      exact h3
    have h9 : (∑ i in f.support, (f.coeff i : ℤ)) ≥ (f.coeff m : ℤ) := h2
    have h10 : Polynomial.eval 1 f = (∑ i in f.support, (f.coeff i : ℤ)) := by
      simp [Polynomial.eval_eq_sum, Polynomial.eq_sum_range_succ f]
      <;>
      simp_all [Finset.sum_range_succ, Polynomial.coeff_add, Polynomial.coeff_monomial]
      <;>
      ring
      <;>
      norm_num
      <;>
      simp_all [Polynomial.coeff_monomial]
      <;>
      linarith
    have h11 : (f.coeff m : ℤ) > 0 := by
      exact_mod_cast hm'
    have h12 : Polynomial.eval 1 f ≥ (f.coeff m : ℤ) := by
      linarith
    have h13 : Polynomial.eval 1 f > 0 := by linarith
    exact_mod_cast h13
    <;>
    simp_all [Polynomial.eval_eq_sum]
    <;>
    linarith
  
  have h2 : n ≥ 1 := by
    omega
  
  have h3 : n ≠ 1 → Polynomial.eval n f > Polynomial.eval 1 f := by
    intro hn1
    have h4 : n ≥ 2 := by
      by_contra h
      have h5 : n ≤ 1 := by linarith
      have h6 : n = 1 := by omega
      contradiction
    have h5 : (n : ℤ) ≥ 2 := by exact_mod_cast h4
    -- Use the fact that the polynomial has positive coefficients and at least one positive coefficient for a degree greater than 0
    have h6 : Polynomial.eval n f > Polynomial.eval 1 f := by
      -- Use the fact that the polynomial has positive coefficients and at least one positive coefficient for a degree greater than 0
      have h7 : ∃ (m : ℕ), m > 0 ∧ (f.coeff m : ℤ) > 0 := by
        obtain ⟨m, hm1, hm2⟩ := hfnconst
        refine' ⟨m, hm1, _⟩
        exact_mod_cast hm2
      obtain ⟨m, hm1, hm2⟩ := h7
      have h8 : (m : ℕ) > 0 := hm1
      -- Use the fact that the polynomial has positive coefficients and at least one positive coefficient for a degree greater than 0
      have h9 : (Polynomial.eval n f : ℤ) > (Polynomial.eval 1 f : ℤ) := by
        -- Use the fact that the polynomial has positive coefficients and at least one positive coefficient for a degree greater than 0
        have h10 : (Polynomial.eval n f : ℤ) = Polynomial.eval n f := by simp
        have h11 : (Polynomial.eval 1 f : ℤ) = Polynomial.eval 1 f := by simp
        have h12 : (Polynomial.eval n f : ℤ) - (Polynomial.eval 1 f : ℤ) > 0 := by
          -- Use the fact that the polynomial has positive coefficients and at least one positive coefficient for a degree greater than 0
          have h13 : (Polynomial.eval n f : ℤ) - (Polynomial.eval 1 f : ℤ) = Polynomial.eval n f - Polynomial.eval 1 f := by ring
          rw [h13]
          have h14 : Polynomial.eval n f - Polynomial.eval 1 f > 0 := by
            -- Use the fact that the polynomial has positive coefficients and at least one positive coefficient for a degree greater than 0
            have h15 : 0 < (n : ℤ) := by linarith
            have h16 : ∀ (k : ℕ), (f.coeff k : ℤ) ≥ 0 := by
              intro k
              exact_mod_cast (hf k)
            have h17 : (Polynomial.eval n f : ℤ) - (Polynomial.eval 1 f : ℤ) = ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) := by
              calc
                (Polynomial.eval n f : ℤ) - (Polynomial.eval 1 f : ℤ) = ∑ k in f.support, (f.coeff k : ℤ) * (n : ℤ) ^ k - ∑ k in f.support, (f.coeff k : ℤ) * (1 : ℤ) ^ k := by
                  simp [Polynomial.eval_eq_sum, Finset.sum_sub_distrib]
                _ = ∑ k in f.support, ((f.coeff k : ℤ) * (n : ℤ) ^ k - (f.coeff k : ℤ) * (1 : ℤ) ^ k) := by
                  simp [Finset.sum_sub_distrib]
                _ = ∑ k in f.support, (f.coeff k : ℤ) * ((n : ℤ) ^ k - (1 : ℤ) ^ k) := by
                  apply Finset.sum_congr rfl
                  intro k _
                  ring
                _ = ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) := by
                  apply Finset.sum_congr rfl
                  intro k _
                  have h18 : (1 : ℤ) ^ k = 1 := by simp
                  simp [h18]
                  <;> ring
            rw [h17]
            have h18 : ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) > 0 := by
              have h19 : (m : ℕ) ∈ f.support := by
                by_contra h20
                have h21 : f.coeff m = 0 := by
                  rw [Polynomial.mem_support_iff] at h20
                  contrapose! h20
                  simp_all
                  <;> aesop
                have h22 : (f.coeff m : ℤ) = 0 := by
                  simp_all
                linarith
              have h20 : (f.coeff m : ℤ) * (n ^ m - 1 : ℤ) > 0 := by
                have h21 : (f.coeff m : ℤ) > 0 := by
                  exact hm2
                have h22 : (n : ℤ) ^ m - 1 ≥ 1 := by
                  have h23 : (n : ℤ) ≥ 2 := by exact_mod_cast h5
                  have h24 : (n : ℤ) ^ m ≥ (n : ℤ) ^ 1 := by
                    exact pow_le_pow_right (by linarith) (by omega)
                  have h25 : (n : ℤ) ^ 1 = (n : ℤ) := by simp
                  have h26 : (n : ℤ) ^ m ≥ (n : ℤ) := by
                    linarith
                  have h27 : (n : ℤ) ^ m - 1 ≥ (n : ℤ) - 1 := by
                    omega
                  have h28 : (n : ℤ) - 1 ≥ 1 := by
                    omega
                  omega
                nlinarith
              have h21 : ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) > 0 := by
                have h22 : ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) ≥ (f.coeff m : ℤ) * (n ^ m - 1 : ℤ) := by
                  apply Finset.single_le_sum (fun i _ => by
                    have h23 : (f.coeff i : ℤ) ≥ 0 := by
                      exact_mod_cast (hf i)
                    have h24 : (n : ℤ) ^ i - 1 ≥ 0 := by
                      have h25 : (n : ℤ) ^ i ≥ 1 := by
                        have h26 : (n : ℤ) ≥ 1 := by linarith
                        have h27 : (i : ℕ) ≥ 0 := by omega
                        have h28 : (n : ℤ) ^ i ≥ 1 := by
                          exact one_le_pow_of_one_le h26 _
                        linarith
                      omega
                    nlinarith) h19
                linarith
              exact h21
            linarith
          linarith
        linarith
      exact_mod_cast h9
    exact h6
    <;> omega
  
  have h4 : n = 1 → Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := by
    intro hn1
    rw [hn1]
    have h5 : Polynomial.eval 1 f ∣ Polynomial.eval (Polynomial.eval 1 f + 1) f := by
      have h6 : Polynomial.eval (Polynomial.eval 1 f + 1) f = Polynomial.eval (1 + Polynomial.eval 1 f) f := by ring
      rw [h6]
      have h7 : Polynomial.eval (1 + Polynomial.eval 1 f) f = Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X)) := by
        have h8 : Polynomial.eval (1 + Polynomial.eval 1 f) f = Polynomial.eval (1 + Polynomial.eval 1 f) f := rfl
        rw [h8]
        have h9 : Polynomial.eval (1 + Polynomial.eval 1 f) f = Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X)) := by
          -- Use the Taylor expansion of f at 1 to find the required expression
          have h10 := Polynomial.eval₂_eq_eval_map
          have h11 := Polynomial.eval₂_eq_eval_map
          have h12 : Polynomial.eval (1 + Polynomial.eval 1 f) f = Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X)) := by
            -- Use the Taylor expansion of f at 1 to find the required expression
            have h13 := Polynomial.eval₂_eq_eval_map
            have h14 := Polynomial.eval₂_eq_eval_map
            -- Use the Taylor expansion of f at 1 to find the required expression
            have h15 : (Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X))) = Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X)) := by rfl
            -- Use the Taylor expansion of f at 1 to find the required expression
            have h16 : Polynomial.eval (1 + Polynomial.eval 1 f) f = Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X)) := by
              -- Use the Taylor expansion of f at 1 to find the required expression
              have h17 : f.eval (1 + f.eval 1) = f.eval 1 + f.eval 1 * (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 f.derivative)) Polynomial.X).eval (f.eval 1) := by
                have h18 := Polynomial.taylor_eval (R := ℤ) f 1 (f.eval 1)
                have h19 := Polynomial.taylor_eval (R := ℤ) f 1 (f.eval 1)
                have h20 := Polynomial.taylor_eval (R := ℤ) f 1 (f.eval 1)
                ring_nf at h18 h19 h20 ⊢
                <;> simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]
                <;> ring_nf at *
                <;> norm_num at *
                <;> linarith
              simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]
              <;> ring_nf at *
              <;> norm_num at *
              <;> linarith
            simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]
            <;> ring_nf at *
            <;> norm_num at *
            <;> linarith
          simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]
          <;> ring_nf at *
          <;> norm_num at *
          <;> linarith
        simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]
        <;> ring_nf at *
        <;> norm_num at *
        <;> linarith
      rw [h7]
      -- Prove that Polynomial.eval 1 f divides the expression by simplifying it
      have h10 : Polynomial.eval 1 f ∣ Polynomial.eval 1 f + Polynomial.eval 1 f * Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X)) := by
        -- Use the fact that Polynomial.eval 1 f divides Polynomial.eval 1 f
        refine' ⟨(1 + Polynomial.eval (Polynomial.eval 1 f) (Polynomial.comp (Polynomial.X * Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) (Polynomial.X))), _⟩
        <;> ring
      -- Conclude the proof
      simpa using h10
    simpa using h5
  
  have h5 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f → n = 1 := by
    intro h_div
    by_contra h_ne
    have h6 : n ≠ 1 := h_ne
    have h7 : Polynomial.eval n f > Polynomial.eval 1 f := h3 h_ne
    have h8 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := h_div
    have h9 : Polynomial.eval n f ∣ Polynomial.eval 1 f := by
      have h10 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f := by
        have h11 : Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f = Polynomial.eval n f * Polynomial.eval (Polynomial.eval n f) (Polynomial.comp (Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) Polynomial.X) := by
          have h12 := Polynomial.taylor_eval (R := ℤ) f 1 (Polynomial.eval n f)
          have h13 := Polynomial.taylor_eval (R := ℤ) f 1 0
          have h14 := Polynomial.taylor_eval (R := ℤ) f 1 1
          simp [Polynomial.taylor_coeff_one] at h12 h13 h14
          <;> ring_nf at h12 h13 h14 ⊢ <;>
          (try omega) <;>
          (try ring_nf at h12 h13 h14 ⊢ <;> omega) <;>
          (try simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]) <;>
          (try ring_nf at h12 h13 h14 ⊢ <;>
            simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp] <;>
            omega)
          <;>
          (try ring_nf at h12 h13 h14 ⊢ <;>
            simp_all [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp])
          <;>
          omega
        rw [h11]
        use Polynomial.eval (Polynomial.eval n f) (Polynomial.comp (Polynomial.C (Polynomial.eval 1 (Polynomial.derivative f))) Polynomial.X)
        <;> ring_nf
        <;> simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_comp]
        <;> ring_nf at *
        <;> omega
      have h11 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f := h10
      have h12 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := h8
      have h13 : Polynomial.eval n f ∣ Polynomial.eval 1 f := by
        -- Use the fact that if a number divides two numbers, it divides their difference.
        have h14 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f := h11
        have h15 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := h12
        -- Use the fact that if a number divides two numbers, it divides their difference.
        have h16 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f := h14
        have h17 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := h15
        -- Use the fact that if a number divides two numbers, it divides their difference.
        have h18 : Polynomial.eval n f ∣ Polynomial.eval 1 f := by
          -- Use the fact that if a number divides two numbers, it divides their difference.
          have h19 : Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f = Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f := rfl
          have h20 : Polynomial.eval (Polynomial.eval n f + 1) f = Polynomial.eval (Polynomial.eval n f + 1) f := rfl
          -- Use the fact that if a number divides two numbers, it divides their difference.
          have h21 : Polynomial.eval n f ∣ Polynomial.eval 1 f := by
            -- Use the fact that if a number divides two numbers, it divides their difference.
            have h22 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f := h16
            have h23 : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := h17
            have h24 : Polynomial.eval n f ∣ Polynomial.eval 1 f := by
              -- Use the fact that if a number divides two numbers, it divides their difference.
              have h25 : Polynomial.eval 1 f = Polynomial.eval (Polynomial.eval n f + 1) f - (Polynomial.eval (Polynomial.eval n f + 1) f - Polynomial.eval 1 f) := by
                ring
              rw [h25]
              -- Use the fact that if a number divides two numbers, it divides their difference.
              exact dvd_sub h23 h22
            exact h24
          exact h21
        exact h18
      exact h13
    have h10 : (Polynomial.eval n f : ℤ) ∣ (Polynomial.eval 1 f : ℤ) := by
      exact_mod_cast h9
    have h11 : (Polynomial.eval n f : ℤ) ≤ (Polynomial.eval 1 f : ℤ) := by
      exact Int.le_of_dvd (by linarith) h10
    have h12 : (Polynomial.eval n f : ℤ) > (Polynomial.eval 1 f : ℤ) := by
      have h13 : (Polynomial.eval n f : ℤ) > (Polynomial.eval 1 f : ℤ) := by
        exact_mod_cast h7
      exact h13
    linarith
  
  have h6 : f.eval n ∣ f.eval (f.eval n + 1) ↔ n = 1 := by
    constructor
    · intro h
      have h₁ : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := by simpa using h
      have h₂ : n = 1 := h5 h₁
      exact h₂
    · intro h
      have h₁ : n = 1 := h
      have h₂ : Polynomial.eval n f ∣ Polynomial.eval (Polynomial.eval n f + 1) f := h4 h₁
      simpa using h₂
  
  exact h6