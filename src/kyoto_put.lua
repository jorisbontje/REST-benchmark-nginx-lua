local request_id = tonumber(ngx.var.id)
local pattern = "\"id\": "..request_id..","

if not ngx.var.request_body then
    ngx.exit(400)
elseif string.match(ngx.var.request_body, pattern) then
    local res = ngx.location.capture("/backend/kyoto/set",
        { args = { key = request_id, val = ngx.var.request_body} }
    )
    ngx.exit(200)
else
    ngx.exit(409)
end
