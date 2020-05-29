# A Poor Man's Concurrency Monad 
[file link]:(http://citeseerx.ist.psu.edu/viewdoc/download;jsessionid=18AD868210C6DE3AA7515431AA379EFB?doi=10.1.1.39.8039&rep=rep1&type=pdf)

>   class Monad m where
>>	(>>=) :: m a -> (a-> m b) -> m b
>>	return :: a -> m a

-- bind operator   = takes care of combining the output of two computations

-- do-notaion as syntactic sugar for monadic expressions

>   expr1 >>= \x	    do x <- expr1
>   expr2 >>= \_	     ; expr2
>   expr3 >>= \y	     ; y <- expr3
>   return expr4	     ; return expr4

## Writer Monad = a monad with output
>   class Monad m => Writer m where
>>	write :: String -> m ()
>>>	    write operator  = takes a String as argument, 
>>>		which becomes output in a side effect of monad

>   type W a = (a, String)
>
>   instance Monad W where
>>	(a, s) >>= k    = let (b, s') = k a in (b, s ++ s')
>>	return x	    = (x, "")
>
>   instance Writer W where
>>	write s = ((), s)
>

>   class MonadTrans t where
>>	lift :: Monad m => m a -> (t m) a

>   type C a = (a -> Action) -> Action
