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

