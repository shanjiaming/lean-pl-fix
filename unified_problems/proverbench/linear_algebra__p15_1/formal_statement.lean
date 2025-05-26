theorem vector_decomposition (hu : u ≠ 0) :
    let (a, b) := decomposition v u
v = a + b ∧ isParallel a u ∧ isOrthogonal b u :=