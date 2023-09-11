--[[

    luasql  https://luarocks.org/

    brew install luarocks
    luarocks install luasql-mysql   注意此处，如果你是 mariadb，然后要求指定 MYSQL_DIR 参数的时候，
                                        千万不要指到 mariadb 的安装目录，而是要指到一个真正的mysql 安将目录
                                        那是不是不能用 mariadb 呢，也不是，要手动安装一遍

    luarocks install luasql-sqlite3
    luarocks install luasql-postgres
    luarocks install luasql-mysql
    luarocks install luasql-sqlite
    luarocks install luasql-odbc

]]--

local luasql = require("luasql.mysql");

client = luasql.mysql();

--创建连接
conn=client:connect("lua-test","root","12345678","127.0.0.1",3306); --数据库名，用户名，密码，IP，端口

if conn == nil then
    print("连接失败");
    os.exit();
end

--select
rs=conn:execute("select * from user_list order by id desc");

row = rs:fetch({},"a");

while row do

    print(row.id,row.name,row.age);

    row = rs:fetch(row,"a");

end

--insert
--rs=conn:execute("insert into user_list (name,age)values('def',456)");
--print(rs);

--update
rs=conn:execute("update user_list set name='DEF',age=789 where id<=4");
print(rs);

--delete
rs=conn:execute("delete from  user_list where id=4");
print(rs);

conn:close();
client:close();





























