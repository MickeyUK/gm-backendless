/// bl_msg_email(to_list,subject,text,html,attachments_list)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Body
var body = ds_map_create();
    ds_map_add_list(body,"to",argument[0]);
    body[? "subject"] = argument[1];
    
// Message
var msg = ds_map_create();
    msg[? "textmessage"] = argument[2];
    
if (argument_count > 3) then msg[? "htmlmessage"] = argument[3];

ds_map_add_map(body,"bodyparts",msg);

// Attachments
if (argument_count > 4) {
    ds_map_add_list(body,"attachment",argument[4]);
    ds_list_destroy(argument[4]);
}

// Convert to JSON
var json = json_encode(body);

// Request
bl_action = 10; // For networking event
bl_request = http_request(bl_msg+"email","POST",headers,json);

// Clearup
ds_map_destroy(argument[0]);
ds_map_destroy(headers);
ds_map_destroy(body);
