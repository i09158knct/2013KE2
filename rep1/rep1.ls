ex1_1 = (length, height) ->
  length * height / 2

ex1_2 = (radius) ->
  (Math.pow radius 2) * Math.PI

ex1_3 = (radius) ->
  4 * (Math.pow radius 3) * Math.PI / 3

ex1_4 = (a, b, c) -> let s = (a + b + c) / 2
  Math.sqrt(s * (s - a) * (s - b) * (s - c))



ex2_1 = (n) ->
  | n >= 80   => "優"
  | n >= 60   => "良"
  | n >= 50   => "可"
  | otherwise => "不可"

ex2_2 = (n) ->
  | n > 0     => 2
  | n == 0    => 1
  | otherwise => 0

ex2_3 = (year) -> let multipleOf = (-> year % &0 == 0)
  (multipleOf 4) && (not multipleOf 100) || (multipleOf 400)

