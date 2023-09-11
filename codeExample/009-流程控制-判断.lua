
--[[
    流程控制语句
        if 条件 then
            ...
        end
]]

--[[
a,b=1,2;
if a==1 then
    print("111");
end

if a > 1 then
    print(">1");
else
    print("<=1");
end

if a > 1 then
    print(">1");
elseif a==1 then
    print("==1");
else
    print("<1");
end
]]--

c,d=900,101;

if c > 100 then
    print("学仙");
elseif c>90 and c<=100 then
    print("学神");
elseif c>80 and c<=90 then
    print("学霸");
elseif c>60 and c<=80 then
    print("学长");
elseif c>50 and c<=60 then
    print("学渣");
else
    print("学酥");--本人
end


if c > 100 then
    print("学仙");
elseif c>90 and c<=100 then
    print("学神");
else
    if c>80 and c<=90 then
        print("学霸");
    elseif c>60 and c<=80 then
        print("学长");
    elseif c>50 and c<=60 then
        print("学渣");
    else
        print("学酥");--学酥本酥
    end
end





