theorem h₄ (n : ℕ) (hn : n > 1) (a : Fin n → ℝ) (A : ℝ) (hA : A + ∑ i, a i ^ 2 < 1 / ((↑n : ℝ) - 1) * (∑ i, a i) ^ 2) (h_pos_n : (↑n : ℝ) - 1 > 0) (i j : Fin n) (hij : i < j) (h₁ : A + ∑ k, a k ^ 2 < 1 / ((↑n : ℝ) - 1) * (∑ k, a k) ^ 2) (h₃ : (∑ k, a k) ^ 2 = ∑ k, ∑ l, a k * a l) : ∑ k, ∑ l, a k * a l =
    ((∑ k, ∑ l, if (↑k : ℕ) < (↑l : ℕ) then a k * a l else 0) +
        ∑ k, ∑ l, if (↑k : ℕ) = (↑l : ℕ) then a k * a l else 0) +
      ∑ k, ∑ l, if (↑l : ℕ) < (↑k : ℕ) then a k * a l else 0 :=
  by
  calc
    ∑ k : Fin n, ∑ l : Fin n, a k * a l = ∑ k : Fin n, ∑ l : Fin n, (a k * a l) := by simp
    _ =
        ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) < l then a k * a l else 0) + (if (k : ℕ) = l then a k * a l else 0) +
          (if (l : ℕ) < k then a k * a l else 0) :=
      by
      have h₅ :
        ∀ k l : Fin n,
          a k * a l =
            (if (k : ℕ) < l then a k * a l else 0) + (if (k : ℕ) = l then a k * a l else 0) +
              (if (l : ℕ) < k then a k * a l else 0) :=
        by
        intro k l
        have h₆ : (k : ℕ) < l ∨ (k : ℕ) = l ∨ (l : ℕ) < k := by omega
        rcases h₆ with (h₆ | h₆ | h₆)
        · simp [h₆, add_assoc] <;> omega
        · simp [h₆, add_assoc] <;> omega
        · simp [h₆, add_assoc] <;> omega
      calc
        ∑ k : Fin n, ∑ l : Fin n, (a k * a l) =
            ∑ k : Fin n,
              ∑ l : Fin n,
                ((if (k : ℕ) < l then a k * a l else 0) + (if (k : ℕ) = l then a k * a l else 0) +
                  (if (l : ℕ) < k then a k * a l else 0)) :=
          by
          apply Finset.sum_congr rfl
          intro k _
          apply Finset.sum_congr rfl
          intro l _
          rw [h₅ k l]
        _ =
            ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) < l then a k * a l else 0) + (if (k : ℕ) = l then a k * a l else 0) +
              (if (l : ℕ) < k then a k * a l else 0) :=
          by simp [Finset.sum_add_distrib, Finset.sum_add_distrib]
        _ =
            ∑ k : Fin n,
              (∑ l : Fin n, (if (k : ℕ) < l then a k * a l else 0) +
                  ∑ l : Fin n, (if (k : ℕ) = l then a k * a l else 0) +
                ∑ l : Fin n, (if (l : ℕ) < k then a k * a l else 0)) :=
          by simp [Finset.sum_add_distrib, Finset.sum_add_distrib]
        _ =
            ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) < l then a k * a l else 0) +
                ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) = l then a k * a l else 0) +
              ∑ k : Fin n, ∑ l : Fin n, (if (l : ℕ) < k then a k * a l else 0) :=
          by
          simp [Finset.sum_add_distrib, Finset.sum_add_distrib, add_assoc] <;>
              simp_all [Finset.sum_add_distrib, Finset.sum_add_distrib, add_assoc] <;>
            linarith
    _ =
        ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) < l then a k * a l else 0) +
            ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) = l then a k * a l else 0) +
          ∑ k : Fin n, ∑ l : Fin n, (if (l : ℕ) < k then a k * a l else 0) :=
      by simp [Finset.sum_add_distrib, Finset.sum_add_distrib, add_assoc]
    _ =
        ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) < l then a k * a l else 0) +
            ∑ k : Fin n, ∑ l : Fin n, (if (k : ℕ) = l then a k * a l else 0) +
          ∑ k : Fin n, ∑ l : Fin n, (if (l : ℕ) < k then a k * a l else 0) :=
      by rfl