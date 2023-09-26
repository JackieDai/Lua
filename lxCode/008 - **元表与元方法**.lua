
t1={11,22,nil,nil,nil,33};
t2={111,222,333,444,555};
metaT3={};

-- 给t1 添加元表
setmetatable(t1, metaT3)

-- 给t2 添加元表
setmetatable(t2, metaT3)

-- 给元表 metaT3 添加 元方法
metaT3.__add = function (table1, table2)
    local result = {}

    -- 获取 参数 table 的元素个数
    local len1 = #table1
    local len2 = #table2

    -- 取出 长度 最大的 table 进行运算，确保所有的元素都会参与运算
    if len1 > len2 then
        len2 = len1
    end

    for i = 1, len2, 1 do
        local a = table1[i] or 0;
        local b = table2[i] or 0;
        result[i] = a + b
    end

    return result
end


t3 = t1 + t2
for k,v in pairs(t3) do
    print(k,v);
end
--[[
    1	122
    2	244
    3	333
    4	444
    5	555
    6	33
]]