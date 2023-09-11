
--[[

    迭代器

    百科百科 https://baike.baidu.com/item/迭代器

    迭代器（iterator）有时又称光标（cursor）是程序设计的软件设计模式，
    可在容器对象（container，例如链表或数组）上遍访的接口，
    设计人员无需关心容器对象的内存分配的实现细节。

]]--

t1={11,22,33,nil,44,55};

for k,v in pairs(t1) do
    print(k,v);
end

print("");


function myIpairs(tab)

    local index=0;
    local count=#tab;

    return function()
        index = index+1;

        if index <= count then

            if tab[index] == nil then
                index = index+1;
            end
            return index,tab[index];

        end
    end

end



for k,v in myIpairs(t1) do
    print(k,v);
end

print("fdfsfdsds");

