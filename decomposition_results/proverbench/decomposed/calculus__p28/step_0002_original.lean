theorem h₀  : parabola_fun = fun x => x ^ 2 + 3 := by
  funext x
  dsimp [parabola_fun, parabola_poly, aeval_def, eval₂_add, eval₂_mul, eval₂_pow, eval₂_X, eval₂_C] <;> ring_nf <;>
          norm_num <;>
        simp_all <;>
      ring_nf <;>
    norm_num