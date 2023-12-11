[TOC]

> A variable is nothing but a name given to the storage area that our program can manipulate.

## be composed of

> 由……组成：由各种事物组成。
>
> ---
>
> compose	**/kəmˈpoʊz/**
>
> v.组成，构成；作曲；撰写（信、诗或演讲稿）；使镇静，使平静；为（照片、图像）构图；排版，排稿
>
> 词根词缀： com-共同 + -pos-放置 + -e → 共同放置,放在一起
>
> - "be composed of" 通常更加正式，
>
> -  "consist of" 则更为常见和通用。
>
>
>   在许多情况下，这两者可以互换使用，但在一些语境中，可能更倾向于选择其中一个，以更好地适应语言风格或语气。

The name of a variable can be **composed** of letters, digits, and the underscore character.

## explicitly

> **/ɪkˈsplɪsɪtli/**
>
> adv.清楚明确地，详述地；直截了当地，坦率地；露骨地，不隐晦地

All variables are considered global unless **explicitly** declared as a local.

## instruct

> **/ɪnˈstrʌkt/**
>
> > 文中是 **指示**  的意思
>
> v.指示,指导，**吩咐**；教授，指导；聘请（律师），托办；通知；（法官向陪审团）建议，作说明

The line **local i, j** both declares and defines the variables i and j; which instructs the interpreter to create variables named i, j and limits the scope to be local.

## static storage duration

> 静态存储期

## dynamic storage duration

> 动态存储期

> 在 C 和 C++ 等编程语言中，存储期（storage duration）指的是变量存在的时间段。有两种常见的存储期：静态存储期（static storage duration）和动态存储期（dynamic storage duration）。
>
> 1. **静态存储期（Static Storage Duration）：**
>    - 静态存储期的变量在程序启动时创建，在程序结束时销毁。
>    - 这类变量包括全局变量和使用 `static` 关键字声明的局部变量。
>    - 全局变量在整个程序运行期间都存在，而静态局部变量在其声明的函数执行期间存在，但其值在函数调用之间保持不变。
>
>     ```c
>     int globalVariable;  // 全局变量，静态存储期
>    
>     void exampleFunction() {
>         static int staticVariable;  // 静态局部变量，静态存储期
>     }
>     ```
>
> 2. **动态存储期（Dynamic Storage Duration）：**
>    - 动态存储期的变量在程序运行时动态地分配内存，不受作用域的限制，需要手动管理其生命周期。
>    - 这包括使用 `malloc`、`free`（在C中）或 `new`、`delete`（在C++中）等动态内存分配和释放的变量。
>
>     ```c
>     int *dynamicVariable = (int *)malloc(sizeof(int));  // 动态分配的变量，动态存储期
>     // 使用 dynamicVariable
>     free(dynamicVariable);  // 释放动态分配的内存
>     ```
>
> 总体而言，存储期是关于变量生命周期的概念，而静态存储期和动态存储期则指示了变量的不同生命周期和分配方式。

## implicitly

> **/ɪmˈplɪsɪtli/**
>
> > 文中是 指 **隐式**转换 的意思
>
> adv.含蓄地，暗中地；绝对地

For definition without an initializer: variables with **static storage duration** are **implicitly** initialized with nil.

## takes place

> 发生：表示某个事件、活动或情况发生或进行。
>
> · The ceremony takes place in the evening.
>
> 典礼在晚上举行。

Value assigning in Lua **takes place** like first variable in the variable_list with first value in the value_list and so on. [Lua中的赋值就像variable_list中的第一个变量和value_list中的第一个值一样发生，依此类推。]

## literal

> **/ˈlɪtərəl/**
>
> adj.字面上的；逐字的；缺乏想象力的，刻板的；确切的，不夸张的；（图像）写实的；（用）字母（表示）的
>
> n.<英>误印

Numeric **literals** are rvalues and so may not be assigned and cannot appear on the left-hand side.