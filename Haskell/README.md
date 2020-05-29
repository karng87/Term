# [ ]
> list 원소는 같은 타입이어야 한다.  
  (:)생성자의  맨 마지막에 있는 [] 은 생성자 이다.  
  (:) 앞에 나오는 [] 은 빈 리스트 원소이다.  
  []의 위치에 따라 생성자 인지 원소인지 구별하여  
  리스트 안의 원소는 같은 타입이어야 함으로 만족하면 다중 리스트도 생성가능하다.  
                                                                               
```haskell
[1]     == 1:[]
1:[]	   == [1]
1:2:[]   == [1,2]
1:2:[3]  == 1:2:3:[] == [1,2,3]
1:[]:[3] == [1,[],3]
[]:[[]]  == []:[]:[] == [[],[]] -- 마지막 []은 생성자. 앞의 원소타입이 같으면 ok

[]:[[]]:[[[]]]  == [[],[[]],[[]]] -- 빈리스트가 빈리스트의 리스트를 포함하는 개념임으로 가능
[]:[[1]]        == [[],[1]]
[1]:[]   => [[1]]
[1]:[2]:[]  == [[1],[2]]
[1]:[2]:[[3]] == [1]:[2]:[3]:[] = [[1],[2],[3]]
```

> The idea is  
  that you’re lazily building the result list   
  as you consume elements from the input list,   
  so you return __[]__   
  when you want to __terminate__ the result list.  
```haskell
    takeWhile (< 3) [0..] 
    =
    0 : takeWhile (< 3) [1..]
    =
    0 : 1 : takeWhile (< 3) [2..]
    =
    0 : 1 : 2 : takeWhile (< 3) [3..]
    =
    0 : 1 : 2 : [] ==== 중요 종료됨.
    =
    [0, 1, 2]

foldrTakeWile :: (a -> Bool) -> [a] -> [a]
foldrTakeWile f xs = foldr (\x acc -> if f x then x : acc else []) [] xs
```
> foldr foldl 함수의 인자 순서가 다름 주의
