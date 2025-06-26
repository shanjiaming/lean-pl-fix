import Mathlib

open Filter Topology Real

/--
The number $d_{1}d_{2}\dots d_{9}$ has nine (not necessarily distinct) decimal digits. The number $e_{1}e_{2}\dots e_{9}$ is such that each of the nine 9-digit numbers formed by replacing just one of the digits $d_{i}$ is $d_{1}d_{2}\dots d_{9}$ by the corresponding digit $e_{i}$ ($1 \leq i \leq 9$) is divisible by 7. The number $f_{1}f_{2}\dots f_{9}$ is related to $e_{1}e_{2}\dots e_{9}$ is the same way: that is, each of the nine numbers formed by replacing one of the $e_{i}$ by the corresponding $f_{i}$ is divisible by 7. Show that, for each $i$, $d_{i}-f_{i}$ is divisible by 7. [For example, if $d_{1}d_{2}\dots d_{9} = 199501996$, then $e_{6}$ may be 2 or 9, since $199502996$ and $199509996$ are multiples of 7.]
-/
theorem putnam_1995_a3
(relation : (Fin 9 → ℤ) → (Fin 9 → ℤ) → Prop)
(digits_to_num : (Fin 9 → ℤ) → ℤ)
(hdigits_to_num : digits_to_num = fun dig => ∑ i : Fin 9, (dig i) * 10^i.1)
(hrelation : ∀ d e : (Fin 9 → ℤ), relation d e ↔ (∀ i : Fin 9, d i < 10 ∧ d i ≥ 0 ∧ e i < 10 ∧ e i ≥ 0) ∧ (∀ i : Fin 9, 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then e j else d j))))
: ∀ d e f : (Fin 9 → ℤ), ((relation d e) ∧ (relation e f)) → (∀ i : Fin 9, 7 ∣ d i - f i) := by
  have h_main : ∀ d e f : (Fin 9 → ℤ), ((relation d e) ∧ (relation e f)) → (∀ i : Fin 9, 7 ∣ d i - f i) := by
    intro d e f h
    have h₁ : relation d e := h.1
    have h₂ : relation e f := h.2
    have h₃ : (∀ i : Fin 9, d i < 10 ∧ d i ≥ 0 ∧ e i < 10 ∧ e i ≥ 0) ∧ (∀ i : Fin 9, 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then e j else d j))) := by
      rw [hrelation] at h₁
      exact h₁
    have h₄ : (∀ i : Fin 9, e i < 10 ∧ e i ≥ 0 ∧ f i < 10 ∧ f i ≥ 0) ∧ (∀ i : Fin 9, 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then f j else e j))) := by
      rw [hrelation] at h₂
      exact h₂
    have h₅ : ∀ (i : Fin 9), 7 ∣ d i - f i := by
      intro i
      have h₅₁ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then e j else d j)) := h₃.2 i
      have h₅₂ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then f j else e j)) := h₄.2 i
      have h₅₃ : digits_to_num (fun j : Fin 9 => if j = i then e j else d j) = (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := by
        rw [hdigits_to_num]
        rw [hdigits_to_num]
        calc
          (∑ k : Fin 9, (if k = i then e k else d k : ℤ) * 10 ^ (k : ℕ)) = ∑ k : Fin 9, (if k = i then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := by
            apply Finset.sum_congr rfl
            intro k _
            split_ifs <;> simp [*, mul_comm]
            <;> ring_nf at * <;> aesop
          _ = (e i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ) := by
            have h₅₃₁ : ∑ k : Fin 9, (if k = i then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) = (e i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ) := by
              calc
                _ = ∑ k : Fin 9, (if k = i then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := rfl
                _ = (if i = i then e i * 10 ^ (i : ℕ) else d i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, (if k = i then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := by
                  rw [← Finset.add_sum_erase _ _ (Finset.mem_univ i)]
                  <;> simp [Finset.sum_ite_eq']
                  <;> aesop
                _ = (e i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, (if k = i then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := by
                  simp
                _ = (e i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ) := by
                  apply congrArg (fun x => (e i * 10 ^ (i : ℕ)) + x)
                  apply Finset.sum_congr rfl
                  intro k hk
                  have h₅₃₂ : k ≠ i := by
                    intro h
                    simp_all [Finset.mem_erase]
                  simp [h₅₃₂]
            rw [h₅₃₁]
          _ = (e i - d i) * 10 ^ (i : ℕ) + ∑ k : Fin 9, d k * 10 ^ (k : ℕ) := by
            have h₅₃₃ : (∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) - d i * 10 ^ (i : ℕ) := by
              calc
                (∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ)) = ∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ) := rfl
                _ = (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) - d i * 10 ^ (i : ℕ) := by
                  have h₅₃₄ : (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) = d i * 10 ^ (i : ℕ) + ∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ) := by
                    rw [← Finset.add_sum_erase _ _ (Finset.mem_univ i)]
                    <;> simp [Finset.sum_ite_eq']
                    <;> aesop
                  have h₅₃₅ : (∑ k in Finset.univ.erase i, d k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) - d i * 10 ^ (i : ℕ) := by
                    linarith
                  rw [h₅₃₅]
                  <;> ring
            rw [h₅₃₃]
            <;> ring
            <;> simp_all [Finset.sum_range_succ, add_assoc]
            <;> ring_nf at *
            <;> omega
          _ = (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := by
            rw [hdigits_to_num]
            <;> simp [Finset.sum_range_succ, add_assoc]
            <;> ring_nf at *
            <;> omega
      have h₅₄ : digits_to_num (fun j : Fin 9 => if j = i then f j else e j) = (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := by
        rw [hdigits_to_num]
        rw [hdigits_to_num]
        calc
          (∑ k : Fin 9, (if k = i then f k else e k : ℤ) * 10 ^ (k : ℕ)) = ∑ k : Fin 9, (if k = i then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := by
            apply Finset.sum_congr rfl
            intro k _
            split_ifs <;> simp [*, mul_comm]
            <;> ring_nf at * <;> aesop
          _ = (f i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ) := by
            have h₅₄₁ : ∑ k : Fin 9, (if k = i then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) = (f i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ) := by
              calc
                _ = ∑ k : Fin 9, (if k = i then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := rfl
                _ = (if i = i then f i * 10 ^ (i : ℕ) else e i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, (if k = i then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := by
                  rw [← Finset.add_sum_erase _ _ (Finset.mem_univ i)]
                  <;> simp [Finset.sum_ite_eq']
                  <;> aesop
                _ = (f i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, (if k = i then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := by
                  simp
                _ = (f i * 10 ^ (i : ℕ)) + ∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ) := by
                  apply congrArg (fun x => (f i * 10 ^ (i : ℕ)) + x)
                  apply Finset.sum_congr rfl
                  intro k hk
                  have h₅₄₂ : k ≠ i := by
                    intro h
                    simp_all [Finset.mem_erase]
                  simp [h₅₄₂]
            rw [h₅₄₁]
          _ = (f i - e i) * 10 ^ (i : ℕ) + ∑ k : Fin 9, e k * 10 ^ (k : ℕ) := by
            have h₅₄₃ : (∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) - e i * 10 ^ (i : ℕ) := by
              calc
                (∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ)) = ∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ) := rfl
                _ = (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) - e i * 10 ^ (i : ℕ) := by
                  have h₅₄₄ : (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) = e i * 10 ^ (i : ℕ) + ∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ) := by
                    rw [← Finset.add_sum_erase _ _ (Finset.mem_univ i)]
                    <;> simp [Finset.sum_ite_eq']
                    <;> aesop
                  have h₅₄₅ : (∑ k in Finset.univ.erase i, e k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) - e i * 10 ^ (i : ℕ) := by
                    linarith
                  rw [h₅₄₅]
                  <;> ring
            rw [h₅₄₃]
            <;> ring
            <;> simp_all [Finset.sum_range_succ, add_assoc]
            <;> ring_nf at *
            <;> omega
          _ = (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := by
            rw [hdigits_to_num]
            <;> simp [Finset.sum_range_succ, add_assoc]
            <;> ring_nf at *
            <;> omega
      have h₅₅ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := by
        have h₅₅₁ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then e j else d j)) := h₃.2 i
        have h₅₅₂ : digits_to_num (fun j : Fin 9 => if j = i then e j else d j) = (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := h₅₃
        rw [h₅₅₂] at h₅₅₁
        have h₅₅₃ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := h₅₅₁
        have h₅₅₄ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := by
          -- Use the fact that 7 divides the sum to show it divides the individual term
          have h₅₅₅ : ∀ (i : Fin 9), 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then e j else d j)) := h₃.2
          have h₅₅₆ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then e j else d j)) := h₅₅₅ i
          have h₅₅₇ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := h₅₅₃
          have h₅₅₈ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := by
            -- Since 7 divides the sum and one term, it must divide the other
            have h₅₅₉ : 7 ∣ (digits_to_num d) := by
              have h₅₅₁₀ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = (⟨0, by decide⟩ : Fin 9) then e j else d j)) := h₃.2 (⟨0, by decide⟩)
              have h₅₅₁₁ : digits_to_num (fun j : Fin 9 => if j = (⟨0, by decide⟩ : Fin 9) then e j else d j) = (e ⟨0, by decide⟩ - d ⟨0, by decide⟩) * 10 ^ (⟨0, by decide⟩ : ℕ) + digits_to_num d := by
                rw [hdigits_to_num]
                rw [hdigits_to_num]
                calc
                  (∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then e k else d k : ℤ) * 10 ^ (k : ℕ)) = ∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := by
                    apply Finset.sum_congr rfl
                    intro k _
                    split_ifs <;> simp [*, mul_comm]
                    <;> ring_nf at * <;> aesop
                  _ = (e ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ) := by
                    have h₅₅₁₂ : ∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) = (e ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ) := by
                      calc
                        _ = ∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := rfl
                        _ = (if (⟨0, by decide⟩ : Fin 9) = (⟨0, by decide⟩ : Fin 9) then e ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) else d ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), (if k = (⟨0, by decide⟩ : Fin 9) then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := by
                          rw [← Finset.add_sum_erase _ _ (Finset.mem_univ (⟨0, by decide⟩ : Fin 9))]
                          <;> simp [Finset.sum_ite_eq']
                          <;> aesop
                        _ = (e ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), (if k = (⟨0, by decide⟩ : Fin 9) then e k * 10 ^ (k : ℕ) else d k * 10 ^ (k : ℕ)) := by simp
                        _ = (e ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ) := by
                          apply congrArg (fun x => (e ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ)) + x)
                          apply Finset.sum_congr rfl
                          intro k hk
                          have h₅₅₁₃ : k ≠ (⟨0, by decide⟩ : Fin 9) := by
                            intro h
                            simp_all [Finset.mem_erase]
                          simp [h₅₅₁₃]
                    rw [h₅₅₁₂]
                  _ = (e ⟨0, by decide⟩ - d ⟨0, by decide⟩) * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) + ∑ k : Fin 9, d k * 10 ^ (k : ℕ) := by
                    have h₅₅₁₂ : (∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) - d ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) := by
                      calc
                        (∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ)) = ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ) := rfl
                        _ = (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) - d ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) := by
                          have h₅₅₁₃ : (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) = d ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ) := by
                            rw [← Finset.add_sum_erase _ _ (Finset.mem_univ (⟨0, by decide⟩ : Fin 9))]
                            <;> simp [Finset.sum_ite_eq']
                            <;> aesop
                          have h₅₅₁₄ : (∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), d k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, d k * 10 ^ (k : ℕ)) - d ⟨0, by decide⟩ * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) := by
                            linarith
                          rw [h₅₅₁₄]
                          <;> ring
                    rw [h₅₅₁₂]
                    <;> ring
                  _ = (e ⟨0, by decide⟩ - d ⟨0, by decide⟩) * 10 ^ ((⟨0, by decide⟩ : Fin 9) : ℕ) + digits_to_num d := by
                    rw [hdigits_to_num]
                    <;> simp [Finset.sum_range_succ, add_assoc]
                    <;> ring_nf at *
                    <;> omega
              exact h₅₅₁₁
              <;> simp_all
            have h₅₅₁₀ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := h₅₅₇
            have h₅₅₁₁ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := by
              -- Use the fact that 7 divides the sum and one term to show it divides the other
              have h₅₅₁₂ : 7 ∣ (digits_to_num d) := h₅₅₉
              have h₅₅₁₃ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := h₅₅₁₀
              have h₅₅₁₄ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := by
                -- Since 7 divides the sum and one term, it must divide the other
                have h₅₅₁₅ : (e i - d i) * 10 ^ (i : ℕ) = (e i - d i) * 10 ^ (i : ℕ) := rfl
                rw [h₅₅₁₅] at *
                -- Use the fact that 7 divides the sum and one term to show it divides the other
                have h₅₅₁₆ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) + digits_to_num d := h₅₅₁₃
                have h₅₅₁₇ : 7 ∣ digits_to_num d := h₅₅₉
                -- Use the fact that 7 divides the sum and one term to show it divides the other
                have h₅₅₁₈ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := by
                  -- Use the fact that 7 divides the sum and one term to show it divides the other
                  omega
                exact h₅₅₁₈
              exact h₅₅₁₄
            exact h₅₅₁₁
          exact h₅₅₈
        exact h₅₅₄
      have h₅₆ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := by
        have h₅₆₁ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then f j else e j)) := h₄.2 i
        have h₅₆₂ : digits_to_num (fun j : Fin 9 => if j = i then f j else e j) = (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := h₅₄
        rw [h₅₆₂] at h₅₆₁
        have h₅₆₃ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := h₅₆₁
        have h₅₆₄ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := by
          have h₅₆₅ : ∀ (i : Fin 9), 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then f j else e j)) := h₄.2
          have h₅₆₆ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = i then f j else e j)) := h₅₆₅ i
          have h₅₆₇ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := h₅₆₃
          have h₅₆₈ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := by
            -- Use the fact that 7 divides the sum to show it divides the individual term
            have h₅₆₉ : 7 ∣ (digits_to_num e) := by
              have h₅₆₁₀ : 7 ∣ (digits_to_num (fun j : Fin 9 => if j = (⟨0, by decide⟩ : Fin 9) then f j else e j)) := h₄.2 (⟨0, by decide⟩)
              have h₅₆₁₁ : digits_to_num (fun j : Fin 9 => if j = (⟨0, by decide⟩ : Fin 9) then f j else e j) = (f ⟨0, by decide⟩ - e ⟨0, by decide⟩) * 10 ^ (⟨0, by decide⟩ : ℕ) + digits_to_num e := by
                rw [hdigits_to_num]
                rw [hdigits_to_num]
                calc
                  (∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then f k else e k : ℤ) * 10 ^ (k : ℕ)) = ∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := by
                    apply Finset.sum_congr rfl
                    intro k _
                    split_ifs <;> simp [*, mul_comm]
                    <;> ring_nf at * <;> aesop
                  _ = (f ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ) := by
                    have h₅₆₁₂ : ∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) = (f ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ) := by
                      calc
                        _ = ∑ k : Fin 9, (if k = (⟨0, by decide⟩ : Fin 9) then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := rfl
                        _ = (if (⟨0, by decide⟩ : Fin 9) = (⟨0, by decide⟩ : Fin 9) then f ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ) else e ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), (if k = (⟨0, by decide⟩ : Fin 9) then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := by
                          rw [← Finset.add_sum_erase _ _ (Finset.mem_univ (⟨0, by decide⟩ : Fin 9))]
                          <;> simp [Finset.sum_ite_eq']
                          <;> aesop
                        _ = (f ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), (if k = (⟨0, by decide⟩ : Fin 9) then f k * 10 ^ (k : ℕ) else e k * 10 ^ (k : ℕ)) := by simp
                        _ = (f ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ)) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ) := by
                          apply congrArg (fun x => (f ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ)) + x)
                          apply Finset.sum_congr rfl
                          intro k hk
                          have h₅₆₁₃ : k ≠ (⟨0, by decide⟩ : Fin 9) := by
                            intro h
                            simp_all [Finset.mem_erase]
                          simp [h₅₆₁₃]
                    rw [h₅₆₁₂]
                  _ = (f ⟨0, by decide⟩ - e ⟨0, by decide⟩) * 10 ^ (⟨0, by decide⟩ : ℕ) + ∑ k : Fin 9, e k * 10 ^ (k : ℕ) := by
                    have h₅₆₁₂ : (∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) - e ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ) := by
                      calc
                        (∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ)) = ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ) := rfl
                        _ = (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) - e ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ) := by
                          have h₅₆₁₃ : (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) = e ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ) + ∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ) := by
                            rw [← Finset.add_sum_erase _ _ (Finset.mem_univ (⟨0, by decide⟩ : Fin 9))]
                            <;> simp [Finset.sum_ite_eq']
                            <;> aesop
                          have h₅₆₁₄ : (∑ k in Finset.univ.erase (⟨0, by decide⟩ : Fin 9), e k * 10 ^ (k : ℕ)) = (∑ k : Fin 9, e k * 10 ^ (k : ℕ)) - e ⟨0, by decide⟩ * 10 ^ (⟨0, by decide⟩ : ℕ) := by
                            linarith
                          rw [h₅₆₁₄]
                          <;> ring
                    rw [h₅₆₁₂]
                    <;> ring
                  _ = (f ⟨0, by decide⟩ - e ⟨0, by decide⟩) * 10 ^ (⟨0, by decide⟩ : ℕ) + digits_to_num e := by
                    rw [hdigits_to_num]
                    <;> simp [Finset.sum_range_succ, add_assoc]
                    <;> ring_nf at *
                    <;> omega
              exact h₅₆₁₁
              <;> simp_all
            have h₅₆₁₀ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := h₅₆₃
            have h₅₆₁₁ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := by
              -- Use the fact that 7 divides the sum and one term to show it divides the other
              have h₅₆₁₂ : 7 ∣ (digits_to_num e) := h₅₆₉
              have h₅₆₁₃ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := h₅₆₁₀
              have h₅₆₁₄ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := by
                -- Since 7 divides the sum and one term, it must divide the other
                have h₅₆₁₅ : (f i - e i) * 10 ^ (i : ℕ) = (f i - e i) * 10 ^ (i : ℕ) := rfl
                rw [h₅₆₁₅] at *
                -- Use the fact that 7 divides the sum and one term to show it divides the other
                have h₅₆₁₆ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) + digits_to_num e := h₅₆₁₃
                have h₅₆₁₇ : 7 ∣ digits_to_num e := h₅₆₉
                -- Use the fact that 7 divides the sum and one term to show it divides the other
                have h₅₆₁₈ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := by
                  -- Use the fact that 7 divides the sum and one term to show it divides the other
                  omega
                exact h₅₆₁₈
              exact h₅₆₁₄
            exact h₅₆₁₁
          exact h₅₆₈
        exact h₅₆₄
      have h₅₇ : 7 ∣ e i - d i := by
        have h₅₇₁ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := h₅₅
        have h₅₇₂ : 7 ∣ e i - d i := by
          have h₅₇₃ : (10 : ℤ) ^ (i : ℕ) ≡ 10 ^ (i : ℕ) [ZMOD 7] := by rfl
          have h₅₇₄ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := by
            have h₅₇₅ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := by
              norm_num [Int.emod_eq_of_lt] at *
              <;>
              (try decide) <;>
              (try
                {
                  fin_cases i <;>
                  norm_num [Fin.val_succ, pow_succ, Int.emod_eq_of_lt] <;>
                  omega
                }
              )
            exact h₅₇₅
          have h₅₇₆ : 7 ∣ e i - d i := by
            -- Use the fact that 7 divides (e i - d i) * 10 ^ i and 7 does not divide 10 ^ i to conclude that 7 divides e i - d i
            exact by
              have h₅₇₇ : 7 ∣ (e i - d i) * 10 ^ (i : ℕ) := h₅₅
              have h₅₇₈ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := h₅₇₄
              have h₅₇₉ : (7 : ℤ) ∣ e i - d i := by
                -- Use the fact that 7 divides (e i - d i) * 10 ^ i and 7 does not divide 10 ^ i to conclude that 7 divides e i - d i
                exact by
                  have h₅₈₀ : (7 : ℤ) ∣ (e i - d i) * 10 ^ (i : ℕ) := by simpa using h₅₇₇
                  have h₅₈₁ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := h₅₇₈
                  exact (Int.Prime.dvd_mul (by norm_num)).mp h₅₈₀ |>.resolve_right (by simpa using h₅₈₁)
              exact h₅₇₉
          exact h₅₇₆
        exact h₅₇₂
      have h₅₈ : 7 ∣ f i - e i := by
        have h₅₈₁ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := h₅₆
        have h₅₈₂ : 7 ∣ f i - e i := by
          have h₅₈₃ : (10 : ℤ) ^ (i : ℕ) ≡ 10 ^ (i : ℕ) [ZMOD 7] := by rfl
          have h₅₈₄ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := by
            have h₅₈₅ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := by
              norm_num [Int.emod_eq_of_lt] at *
              <;>
              (try decide) <;>
              (try
                {
                  fin_cases i <;>
                  norm_num [Fin.val_succ, pow_succ, Int.emod_eq_of_lt] <;>
                  omega
                }
              )
            exact h₅₈₅
          have h₅₈₅ : 7 ∣ f i - e i := by
            -- Use the fact that 7 divides (f i - e i) * 10 ^ i and 7 does not divide 10 ^ i to conclude that 7 divides e i - d i
            exact by
              have h₅₈₆ : 7 ∣ (f i - e i) * 10 ^ (i : ℕ) := h₅₈₁
              have h₅₈₇ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := h₅₈₄
              have h₅₈₈ : (7 : ℤ) ∣ f i - e i := by
                -- Use the fact that 7 divides (f i - e i) * 10 ^ i and 7 does not divide 10 ^ i to conclude that 7 divides f i - e i
                exact by
                  have h₅₈₉ : (7 : ℤ) ∣ (f i - e i) * 10 ^ (i : ℕ) := by simpa using h₅₈₆
                  have h₅₉₀ : ¬(7 : ℤ) ∣ 10 ^ (i : ℕ) := h₅₈₇
                  exact (Int.Prime.dvd_mul (by norm_num)).mp h₅₈₉ |>.resolve_right (by simpa using h₅₉₀)
              exact h₅₈₈
          exact h₅₈₅
        exact h₅₈₂
      have h₅₉ : 7 ∣ d i - f i := by
        have h₅₉₁ : d i - f i = -((e i - d i) + (f i - e i)) := by ring
        rw [h₅₉₁]
        -- Use the fact that 7 divides (e i - d i) and (f i - e i) to show that 7 divides -( (e i - d i) + (f i - e i) )
        have h₅₉₂ : 7 ∣ -((e i - d i) + (f i - e i)) := by
          -- Use the fact that 7 divides (e i - d i) and (f i - e i) to show that 7 divides -( (e i - d i) + (f i - e i) )
          have h₅₉₃ : 7 ∣ (e i - d i) + (f i - e i) := by
            -- Use the fact that 7 divides (e i - d i) and (f i - e i) to show that 7 divides (e i - d i) + (f i - e i)
            exact dvd_add h₅₇ h₅₈
          -- Use the fact that 7 divides (e i - d i) + (f i - e i) to show that 7 divides -( (e i - d i) + (f i - e i) )
          exact dvd_neg.mpr h₅₉₃
        -- Use the fact that 7 divides -( (e i - d i) + (f i - e i) ) to show that 7 divides d i - f i
        exact h₅₉₂
      exact h₅₉
    exact h₅
  exact h_main