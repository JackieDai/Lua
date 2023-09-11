

---用pack 处理函数可变参
---table.pack(...) 将可变参打包成一个table，且会在最后多出一个n键，其对应的值是可变参的参数个数
---table.unpack(list, i, j) 解包，将table 解成可变参


--求和
function func22(...)


    --print(table.pack(...).n);

    t1=table.pack(...);

    sum=0;
    --[[
    for k,v in pairs(t1) do
        if k ~= "n" then
          sum=sum+v;
        end
    end
    ]]--

    count=t1.n;
    for i=1,count do
        if t1[i] ~= nil then
            sum = sum + t1[i];
        end
    end
    return sum;

end

--print(func22(1,2,nil,nil,3,4,5,nil));

function func3()
    --return 1,2,3,4,5;
    return table.pack(11,22,33,4,5);
end

--print(func3());-- print(1,2,3);
--print(func3());
--print(table.unpack(func3()));


--a=func3();
--print(a);
--a1,b1,c1,d1,f1=table.unpack(a);
--print(a1,b1,c1,d1,f1);


---可变参转成table
function func44(...)

    t1={...};
    count=#t1;
    --print(count);

    for k,v in pairs(t1) do
        --if k ~= "n" then
            --sum=sum+v;
        --end

        print(k,v);
    end

end

func44(1,2,3,nil,nil,4);