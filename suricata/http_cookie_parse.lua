require "rsa.lua"

function check_http (encrypted)
    local rsa_priv_key = [[-----BEGIN PUBLIC KEY-----
    MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCIrC7m1voi1zdsDhK/7vbQkxKjD21n9L09x1e4
    5Ot6K8rjZxEIAKNZScBicVfygjXvP077123ffX48EEJT+bFNJAWqKV1GB/8w6sUH7z7/DArbwujt
    xwF7zxCN8f5NAwFfD0+Wt0qet1tCzkFOR+7aXjzO2kOV3KX3XRgw9Vx4QwIDAQAB
    -----END PUBLIC KEY-----]]
    -- local encrypted = "aCU37svxXdiO9lk5k/QO/ZfH0dajYkt7GlM81thG6Ut82ouIF8m7mknLlczyf4A1IV7lEPvLHT+sxytbxozePs34KDhg7luxndiE/yzPGd3V6hb0VECGZ0XNIcNjKbReoWQNj9IbsJi97Sa5H0p0u8frx+3nvETmWH4CviF5Sgo="
    local priv, err = resty_rsa:new({ private_key = rsa_priv_key })
    local decrypted = priv:decrypt(encrypted)
    if decrypted then
        return 1
    else
        return 0
    end

function init (args)
    local needs = {}
    needs["http.request_cookie"] = tostring(true)
    return needs
end

function match(args)
    a = tostring(args["http.request_cookie"])
    if check_http(a) == 1 then
        return 1
    else
        return 0
    end
end
