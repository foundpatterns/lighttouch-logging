event: ["lighttouch_loaded"]
priority: 50
input_parameters: []

do return end -- Temporarily disable this action until we sort logs out
content.stores.incoming_request = "log/incoming-request/"
content.stores.outgoing_request = "log/outgoing-request/"
content.stores.outgoing_response = "log/outgoing-response/"
content.stores.incoming_response = "log/incoming-response/"
