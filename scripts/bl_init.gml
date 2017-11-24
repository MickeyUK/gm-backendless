/// bl_init(app_id,rest_key)

// Credentials
bl_app_id = argument0; // Application ID
bl_secret = argument1; // REST Secret Key

// API URL
bl_base_url = "https://api.backendless.com/" + bl_app_id + "/" + bl_secret + "/";

// Operation endpoints
bl_users = bl_base_url + "users/";
bl_data = bl_base_url + "data/";
bl_files = bl_base_url + "files/";
bl_msg = bl_base_url + "messaging/";
bl_geo = bl_base_url + "geo/";

// Init
bl_request = noone; // Request ID
bl_action = -1; // Current action (for processing in HTTP event)
bl_token = ""; // Session token
