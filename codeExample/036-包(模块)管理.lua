
local  tmpHelper = require("helper");
local  tmpHelper2 = require("file/helper2");

--找lua源文件和so 库
--print(package.path);
--print(package.cpath);

--package.path=package.path..";/tmp/?.lua";

--package.preload
--package.loaded;




for k,v in pairs(package.preload) do
    print(k,v);
end
print("");
for k,v in pairs(package.loaded) do
    print(k,v);
end








--print(package.path);

--package.path=package.path..";/tmp/?.lua";
--local test = require("test");

--print(package.path);
--print(test.id);

--os.exit();
--print("");

--[[
helper={
    getIp = function()
        return "192.168.1.1";
    end
}


print(helper.getIp(),tmpHelper.getIp(),tmpHelper2.getIp());
]]--