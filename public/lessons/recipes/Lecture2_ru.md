Семинар 2
===========

#### Задание. Получите из данного вектора вектор в котором будет обратный порядок элементов

``` r
a<-seq(-8,10,.5)
a
```

    ##  [1] -8.0 -7.5 -7.0 -6.5 -6.0 -5.5 -5.0 -4.5 -4.0 -3.5 -3.0 -2.5 -2.0 -1.5
    ## [15] -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5
    ## [29]  6.0  6.5  7.0  7.5  8.0  8.5  9.0  9.5 10.0

``` r
x=a[length(a):1]
x
```

    ##  [1] 10.0  9.5  9.0  8.5  8.0  7.5  7.0  6.5  6.0  5.5  5.0  4.5  4.0  3.5
    ## [15]  3.0  2.5  2.0  1.5  1.0  0.5  0.0 -0.5 -1.0 -1.5 -2.0 -2.5 -3.0 -3.5
    ## [29] -4.0 -4.5 -5.0 -5.5 -6.0 -6.5 -7.0 -7.5 -8.0

#### Задание. Вставьте число 99 в середину данного вектора

``` r
y=c(a[1:round(length(a)/2)],99,a[(round(length(a)/2)+1):length(a)])
```

#### Задание. Докажите, что arcos(cos(x))=x

``` r
x=0:3
y=acos(cos(x))
x==y
```

    ## [1]  TRUE FALSE  TRUE FALSE

``` r
x=c(sin(10),log(5,8),log(3,exp(1)),log(38.6,10),cos(pi+1), exp(1)^(cos(0)),atan(+Inf))
names(x)=c("sin(10)","log(5,8)","ln3","lg(38.6)","cos(pi+1)","e^cos(0)","arctn(+Inf)");
sort(x)
```

    ##     sin(10)   cos(pi+1)    log(5,8)         ln3 arctn(+Inf)    lg(38.6) 
    ##  -0.5440211  -0.5403023   0.7739760   1.0986123   1.5707963   1.5865873 
    ##    e^cos(0) 
    ##   2.7182818

#### Логические операции

-   ***! = not***
-   ***| = or***
-   ***& = and***

A U B - объединение

``` r
x=seq(-10,10,.01)
y=x[(x>-10 & x< -3) | (x>0 & x<6 & x!=3)]
```

#### Факторы и функция summary()

x = factor("Mouse")

``` r
f=c(rep("mouse",3),rep("rat",2),rep("fly",11))
f=rep(c("mouse","rat","fly"),c(3,2,11))
x=factor(f)
summary(x)
```

    ##   fly mouse   rat 
    ##    11     3     2

``` r
summary(f)
```

    ##    Length     Class      Mode 
    ##        16 character character

