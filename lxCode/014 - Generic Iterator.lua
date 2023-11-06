-- Generic For Iterator
local function testGenericIterator()
    local arr = {'Jackie',"Rose"}
    for index, value in ipairs(arr) do
        print(index,"===",value)
    end
end
-- testGenericIterator()

-- custom Stateless Iterator
local function squre(maxCount, currentCount)
    if currentCount < maxCount then
        currentCount = currentCount + 1
        return currentCount, currentCount * currentCount
    end
end

-- print(squre(3,1))
-- print("-----")

local function squres(maxCount)
    return squre, maxCount, 0
end

-- local function testStatelessIterator()
--     for index, value in squre, 3, 0 do
--         print(index, value)
--     end
-- end


local function testStatelessIterator()
    for index, value in squres(3) do
        print(index, value)
    end

    --[[
        在Lua中，`for` 循环的迭代器需要指定一个迭代函数、一个状态常量和一个控制变量。在你的代码中，`square, 3, 0` 用于定义 `for` 循环的迭代器，具体含义如下：

        1. `square` 是迭代函数：`square` 是一个你定义的函数，用于产生每个迭代步骤的值。在这种情况下，`square` 函数接受两个参数：`iteratorMaxCount` 和 `currentNumber`，并且返回两个值：`currentNumber` 和 `currentNumber * currentNumber`。这些值将在迭代中被使用。

        2. `3` 是状态常量：在迭代器中，状态常量是一个值，它在整个迭代过程中保持不变。在你的代码中，状态常量设置为 `3`，它将传递给 `square` 函数作为 `iteratorMaxCount` 的初始值。

        3. `0` 是控制变量：控制变量是迭代器用来跟踪迭代过程的变量。在你的代码中，控制变量没有明确指定，但会被 `for` 循环自动创建和管理。它将在每次迭代中存储 `square` 函数返回的第一个值（`currentNumber`），并在下一次迭代中传递给 `square` 函数作为 `currentNumber`。

        因此，`for i, n in square, 3, 0` 的含义是使用 `square` 函数作为迭代器，在初始状态下，`iteratorMaxCount` 被设置为 `3`，控制变量被设置为 `0`，然后通过迭代调用 `square` 函数来生成 `i` 和 `n` 的值。这将产生一个从0到3的迭代，每个迭代步骤都会调用 `square` 函数生成相应的值。
    ]]
end
-- testStatelessIterator()


-- Stateful Iterator
-- the difference between Stateless and Stateful Iterator are as follows:

--  1.stateless iterator does not retain state. it need state constane value and control variable. each time the func called based on the second control variable. when it excuted to the end , control variable and result value will return back.
--  2.stateful iterator need retain state. capture and maintain the state of current element through closure


local function customStatefulIterator(collection)
    local index = 0
    local constant = #collection

    local iterator = function ()
        index = index + 1
        if index <= constant then
            return collection[index]
        end
    end

    return iterator
end

local function testStatufulIterator()
    local arr = {"jackie","dai"}
    for value in customStatefulIterator(arr) do
        print("stateful == ",value)
        
    end
end
testStatufulIterator()



