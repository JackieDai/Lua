
--[[

    luarocks install luasocket         module 'socket' not found

    https://github.com/nrk/redis-lua

    最历害的是，用redis 去跑lua，分布式锁，限流，




]]--

local redis = require("redis");


local config={host="127.0.0.1",port=6379};
local client = redis.connect(config);


--原子操作
--eval "local val=redis.call('GET',KEYS[1]);if _G.tonumber(val)>0 then redis.call('DECR',KEYS[1]) end;return true" 1 test-key


local val=client.get('test-key');--1
if _G.tonumber(val) <1 then

    print("没有库存，抢完了");
    os.exit();
else
    client.decr('test-key');
end




--[[
info = client:info();

for k,v in pairs(info.clients) do
    print(k,v);
 end
 ]]--

print(client:get("test-key"));
--print(cliREADMEent:del("test-key"));

--print(client:set("test-key",456));

print(client:incr("test-key"));

print(client:get("test-key"));

for k,v in pairs(redis.commands) do
    print(k,v);
end