``` r
summary(1:10)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00    3.25    5.50    5.50    7.75   10.00

``` r
summary(1:10)[4]
```

    ## Mean 
    ##  5.5

#### Задание посчитайте долю каждого нуклеотида в векторе содержащем последовательность ДНК

``` r
dna=factor(rep(c("T","G","C","A"),c(16,38,6,10)))
ratio=summary(dna)/sum(summary(dna))
```

#### Функция sample()

Создает подвыборку из выборки, в том числе путем перемешивания

sample: \* mixing \* generating

``` r
dna=factor(rep(c("T","G","C","A"),c(16,38,6,10)))
sample(dna)
```

    ##  [1] G C T G G G C G G G G G G G A T A A C C G A G G G T G G T C A G T G G
    ## [36] G G T A G G T G G G G G A G T G T A G T G G C T G T G T G T A A T G T
    ## Levels: A C G T

``` r
dna
```

    ##  [1] T T T T T T T T T T T T T T T T G G G G G G G G G G G G G G G G G G G
    ## [36] G G G G G G G G G G G G G G G G G G G C C C C C C A A A A A A A A A A
    ## Levels: A C G T

``` r
# sample(dna,size=84, replace=FALSE) 
# подобный код выдаст ошибку, т.к. мы просим создать выборку больше исходника
# а вот следующий код будет работать, т.к. replace=TRUE генерирует выборки любого 
# размера исходя из пропопрций элемнтов данной выборки
sample(dna,size=84, replace=TRUE)
```

    ##  [1] T T G T G G G C C T C G G G G C C G T G T G G T G G G G T G T T T G G
    ## [36] T G G T G A G G A C G G T G G G T G G T G T G G T G A T T T T A G A A
    ## [71] C G G G G T G G G C T G G T
    ## Levels: A C G T

``` r
sampledna=sample(c("A","T","G","C"), size=10000,replace=TRUE)
ratio=summary(factor(sampledna))/length(sampledna)
ratio2=summary(factor(dna))/length(dna)
ratio
```

    ##      A      C      G      T 
    ## 0.2503 0.2495 0.2462 0.2540

``` r
ratio2
```

    ##          A          C          G          T 
    ## 0.14285714 0.08571429 0.54285714 0.22857143

#### Функции union(x,y),intersect(x,y),setdiff(x,y)

``` r
x=1:10
y=6:14
union(x,y)
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14

``` r
intersect(x,y)
```

    ## [1]  6  7  8  9 10

``` r
setdiff(x,y)
```

    ## [1] 1 2 3 4 5

``` r
setdiff(y,x)
```

    ## [1] 11 12 13 14

#### Уничтожение всех переменных в памяти

``` r
rm(list=ls())
```

#### Функция cumsum()

``` r
cumsum(1:10)
```

    ##  [1]  1  3  6 10 15 21 28 36 45 55

#### Задание. Создайте длинные последовательности с заданными пропорциями элементов

``` r
dna2=sample(c("A","T","G","G","G","C"), size=3826513,replace=TRUE)
ratio=summary(factor(dna2))/length(dna2)
ratio
```

    ##         A         C         G         T 
    ## 0.1670801 0.1667110 0.4999758 0.1662331

``` r
dna2=sample(c("A","T","G","C"), size=3826513,prob=c(.5/3,.5/3,.5,.5/3),replace=TRUE)
ratio=summary(factor(dna2))/length(dna2)
ratio
```

    ##         A         C         G         T 
    ## 0.1667879 0.1666097 0.4998209 0.1667816

\#\# Data frames -Таблицы
=========================

#### Выборки из таблиц

