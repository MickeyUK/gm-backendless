/// bl_file_delete(filepath)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";
    
// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Request
bl_action = 9; // For networking event
bl_request = http_request(bl_files+argument[0],"DELETE",headers,"");

// Clearup
ds_map_destroy(headers);
