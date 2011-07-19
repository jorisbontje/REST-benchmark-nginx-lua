local request_id = tonumber(ngx.var.id)

local res = ngx.location.capture("/backend/kyoto/get",
    { args = { key = request_id } }
)

if res.status ~= 200 then
    ngx.exit(res.status)
else
    ngx.say(res.body)
end
