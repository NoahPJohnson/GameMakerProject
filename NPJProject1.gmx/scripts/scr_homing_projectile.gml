///Homing Missle movement
//Collision with Bat
if (place_meeting(x, y, obj_bat))
   {
    //target_object = 
    //Projectile Hitstop
    if (alarm[0] == -1)
       {
        alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
       }
    if (obj_player.right == true)
       {
        struck_speed = 4 + (obj_player.chargeOne) + (obj_player.chargeTwo*2);
        struck_direction = 0;
        state = proj_state.hitstop;
       }
    else
       {
        struck_speed = 4 + (obj_player.chargeOne) + (obj_player.chargeTwo * 2);
        struck_direction = 180;
        state = proj_state.hitstop;
       }
    spark_index = 2;
    //Player Hitstop
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;  
        obj_player.state = states.hitstop;
       }   
   }

   
//Collision with Launcher
if (place_meeting(x, y, obj_bat_launcher))
   {
    //Projectile Hitstop
    if (alarm[0] == -1)
       {
        alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
       }
    if (obj_player.right = true)
       { 
        
        struck_speed = 4 + (obj_player.chargeOne) + (obj_player.chargeTwo * 2);
        struck_direction = 70;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * ((3 + (obj_player.chargeTwo*2))/60);
           }
        struck_speed = 4 + (obj_player.chargeOne) + (obj_player.chargeTwo * 2);
        struck_direction = 110;
        state = proj_state.hitstop;
       }
    spark_index = 2;
    //Player Hitstop
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;  
        obj_player.state = states.hitstop;
       }   
   }


//Collision with Spike   
if (place_meeting(x, y, obj_bat_spike))
   {
    //Projectile Hitstop
    if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
    if (obj_player.right = true)
       { 
        struck_speed = 4 + (obj_player.chargeOne) + (obj_player.chargeTwo * 2);
        struck_direction = 285;
        state = proj_state.hitstop;
       }
    else
       {
        struck_speed = 4 + (obj_player.chargeOne) + (obj_player.chargeTwo * 2);
        struck_direction = 255;
        state = proj_state.hitstop;
       }
    spark_index = 2;
   }
   
//Collision with Bunt   
if (place_meeting(x,y,obj_bunt_bat))
   {
    bunted = true;
    obj_player.sp -= 20;
    if (obj_player.right = true)
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 4;
        struck_direction = 55;
        state = proj_state.hitstop;
       }
    else
       {
        if (alarm[0] == -1)
           {
            alarm[0] = room_speed * (3/60);
           }
        struck_speed = 4;
        struck_direction = 125;
        state = proj_state.hitstop;
       }
    spark_index = 2;
    //Player Hitstop
    if (obj_player.state != states.hitstop)
       {
        obj_player.hitstop = false;
        obj_player.damage_hitstop = false;
        obj_player.alarm[11] = alarm[0];
        obj_player.old_state = obj_player.state;
        obj_player.state = states.hitstop;
       }  
   } 
        

//Collsion with Wall and Prop
if (place_meeting(x, y, obj_boundary) || place_meeting(x, y, obj_prop))
   {
    if (!place_meeting(x, y, obj_enemy_shield))
       {
        selected_hit_spark = instance_create(x,y,shot_hit_sparks[spark_index]);
        selected_hit_spark.image_angle = image_angle;
        instance_destroy();
       }
   }

//Collision with Crashed Enemy   
if (place_meeting(x, y, obj_enemy))     
   {
    crashed_enemy_meeting = instance_place(x, y, obj_enemy);
    if (crashed_enemy_meeting.state == e_state.crash)
       {
        selected_hit_spark = instance_create(x,y,shot_hit_sparks[spark_index]);
        selected_hit_spark.image_angle = image_angle;
        instance_destroy();
       }
   }
