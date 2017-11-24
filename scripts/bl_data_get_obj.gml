/// bl_data_get_obj(table,objectId)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";
    
// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;
    
// Build query
var query = argument[0] + "/" + argument[1];

// Request
bl_action = 4; // For networking event
bl_request = http_request(bl_data+query,"GET",headers,"");

// Clearup
ds_map_destroy(headers);
