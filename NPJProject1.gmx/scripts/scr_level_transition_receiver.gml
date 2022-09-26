var door_sender = noone;
with (obj_door_to_room)
{
      if (door_active == false)
      {
          door_sender = self;
      }
}
if (obj_checkpoint_manager.checkpoint_active == false)
{
    instance_create(view_xview[0], view_yview[0], obj_level_transition);
    if (!instance_exists(obj_player))
    {
        instance_create(x,y,obj_player);
        draw_curtain = true;
        room_transition_timer = room_speed * (room_transition_wait/60);
        //Player Hitstop
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = room_transition_timer;
        obj_player.old_state = states.normal;
        obj_player.state = states.hitstop;
        if (door_sender != noone)
        {
            obj_player.hp = door_sender.saved_player_hp;
            obj_scoring_manager.runs = door_sender.saved_player_points;
            door_sender.visible = false;
            instance_destroy(door_sender);
        }
    }
}
