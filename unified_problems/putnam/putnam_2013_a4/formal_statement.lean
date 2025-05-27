theorem putnam_2013_a4
(n k : ℕ)
(circle : Fin n → Fin 2)
(Z N : Fin n × Fin (n + 1) → ℤ)
(ws : Fin k → Fin n × Fin (n + 1))
(Zsum Nsum : ℤ)
(npos : n ≥ 1) (kpos : k ≥ 1)
(hZ : ∀ w, Z w = ∑ l : {x : Fin n | x < w.2}, if (circle (w.1 + l) = 0) then 1 else 0)
(hN : ∀ w, N w = ∑ l : {x : Fin n | x < w.2}, if (circle (w.1 + l) = 1) then 1 else 0)
(Zle1 : ∀ w w', w.2 = w'.2 → |(Z w : ℤ) - Z w'| ≤ 1)
(hZsum : Zsum = ((1 : ℝ) / k) * ∑ j : Fin k, Z (ws j))
(hNsum : Nsum = ((1 : ℝ) / k) * ∑ j : Fin k, N (ws j)) :
∃ w, Z w = Zsum ∧ N w = Nsum := by