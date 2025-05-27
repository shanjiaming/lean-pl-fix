theorem scalar_multiplication (n : ℕ) (a b : ZMod 3) : n • (a, b) = (n • a, n • b):= by simp [Prod.smul_def] <;> aesop
  hole