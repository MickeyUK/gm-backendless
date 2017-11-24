/// bl_data_save(table,body_map)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;
    
// Convert to JSON
var json = json_encode(argument[1]);

// Request
bl_action = 5; // For networking event
bl_request = http_request(bl_data+"/"+argument[0],"POST",headers,json);

// Clearup
ds_map_destroy(headers);
ds_map_destroy(argument[1]);
