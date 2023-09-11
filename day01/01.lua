a = 0
if a then
    print ('真')
else 
    print("假")
end

-- 只有 nil 或者 false 表示 假

info = {
    name = "jackie",
    age = 18,
    sex = false
}

print(type(info))

for key, value in pairs(info) do
print(key, "---", value)
end


info = {"1","bb", 123, false}
for key, value in pairs(info) do
    print(key, "---", value)
    
end
