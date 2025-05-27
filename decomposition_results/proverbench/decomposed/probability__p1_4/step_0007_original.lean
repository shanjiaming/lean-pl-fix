theorem h5₄ (h0 : 1 = 1) (h1 : Summable fun k => ↑k * ↑k ^ 2 * poissonPMFReal 1 k) (h2 : Summable fun k => ↑k * poissonPMFReal 1 k) (h3 : Summable fun k => ↑k ^ 2 * poissonPMFReal 1 k) (h4 : ∑' (k : ℕ), ↑k * poissonPMFReal 1 k = 1) : ∑' (k : ℕ), ↑k ^ 2 * poissonPMFReal 1 k = 2 :=
  by
  rw [tsum_eq_single 0]
  ·
    norm_num [poissonPMFReal, Nat.factorial] <;> simp_all [poissonPMFReal, Nat.factorial] <;> norm_num <;>
            simp_all [poissonPMFReal, Nat.factorial] <;>
          norm_num <;>
        simp_all [poissonPMFReal, Nat.factorial] <;>
      norm_num
  · intro k hk
    rw [poissonPMFReal]
    split_ifs with h
    · exfalso
      simp_all [Nat.factorial] <;> norm_num <;> simp_all [Nat.factorial] <;> norm_num <;> simp_all [Nat.factorial] <;>
        norm_num
    ·
      simp_all [Nat.factorial] <;> field_simp [Real.exp_neg] <;> ring_nf <;> norm_num <;> simp_all [Nat.factorial] <;>
                    field_simp [Real.exp_neg] <;>
                  ring_nf <;>
                norm_num <;>
              simp_all [Nat.factorial] <;>
            field_simp [Real.exp_neg] <;>
          ring_nf <;>
        norm_num