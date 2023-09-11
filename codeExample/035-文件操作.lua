
--[[

    文件操作

    io.open (filename [, mode])

        r	只读方式打开，文件必须存在。
        w	只写方式打开，文件存在则删除原有内容，文件不存在则创建。
        a	追加方式打开，文件存在，则写入的数据会往最后追加，文件不存在则创建。
        r+	读写方式打开，文件必须存在。
        w+	读写方式打开，文件存在则删除原有内容，文件不存在则创建。
        a+	与a类似，但文件可读写。
        b	二进制模式，如果文件是二进制文件，可以加上b
        +	修饰符，表示对文件既可以读也可以写


    io.read()
        *n  读取一个数字
        *a  读取所有内容
        *l  默认值，读取下一行
        123 从当前位置开始，读取123个字符长度

    file:seek(whence, offset)

    whence
        set 从头开始
        cur 从当前位置开始
        end 从末尾开始


    file:seek() 无参数，返回的是当前位置



]]--


f1 = io.open("file/a.txt","r");
f2 = io.open("file/ab.txt","r");

for str in f1:lines() do
    print(str);
end
print("");
for str in io.lines("file/ab.txt") do
    print(str);
end

io.close(f1);
f2:close();


--[[
print(f1:seek());--0
print(f1:read());
print(f1:seek());--7
print(f1:seek("cur"));--迭代器指向的位置
print(f1:read());

print(f1:seek("end",-5));
print(f1:read());
--print(f1:seek("set"));
--print(f1:read());
]]--


--[[
print(f1:read());
print(f2:read());
print("");

print(f1:read());
print(f2:read());

print("");
print(f1:seek());
print(f2:seek());
f2:seek()
]]--

--[[
io.input(f1);
print(io.read());
io.input(f2);
print(io.read());
]]--



--[[
f1 = io.open("file/ab.txt","w+");

if f1 == nil then
    print("文件不存在");
    os.exit();
end

io.input(f1);--把f1 文件句柄输入到io(当前输入输出终端)

--io.write("AB");

io.output(f1);-- 把io的内容输出到 f1

io.write("123456");

print(io.read());
]]--

--io.write("ABCDEF");
--io.write("G");
--io.write("XY");


--print(io.read("*n"));
--print(io.read("l"));
--print(io.read(8));
--print("");
--print(io.read("*a"));
--[[
while true do
    str = io.read();
    if str == nil then
        break;
    end
    print(str);

end
]]--

--io.close(f1);

