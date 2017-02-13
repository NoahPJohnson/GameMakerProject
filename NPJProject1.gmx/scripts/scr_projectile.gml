///Projectile Normal
//Collision with Bat
if (place_meeting(x, y, obj_bat))
   {
    if (obj_player.right = true)
       { 
        if (instance_exists(obj_test))
           {
            target = instance_nearest(obj_player.x, obj_player.y, obj_test);
            enemy_targeted = instance_place(target.x,target.y, obj_enemy);         
            move_towards_point(enemy_targeted.x, enemy_targeted.y, 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10));
           }
        else
           {
            direction = 0; 
            speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
           }
       }
    else
       {
        if (instance_exists(obj_test))
           {
            target = instance_nearest(obj_player.x, obj_player.y, obj_test);
            enemy_targeted = instance_place(target.x,target.y, obj_enemy);         
            move_towards_point(enemy_targeted.x, enemy_targeted.y, 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10));
           }
        else
           {
            direction = 180;
            speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
           }
       }  
    state = proj_state.struck;
   }

   
//Collision with Launcher
if (place_meeting(x, y, obj_bat_launcher))
   {
    if (obj_player.right = true)
       { 
        if (instance_exists(obj_test))
           {
            target = instance_nearest(obj_player.x, obj_player.y, obj_test);
            enemy_targeted = instance_place(target.x,target.y, obj_enemy);         
            move_towards_point(enemy_targeted.x, enemy_targeted.y, 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10));
           }
        else
           {
            direction = 75;
            speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
           }
       }
    else
       {
        if (instance_exists(obj_test))
           {
            target = instance_nearest(obj_player.x, obj_player.y, obj_test);
            enemy_targeted = instance_place(target.x,target.y, obj_enemy);         
            move_towards_point(enemy_targeted.x, enemy_targeted.y, 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10));
           }
        else
           {
            direction = 105;
            speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
           }
       }  
    state = proj_state.struck;
   }


//Collision with Spike   
if (place_meeting(x, y, obj_bat_spike))
   {
    if (obj_player.right = true)
       { 
        if (instance_exists(obj_test))
           {
            target = instance_nearest(obj_player.x, obj_player.y, obj_test);
            enemy_targeted = instance_place(target.x,target.y, obj_enemy);         
            move_towards_point(enemy_targeted.x, enemy_targeted.y, 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10));
           }
        else
           {
            direction = 285;
            speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
           }
       }
    else
       {
        if (instance_exists(obj_test))
           {
            target = instance_nearest(obj_player.x, obj_player.y, obj_test);
            enemy_targeted = instance_place(target.x,target.y, obj_enemy);         
            move_towards_point(enemy_targeted.x, enemy_targeted.y, 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10));
           }
        else
           {
           direction = 255;
            speed = 15 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
           }
       }
    state = proj_state.struck;
   }  
        

//Collsion with Wall
if (place_meeting(x, y, obj_boundary) || place_meeting(x, y, obj_prop))
   {
    instance_destroy();
   }

//Collision with Crashed Enemy   
if (place_meeting(x, y, obj_enemy))     
   {
    crashed_enemy_meeting = instance_place(x, y, obj_enemy);
    if (crashed_enemy_meeting.state = e_state.crash)
       {
        instance_destroy();
       }
   }            
