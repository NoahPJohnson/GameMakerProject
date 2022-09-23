boss_transition_timer = room_speed * (boss_transition_wait/60);

instance_create(view_xview[0]+(view_wview[0]/2),view_yview[0]+(view_hview[0]/2),boss_intro_text);
boss_intro_text.alarm[0] = boss_transition_timer;
boss_intro_display.image_speed = intro_animation_speed;

//Player Hitstop
obj_player.hitstop = false;
obj_player.damage_hitstop = false;
obj_player.alarm[11] = boss_transition_timer;
obj_player.old_state = obj_player.state;
obj_player.state = states.hitstop;