``` r
iris[iris$Species==c("setosa","virginica"),]
```

    ##     Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
    ## 1            5.1         3.5          1.4         0.2    setosa
    ## 3            4.7         3.2          1.3         0.2    setosa
    ## 5            5.0         3.6          1.4         0.2    setosa
    ## 7            4.6         3.4          1.4         0.3    setosa
    ## 9            4.4         2.9          1.4         0.2    setosa
    ## 11           5.4         3.7          1.5         0.2    setosa
    ## 13           4.8         3.0          1.4         0.1    setosa
    ## 15           5.8         4.0          1.2         0.2    setosa
    ## 17           5.4         3.9          1.3         0.4    setosa
    ## 19           5.7         3.8          1.7         0.3    setosa
    ## 21           5.4         3.4          1.7         0.2    setosa
    ## 23           4.6         3.6          1.0         0.2    setosa
    ## 25           4.8         3.4          1.9         0.2    setosa
    ## 27           5.0         3.4          1.6         0.4    setosa
    ## 29           5.2         3.4          1.4         0.2    setosa
    ## 31           4.8         3.1          1.6         0.2    setosa
    ## 33           5.2         4.1          1.5         0.1    setosa
    ## 35           4.9         3.1          1.5         0.2    setosa
    ## 37           5.5         3.5          1.3         0.2    setosa
    ## 39           4.4         3.0          1.3         0.2    setosa
    ## 41           5.0         3.5          1.3         0.3    setosa
    ## 43           4.4         3.2          1.3         0.2    setosa
    ## 45           5.1         3.8          1.9         0.4    setosa
    ## 47           5.1         3.8          1.6         0.2    setosa
    ## 49           5.3         3.7          1.5         0.2    setosa
    ## 102          5.8         2.7          5.1         1.9 virginica
    ## 104          6.3         2.9          5.6         1.8 virginica
    ## 106          7.6         3.0          6.6         2.1 virginica
    ## 108          7.3         2.9          6.3         1.8 virginica
    ## 110          7.2         3.6          6.1         2.5 virginica
    ## 112          6.4         2.7          5.3         1.9 virginica
    ## 114          5.7         2.5          5.0         2.0 virginica
    ## 116          6.4         3.2          5.3         2.3 virginica
    ## 118          7.7         3.8          6.7         2.2 virginica
    ## 120          6.0         2.2          5.0         1.5 virginica
    ## 122          5.6         2.8          4.9         2.0 virginica
    ## 124          6.3         2.7          4.9         1.8 virginica
    ## 126          7.2         3.2          6.0         1.8 virginica
    ## 128          6.1         3.0          4.9         1.8 virginica
    ## 130          7.2         3.0          5.8         1.6 virginica
    ## 132          7.9         3.8          6.4         2.0 virginica
    ## 134          6.3         2.8          5.1         1.5 virginica
    ## 136          7.7         3.0          6.1         2.3 virginica
    ## 138          6.4         3.1          5.5         1.8 virginica
    ## 140          6.9         3.1          5.4         2.1 virginica
    ## 142          6.9         3.1          5.1         2.3 virginica
    ## 144          6.8         3.2          5.9         2.3 virginica
    ## 146          6.7         3.0          5.2         2.3 virginica
    ## 148          6.5         3.0          5.2         2.0 virginica
    ## 150          5.9         3.0          5.1         1.8 virginica

``` r
iris[iris$Species=="setosa" | iris$Species=="virginica",c("Petal.Length","Species")]
```

    ##     Petal.Length   Species
    ## 1            1.4    setosa
    ## 2            1.4    setosa
    ## 3            1.3    setosa
    ## 4            1.5    setosa
    ## 5            1.4    setosa
    ## 6            1.7    setosa
    ## 7            1.4    setosa
    ## 8            1.5    setosa
    ## 9            1.4    setosa
    ## 10           1.5    setosa
    ## 11           1.5    setosa
    ## 12           1.6    setosa
    ## 13           1.4    setosa
    ## 14           1.1    setosa
    ## 15           1.2    setosa
    ## 16           1.5    setosa
    ## 17           1.3    setosa
    ## 18           1.4    setosa
    ## 19           1.7    setosa
    ## 20           1.5    setosa
    ## 21           1.7    setosa
    ## 22           1.5    setosa
    ## 23           1.0    setosa
    ## 24           1.7    setosa
    ## 25           1.9    setosa
    ## 26           1.6    setosa
    ## 27           1.6    setosa
    ## 28           1.5    setosa
    ## 29           1.4    setosa
    ## 30           1.6    setosa
    ## 31           1.6    setosa
    ## 32           1.5    setosa
    ## 33           1.5    setosa
    ## 34           1.4    setosa
    ## 35           1.5    setosa
    ## 36           1.2    setosa
    ## 37           1.3    setosa
    ## 38           1.4    setosa
    ## 39           1.3    setosa
    ## 40           1.5    setosa
    ## 41           1.3    setosa
    ## 42           1.3    setosa
    ## 43           1.3    setosa
    ## 44           1.6    setosa
    ## 45           1.9    setosa
    ## 46           1.4    setosa
    ## 47           1.6    setosa
    ## 48           1.4    setosa
    ## 49           1.5    setosa
    ## 50           1.4    setosa
    ## 101          6.0 virginica
    ## 102          5.1 virginica
    ## 103          5.9 virginica
    ## 104          5.6 virginica
    ## 105          5.8 virginica
    ## 106          6.6 virginica
    ## 107          4.5 virginica
    ## 108          6.3 virginica
    ## 109          5.8 virginica
    ## 110          6.1 virginica
    ## 111          5.1 virginica
    ## 112          5.3 virginica
    ## 113          5.5 virginica
    ## 114          5.0 virginica
    ## 115          5.1 virginica
    ## 116          5.3 virginica
    ## 117          5.5 virginica
    ## 118          6.7 virginica
    ## 119          6.9 virginica
    ## 120          5.0 virginica
    ## 121          5.7 virginica
    ## 122          4.9 virginica
    ## 123          6.7 virginica
    ## 124          4.9 virginica
    ## 125          5.7 virginica
    ## 126          6.0 virginica
    ## 127          4.8 virginica
    ## 128          4.9 virginica
    ## 129          5.6 virginica
    ## 130          5.8 virginica
    ## 131          6.1 virginica
    ## 132          6.4 virginica
    ## 133          5.6 virginica
    ## 134          5.1 virginica
    ## 135          5.6 virginica
    ## 136          6.1 virginica
    ## 137          5.6 virginica
    ## 138          5.5 virginica
    ## 139          4.8 virginica
    ## 140          5.4 virginica
    ## 141          5.6 virginica
    ## 142          5.1 virginica
    ## 143          5.1 virginica
    ## 144          5.9 virginica
    ## 145          5.7 virginica
    ## 146          5.2 virginica
    ## 147          5.0 virginica
    ## 148          5.2 virginica
    ## 149          5.4 virginica
    ## 150          5.1 virginica

