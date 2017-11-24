/// bl_login(email,password)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";
    
// Body
var body = ds_map_create();
    body[? "login"] = argument0;
    body[? "password"] = sha1_string_unicode(argument1);
    
// Convert to JSON
var json = json_encode(body);

// Request
bl_action = 1; // For networking event
bl_request = http_request(bl_users+"login","POST",headers,json);

// Clearup
ds_map_destroy(headers);
ds_map_destroy(body);
