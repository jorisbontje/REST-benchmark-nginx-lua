local request_id = tonumber(ngx.var.id)

local res = ngx.location.capture("/backend/redis/get",
    { args = { key = request_id } }
)

if res.status ~= 200 then
    ngx.exit(res.status)
elseif res.body == "$-1\r\n" then
    ngx.exit(404)
else
    local s, e = string.find(res.body, "\r\n", 1, true)
    local length = tonumber(string.sub(res.body, 2, s))
    local body = string.sub(res.body, e + 1, e + 1 + length)
    ngx.say(body)
end
