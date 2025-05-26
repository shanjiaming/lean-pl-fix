theorem E_X (h : Summable (fun (k : ℕ) => k * poissonPMFReal lambda k)) :
  ∑' k, k * poissonPMFReal lambda k = lambda :=