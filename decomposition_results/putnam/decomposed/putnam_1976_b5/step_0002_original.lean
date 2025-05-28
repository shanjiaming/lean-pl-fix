theorem h_main (n : ℕ) : ∑ k ∈ Finset.range (n + 1), C ((-1) ^ k * ↑(n.choose k)) * (X - C ↑k) ^ n = C ↑n.factorial :=
  by
  have h1 :
    ∑ k in Finset.range (n + 1), C ((-(1 : ℤ)) ^ k * (Nat.choose n k : ℤ)) * (X - C (k : ℤ)) ^ n =
      ∑ k in Finset.range (n + 1),
        C ((-1 : ℤ) ^ k * (Nat.choose n k : ℤ)) *
          (∑ i in Finset.range (n + 1), C ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)) * X ^ i) := by sorry
  rw [h1]
  have h2 :
    ∑ k in Finset.range (n + 1),
        C ((-1 : ℤ) ^ k * (Nat.choose n k : ℤ)) *
          (∑ i in Finset.range (n + 1), C ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)) * X ^ i) =
      ∑ i in Finset.range (n + 1),
        (∑ k in Finset.range (n + 1),
            ((-1 : ℤ) ^ k * (Nat.choose n k : ℤ) * ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)))) •
          X ^ i := by sorry
  rw [h2]
  have h3 :
    ∀ i ∈ Finset.range (n + 1),
      (∑ k in Finset.range (n + 1),
            ((-1 : ℤ) ^ k * (Nat.choose n k : ℤ) * ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)))) •
          X ^ i =
        (if i = n then C (Nat.factorial n : ℤ) else 0) := by sorry
  have h7 :
    ∑ i in Finset.range (n + 1),
        (∑ k in Finset.range (n + 1),
            ((-1 : ℤ) ^ k * (Nat.choose n k : ℤ) * ((Nat.choose n i : ℤ) * (-(k : ℤ)) ^ (n - i)))) •
          X ^ i =
      ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) :=
    by
    apply Finset.sum_congr rfl
    intro i hi
    rw [h3 i hi] <;> simp_all [Finset.mem_range_succ_iff] <;> aesop
  rw [h7]
  have h8 : ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) = C (Nat.factorial n : ℤ) :=
    by
    have h9 : ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) = C (Nat.factorial n : ℤ) :=
      by
      have h10 :
        ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) = C (Nat.factorial n : ℤ) :=
        by
        have h11 :
          ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) = C (Nat.factorial n : ℤ) :=
          by
          have h12 :
            ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) = C (Nat.factorial n : ℤ) :=
            by
            have h13 : n < n + 1 := by omega
            have h14 :
              ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) = C (Nat.factorial n : ℤ) :=
              by
              calc
                _ = ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) := by rfl
                _ = C (Nat.factorial n : ℤ) := by
                  calc
                    _ = ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) := by rfl
                    _ = (if n = n then C (Nat.factorial n : ℤ) else 0) :=
                      by
                      have h15 : n < n + 1 := by omega
                      have h16 : n ∈ Finset.range (n + 1) := by simp [Finset.mem_range] <;> omega
                      have h17 :
                        ∑ i in Finset.range (n + 1), (if i = n then C (Nat.factorial n : ℤ) else 0) =
                          (if n = n then C (Nat.factorial n : ℤ) else 0) :=
                        by simp_all [Finset.sum_ite_eq', Finset.mem_range] <;> aesop
                      exact h17
                    _ = C (Nat.factorial n : ℤ) := by simp
            exact h14
          exact h12
        exact h11
      exact h10
    exact h9
  rw [h8] <;> simp_all