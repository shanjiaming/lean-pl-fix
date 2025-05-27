theorem smallest_positive_integer :
  (∃ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n) ∧
  (∀ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n → n ≥ 8) ∧
  (congruence1 8 ∧ congruence2 8 ∧ congruence3 8) := by
  have h_main_claim : congruence1 8 ∧ congruence2 8 ∧ congruence3 8 := by
    constructor
    · -- Prove congruence1 8
      norm_num [congruence1, congruence2, congruence3]
    · constructor
      · -- Prove congruence2 8
        norm_num [congruence1, congruence2, congruence3]
      · -- Prove congruence3 8
        norm_num [congruence1, congruence2, congruence3]
  
  have h_minimality : ∀ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n → n ≥ 8 := by
    intro n hn
    have h₁ : (n : ℕ) ≥ 8 := by
      by_contra h
      -- Assume n < 8 and derive a contradiction
      have h₂ : (n : ℕ) ≤ 7 := by omega
      have h₃ : congruence1 n := hn.1
      have h₄ : congruence2 n := hn.2.1
      have h₅ : congruence3 n := hn.2.2
      have h₆ : n ≤ 7 := by exact_mod_cast h₂
      -- Check each possible value of n from 1 to 7
      have h₇ : n ≥ 1 := by exact n.prop
      interval_cases n <;> norm_num [congruence1, congruence2, congruence3] at h₃ h₄ h₅ ⊢ <;> try contradiction
    exact_mod_cast h₁
  
  have h_existence : ∃ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n := by
    use ⟨8, by decide⟩
    <;> simp_all [congruence1, congruence2, congruence3]
    <;> norm_num
    <;> aesop
  
  have h_final : (∃ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n) ∧ (∀ n : ℕ+, congruence1 n ∧ congruence2 n ∧ congruence3 n → n ≥ 8) ∧ (congruence1 8 ∧ congruence2 8 ∧ congruence3 8) := by
    refine ⟨h_existence, h_minimality, h_main_claim⟩
  
  exact h_final