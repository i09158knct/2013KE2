main = do
    putStr "ex1_1: "
    print $ ex1_1 5 2.5

    putStr "ex1_2: "
    print $ ex1_2 3

    putStr "ex1_3: "
    print $ ex1_3 3

    putStr "ex1_4: "
    print $ ex1_4 3 4 5


    putStr "ex2_1: "
    print $ ex2_1 80
    putStr "ex2_1: "
    print $ ex2_1 49

    putStr "ex2_2: "
    print $ ex2_2 1 2 1
    putStr "ex2_2: "
    print $ ex2_2 1 1 1
    putStr "ex2_2: "
    print $ ex2_2 2 1 (-1)

    putStr "ex2_3: "
    print $ ex2_3 1996
    putStr "ex2_3: "
    print $ ex2_3 2000
    putStr "ex2_3: "
    print $ ex2_3 2100


    putStr "ex3_1: "
    print $ ex3_1 5

    putStr "ex3_2: "
    print $ ex3_2 2 3

    putStr "ex3_3: "
    print $ ex3_3 10

    putStr "ex3_4: "
    print $ ex3_4 30 12


ex1_1 :: Float -> Float -> Float
ex1_1 a h = a * h / 2

ex1_2 :: Float -> Float
ex1_2 radius = radius ** 2 * pi

ex1_3 :: Float -> Float
ex1_3 radius = 4 * radius ** 3 * pi / 3

ex1_4 :: Float -> Float -> Float -> Float
ex1_4 a b c = sqrt $ s * (s - a) * (s - b) * (s - c)
    where s = (a + b + c) / 2



ex2_1 :: Integer -> String
ex2_1 n
    | n >= 80   = "A"
    | n >= 60   = "B"
    | n >= 50   = "C"
    | otherwise = "D"

ex2_2 :: Float -> Float -> Float -> Integer
ex2_2 a b c
    | d > 0     = 2
    | d == 0    = 1
    | otherwise = 0
    where d = (b * b) - (4 * a * c)

ex2_3 :: Integer -> Bool
ex2_3 year = multipleOf 4 && (not $ multipleOf 100) || multipleOf 400
    where multipleOf n = year `mod` n == 0



ex3_1 :: Integer -> Integer
ex3_1 0 = 1
ex3_1 1 = 1
ex3_1 n = n * (ex3_1 $ n - 1)

ex3_2 :: Integer -> Integer -> Integer
ex3_2 n 0 = 1
ex3_2 n 1 = n
ex3_2 n m = n * (ex3_2 n (m - 1))

ex3_3 :: Integer -> Integer
ex3_3 n = sum [1..n]

ex3_4 :: Integer -> Integer -> Integer
ex3_4 a 0 = a
ex3_4 a b = ex3_4 b (a `mod` b)

