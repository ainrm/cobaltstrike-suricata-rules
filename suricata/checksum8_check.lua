function init (args)
    local needs = {}
    needs["http.uri"] = tostring(true)
    return needs
end

function match(args)
    local uri_raw = tostring(args["http.uri"])
    local uri = string.sub(uri_raw, 2, -1) -- 去除uri中的"/"
    local sum = 0

    for i=1,#uri do
        local x = string.sub(uri,i,i)
        sum = sum + string.byte(x)
    end

    if (sum % 256) == 92 then
        return 1 -- 符合checksum8规则，匹配成功
    else 
        return 0 -- 不符合checksum8规则，匹配失败
    end
end
