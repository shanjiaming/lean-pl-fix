theorem polynomial_evaluation_sum (h1 : f.eval 1 = 10) (h2 : f.eval 2 = 20) (h3 : f.eval 3 = 30) :
  f.eval 12 + f.eval (-8) = 19840 :=