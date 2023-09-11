

--[[

    在lua 标准库中，所有的内容，都有一个隐式的前缀 _G.
    _G 就是lua 中的全局环境变量，就是lua 的老祖宗，就是开天辟地的盘古
    _G 生而不local，一改就影响全局

    local _ENV 指定局部环境变量

]]


--[[
function func1()
    _G["os"]=nil;
    print(os);
end
]]--



--沙箱-沙盒-虚拟机-虚拟环境
--可以指定特有的环境变量
function func2(code)
    local rs,msg = load(code,"前端上传的代码有问题","bt",{print=_G.print});--预处理 的时候，环境变量中，只有一个print

    if rs == nil then
        print(msg);
        os.exit();
    end

    return pcall(rs);
end


function func3()
    local _ENV={print=print};-- setfenv(1,{os})
    print(os);
end


--print(os);
--func3();
--print(os);


--[[
print(_G.type);
print(os);

func1();
print(os);
]]--


--假设这个字符串是前端传过来的，现在要求你去当作代码执行

--str="print(123);os.remove('file/a.txt');print(os)";--这个代码是危险代码，因为会删文件
str="print(123);print(os)";

func2(str);--咋们肯定不能让它删文件