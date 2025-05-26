theorem h₃  : ContinuousAt (fun x => (3 + x) / (5 + 2 * x)) 0 :=
  by
  --  apply ContinuousAt.div
  · exact continuousAt_const.add continuousAt_id
  · exact continuousAt_const.add (continuousAt_const.mul continuousAt_id)
  · norm_num
  hole