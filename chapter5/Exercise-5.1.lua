sunday = "monday"
monday = "sunday"

--sunday_1 = "monday" 相当于定义了一个结构体的成员变量 sunday_1，其值为 "monday"
--[sunday] = monday 相当于 ["monday"] = "sunday"
t = {sunday_1 = "monday", [sunday] = monday}

-- t.sunday_1 将 t 视为结构体，并访问 t 中变量名为 sunday_1 的成员变量
-- t[sunday] 将 t 视为表格，并利用 sunday 的值作为下表访问对象
print(t.sunday_1, t["monday"], t[t.sunday_1])

