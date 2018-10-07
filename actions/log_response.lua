event: ["logResponse"]
priority: 1

local debug = require "debug"


local uuid_saved = debug.uuid_return()

local log_text = debug.print_res_info_return(req)
os.execute("mkdir -p logs/responses")
local log_file = io.open("logs/responses/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()                                
