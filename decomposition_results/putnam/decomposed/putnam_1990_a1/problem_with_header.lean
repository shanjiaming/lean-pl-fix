import Mathlib

open Filter Topology Nat

-- (fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n)
/--
Let $T_0=2,T_1=3,T_2=6$, and for $n \geq 3$, $T_n=(n+4)T_{n-1}-4nT_{n-2}+(4n-8)T_{n-3}$. The first few terms are $2,3,6,14,40,152,784,5168,40576$. Find, with proof, a formula for $T_n$ of the form $T_n=A_n+B_n$, where $\{A_n\}$ and $\{B_n\}$ are well-known sequences.
-/
theorem putnam_1990_a1
    (T : ℕ → ℤ)
    (hT012 : T 0 = 2 ∧ T 1 = 3 ∧ T 2 = 6)
    (hTn : ∀ n, T (n + 3) = (n + 7) * T (n + 2) - 4 * (n + 3) * T (n + 1) + (4 * n + 4) * T n) :
    T = ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).1 + ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).2 := by
  have h_main : ∀ n : ℕ, T n = (n ! : ℤ) + (2 : ℤ) ^ n := by
    intro n
    have h₁ : T n = (n ! : ℤ) + (2 : ℤ) ^ n := by
      have h₂ : ∀ n : ℕ, T n = (n ! : ℤ) + (2 : ℤ) ^ n := by
        intro n
        induction n using Nat.strong_induction_on with
        | h n ih =>
          match n with
          | 0 =>
            norm_num [hT012, Nat.factorial]
          | 1 =>
            norm_num [hT012, Nat.factorial]
          | 2 =>
            norm_num [hT012, Nat.factorial]
          | 3 =>
            norm_num [hT012, hTn, Nat.factorial] at *
            <;>
            (try decide) <;>
            (try ring_nf at *) <;>
            (try norm_num at *) <;>
            (try linarith)
          | n + 4 =>
            have h₃ := hTn (n + 1)
            have h₄ := hTn n
            have h₅ := hTn (n + 2)
            have h₆ := hTn (n + 3)
            simp [ih, Nat.factorial, pow_succ, Nat.mul_add, Nat.add_mul] at h₃ h₄ h₅ h₆ ⊢
            <;> ring_nf at h₃ h₄ h₅ h₆ ⊢
            <;> norm_cast at h₃ h₄ h₅ h₆ ⊢
            <;>
            (try omega) <;>
            (try ring_nf at *) <;>
            (try norm_num at *) <;>
            (try linarith) <;>
            (try nlinarith) <;>
            (try ring_nf at * <;> norm_num at * <;> nlinarith)
      exact h₂ n
    exact h₁
  
  have h_final : T = ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).1 + ((fun n : ℕ => (n)!, fun n : ℕ => 2 ^ n) : (ℕ → ℤ) × (ℕ → ℤ) ).2 := by
    have h₁ : T = (fun n : ℕ => (n ! : ℤ) + (2 : ℤ) ^ n) := by
      funext n
      rw [h_main]
    rw [h₁]
    <;> simp [Prod.fst, Prod.snd, Pi.add_apply]
    <;> rfl
  
  exact h_final