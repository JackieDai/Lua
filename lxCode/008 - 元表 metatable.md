## 元表<Metatable>

[参考链接](https://www.runoob.com/lua/lua-metatables.html)

> - 元表并不是一个普通的表，而是一套自定义的计算规则，用这些规则，可以实现表与表之间的运算
>
> - 计算规则，基本以函数的方式，写在元表中，所以又称为元方法(就是写在元表里面的方法)
>
> - 起到一个类似于其它语言中的运算符重载的作用

元表(Metatable)满足多个table之间的运算操作;

> 两个table相加，lua内部的流程是
>
> - 先检查 两个 table 是否有元表
> - 再检查 是否有 __add 字段【这个字段一般是function 或者 table】

## 给table添加元表

- **`setmetatable(table,metatable):`** 

  > 给 table 设置元表(metatable)，如果元表(metatable)中存在 __metatable 键值，setmetatable 会失败。

- **`getmetatable(object)`**

  > 返回对象的元表(metatable)。

```lua
function setmetatable(table: T, metatable: table) --returns table.
  --[[
Sets the metatable for the given table. (To change the metatable of other types from Lua code, you must use the debug library.) 
 
If metatable is nil, removes the metatable of the given table. If the original metatable has a "__metatable" field, raises an error.

This function returns table.
]]

function getmetatable(object: any) --returns table.
--[[
If object does not have a metatable, returns nil. 
Otherwise, if the object's metatable has a "__metatable" field, returns the associated value. 
Otherwise, returns the metatable of the given object.
]]
```

## __index

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/WX20230926-111208.png)

```lua
  t1 = {
      id = 123,
      name = "jackie"
  }
-- 访问 不存在的 索引，返回 nil
  print(t1.age) -- nil

  function indexIsTableType()
      t1.age = 20
      meta = {
          __index = {
              age = 18
          }
      }
  		-- 因为上面给 t1 添加了 age 索引，并将给其赋值为20
      print(t1.age) -- 20
      setmetatable(t1,meta)
  		-- 移除 索引： age
      t1.age = nil
  		-- 因为给t1 设置了元表，且__index 里 key = age, value = 18, 所以下面的log 为 18
      print(t1.age) -- 18
  end
  indexIsTableType()

	function indexIsFunctionType()
      -- 设置 table 的key
      t1.phone = "t1_phone"
      meta = {
          __index = function (table, key)
              print(table, key)
              table[key] = "new-phone"
              return "index-phone"
          end
      }
      -- 如果table自己有key 就会直接返回 value ,不会关meta
      print(t1.phone) -- t1_phone
      setmetatable(t1, meta)
      print(t1.phone) -- t1_phone

      -- 如果table 没有对应的key,就会从__index 里去找
      t1.phone = nil
      print(t1.phone) -- index-phone
  end
```

## __newIndex

__newindex 元方法用来对表更新，__index则用来对表访问 。

> 当你给表的一个缺少的索引赋值，解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作。

```lua
mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

-- mytable 本身就有 key1 的元素，所以可以直接访问
print(mytable.key1) -- value1

-- newkey 不是 mytable 里的 key 索引,解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作
mytable.newkey = "新值2"
print(mytable.newkey, mymetatable.newkey) -- 输出为 ： nil	新值2

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1) -- 新值1	nil
```





