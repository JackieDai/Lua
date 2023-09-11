

---用select 处理函数可变参

--select(n, ...) 表示获取可变参的一部份数据，从第n个位置开始
--select("#", ...) 表示获取可变参的元素个数


--求和
function func22(...)

    sum=0;
    count=select("#",...);
    for i=1,count do
        sum = sum + ((select(i,...)));
    end

    return sum,sum/count;


end

print(func22(1,2,3,4,5));




function func33()
    return 11,22,33;
end

function func44()
    return 111,222,333;
end


---茴香豆的茴字有几种写法
---
--[[
print(  func33()  );
print(  func44()  );
print("");
print( (func33())  );
print( (func44())  );
print("");
print(  func33(),"====",func44()  );
print(  (func33()),"====",func44()  );
]]--

