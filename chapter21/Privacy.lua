function newAccount (initialBalance)
    --利用作用域规则将 abc 隐藏起来
    local abc = {balance = initialBalance, LIM = 10000.00,}
    --extra 是私有函数
    local extra = function ()
        if abc.balance > abc.LIM then
            return abc.balance * 0.10
        else
            return 0
        end
    end
    --withdraw 在定义上也没有为 abc 参数留位置
    local withdraw = function (v)
        abc.balance = abc.balance - v
    end
    local deposit = function (v)
        abc.balance = abc.balance + v
    end
    local getBalance = function () return abc.balance + extra() end
    --只将访问性质为 public 的方法返回给用户
    return{
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance,
    }
end

acc1 = newAccount(100.00)
acc1.withdraw(40.00)
print(acc1.getBalance())