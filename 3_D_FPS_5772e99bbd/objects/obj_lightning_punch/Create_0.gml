// Destroy the attack hit-box after 5 frames (adjust as needed for animation speed)
alarm[0] = 5;

// Prevent hitting the same enemy multiple times in a single punch
hit_list = ds_list_create();
damage = 2; // Set desired punch damage
