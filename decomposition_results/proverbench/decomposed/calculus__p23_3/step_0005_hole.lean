theorem h₄ (n : ℕ) (h₁ : a_n = fun n => (1 + (2 / 3) ^ n) / (3 * (1 - (2 / 3) ^ (n + 1)))) (h₂ : Tendsto (fun n => (2 / 3) ^ n) Filter.atTop (nhds 0)) : (fun n => (2 / 3) ^ (n + 1)) = fun n => 2 / 3 * (2 / 3) ^ n :=
  by
  --  funext n
  --  --  rw [pow_succ] <;> ring
  hole