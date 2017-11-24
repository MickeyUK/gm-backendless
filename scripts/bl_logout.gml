/// bl_logout(session_token)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// Session token
var token;
if (argument_count > 0) {
    headers[? "user-token"] = argument[0];
} else {
    headers[? "user-token"] = bl_token;
}

// Request
bl_action = 2; // For networking event
bl_request = http_request(bl_users+"logout","POST",headers,"");

// Clearup
ds_map_destroy(headers);
bl_token = "";
