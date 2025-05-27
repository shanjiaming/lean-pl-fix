theorem limit_of_function_as_x_approaches_zero :
  Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) :=