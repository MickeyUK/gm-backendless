/// bl_data_get(table,limit,offset,sortBy,where)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;
    
// Build query
var query = argument[0];
if argument_count > 1 then query += "?pageSize="+string(argument[1]);
if argument_count > 2 then query += "&offset="+string(argument[2]);
if argument_count > 3 then query += "&sortBy="+string(argument[3]);
if argument_count > 4 then query += "&where="+url_encode(argument[4]);

// Request
bl_action = 3; // For networking event
bl_request = http_request(bl_data+query,"GET",headers,"");

// Clearup
ds_map_destroy(headers);
