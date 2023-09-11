
--string 常用api

--string.find(s, pattern, init, plain)  在字符串s中 查找pattern(可以是表达式)，如果找到，则返回pattern 第一次出现的开始位置和结束位置,如果没找到，返回nil


str1="abcd1234";
--print(string.find(str1,"cd"));
--print(string.find(str1,"cd",3));--从指定位置处开始查找
--print(string.find(str1,"cd",-6));--如果是负数，则是从字符串长度+该负数的位置开始找

--print(string.find(str1,"%d",6));--最后一个参数，默认就是false，开启正则匹配模式
--print(string.find(str1,"(%d%d%d%d)"));
--print(string.find(str1,"%d",6,true));--最后一个参数，true 是直接当子串处理

str2="abcdcd1234cdcd";
print(string.gsub(str2,"cd","CD"));--全部替换
print(string.gsub(str2,"cd","CD",2));--最多替换两次



print(string.char(65));--asscii 码转字符,数字只能是0-255
print(string.char(65,66,67));

print(string.byte("a"));
print(string.byte("abc",1,3));


---string.gmatch()

--[[
str1="abcd";
str2=string.upper(str1);--转大写
print(str2);
print(string.lower(str2));--转小写

print(string.len(str1));--字符串长度
print(string.len("你好 lua"));--

print(string.reverse(str1));--反转

str3=789;
print("abc".."xyz"..str1..str2..123 ..456.56 ..str3..000);---连接符，number 如果在连接符左边，后面要空格

print("");
str4="abcd1234";
print(string.sub(str4,3,5));--截取，后面参数是开始位置和结束位置，结束位置可省略不写
print(string.sub(str4,-4,-2));--负数是从右往左数
]]--