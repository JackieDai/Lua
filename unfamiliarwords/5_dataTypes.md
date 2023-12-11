[TOC]

> Lua is a dynamically typed language, so the variables don't have types, only the values have types. Values can be stored in variables, passed as parameters and returned as results.
>
> There are eight data types in lua language. The follows indicate which eight data types are.
>
> - nill
> - boolean
> - string
> - number
> - table
> - function
> - userdata
> - thread

## differentiate..A.. from..B..

> 将 A 与 B 区别开来
>
> differentiate	**/ˌdɪfəˈrenʃieɪt/**
>
> v.使不同；求……的微分；区别
>
> > 文中是 **使不同** 的意思

**nil** used to **differentiate** the value **from** having some data or no nil data

## precision

> **/prɪˈsɪʒ(ə)n/**
>
> n.精确（性），准确（性）；严谨，细致；（测量、计算或说明的）精确化（尤以数字表现）
>
> adj.（设计）精密的，精确的；要求技术精确的，（行动）精确的

**number**r epresents real(double **precision** floating point) numbers.[表示实数（双精度浮点数）。]

## arbitrary

> **/ˈɑːrbɪtreri/**
>
> adj.任意的，随心所欲的；专横的，武断的

**userdata** represents **arbitrary** C data.

## coroutine

> **/kəruːˈtiːn/**
>
> n.协同程序

**thread** represents independent threads of execution and it is used to implement coroutines.

## ordinary

> **/ˈɔːrd(ə)neri/**
>
> > "Ordinary" 通常用来描述普通的、常见的、普遍的或平凡的事物。
>
> adj.普通的，平常的；平淡无奇的，平庸的；（尤指法官、主教）常任的，本身有权的
>
> n.常见的人（或事物）（the ordinary）；<英>常任法官；管区长，教区长（the Ordinary）；（罗马天主教）常规弥撒（Ordinary）；礼拜式规程书典（Ordinary）；（纹章）普通图记；普通股（ordinary share 的简称）；<美>（前轮大后轮小的）老式自行车

## graph

> **/ɡræf/**
>
> n.图表，曲线图；坐标图；代表声音单位（或其他言语特征）的书写符号
>
> v.用图表表示

## associative

> **/əˈsoʊsieɪtɪv/**
>
> > 文中是指 **关联的，相关的**	意思
>
> adj.联想的；联合的；组合的； 关联的

table represent **ordinary** arrays, <u>symbol tables（符号表）</u>, sets, records, graphs(图), trees, etc., and implements associative(关联的) arrays. It can hold any value (except nil).