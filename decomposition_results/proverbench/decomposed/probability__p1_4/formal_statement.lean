theorem cov_X_X2 (h0 : lambda = 1)
  (h1 : Summable fun k => k * k^2 * poissonPMFReal lambda k)
  (h2 : Summable fun k => k * poissonPMFReal lambda k)
  (h3 : Summable fun k => k^2 * poissonPMFReal lambda k) :
  (∑' k, k * k^2 * poissonPMFReal lambda k) -
  (∑' k, k * poissonPMFReal lambda k) * (∑' k, k^2 * poissonPMFReal lambda k) = 3 :=