#### Основные типы структур данных

| Type      | Function     | Options                                 |
|-----------|--------------|-----------------------------------------|
| Vector    | c()          | \[i\] -position or logic                |
| Factor    | factor()     | \[\] - position or logic                |
| Matrix    | matrix()     | \[row,col\]; \[i\] - positional logical |
| List      | list()       | \[\[i\]\], $                            |
| dataframe | data.frame() | \[,\] $                                 |

#### Виды у которых Petal.Length&gt;2 но &lt;3, вывести виды и количество попадений в условия

``` r
summary(factor(iris[(iris$Petal.Length>2 & iris$Petal.Length<6),"Species" ]))
```

    ## versicolor  virginica 
    ##         50         39

#### Создание функций - Functioning

``` r
my_func = function(p) 
  {
    x=p^2
    y=x^3
    print("result")
    return(c(x,y))
   
  }
my_func(2)
```

    ## [1] "result"

    ## [1]  4 64

``` r
mathses = function(p,q)
  {
    result = c(p+q,log(p+q,10),exp(p+q))
    names(result) = c("summ", "log","exp")
    return(result)
  }
mathses(2,3)
```

    ##      summ       log       exp 
    ##   5.00000   0.69897 148.41316

#### Проверки условий

``` r
mf = function(p)
  {
  
    if (p>0)
      {
        x=log(p)
        return(x)
      }
    else
      {
        return(NULL)      
      }
  }
mf(-1)
```

    ## NULL

``` r
# gamma(x) gives !(x-1), we need to make function which makes true factorial
myfactorial = function(p) 
  {
    if (p>0 & p%%1==0)
      {return(gamma(p+1))}
    else
      {return(NULL)}
  }
  
  myfactorial(5)
```

    ## [1] 120

``` r
 myfactorial = function(p) 
  {
    if (p>0 & p%%1==0)
      {return(gamma(p+1))}
    else
      {return(NULL)}
  }
  
  mydistribution = function(x,p)
    {
      if ( x>=0 & x%%1==0 & p<=1 & p>0 )
        {
          return(p*(1-p)^x)        
        }
      else
        {
          return(0)
        }
      
    }
mydistribution(3,.4)
```

    ## [1] 0.0864
