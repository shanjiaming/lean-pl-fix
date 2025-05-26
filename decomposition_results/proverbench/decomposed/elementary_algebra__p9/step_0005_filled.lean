theorem h₄ (n : ℕ) (hn : 0 < n) (h : 5 ^ n > sorry) (k✝ k : ℕ) (hk : Nat.le 12 k) (IH : 5 ^ k ≤ k !) (h₃ : 5 ≤ k) : 5 ^ (k + 1) = 5 * 5 ^ k := by rw [pow_succ] <;> ring
  hole