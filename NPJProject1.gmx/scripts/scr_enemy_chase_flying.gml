///Enemy Chase
speed = 0;
direction = 0;
    
if (!place_meeting(x+hspd,y+120, obj_boundary) && place_meeting(x+hspd,y-24, obj_boundary))
   {
    vspd = 2;
    //show_debug_message("Go DOWN.");
   }
else if (collision_line(x,y,x,y+200,obj_boundary,false,true) && !place_meeting(x+hspd,y-32, obj_boundary))
   {
    vspd = -2;
    //show_debug_message("Go up.");
   }
else if (!collision_line(x,y,x,y+220,obj_boundary,false,true))
   {
    vspd = 1;
    //show_debug_message("Too high, descend.");
   }
else
   {
    vspd = 0;
    //show_debug_message("Ok! Just bob up and down.");
   }
bob += room_speed * (0.2/60);
vspd += (sin(bob));
   


if (alarm[8] = -1)
   {
    if (obj_player.sliding == false)
       {   
        if (abs(obj_player.x - x) > 130 || obj_player.y < y+96)
           {
            if (abs((obj_player.x+180) - x) < abs((obj_player.x-180) - x))
               {
                dir = sign((obj_player.x+180) - x);
                //show_debug_message("direction = " + string(dir));
               }
            else
               {
                dir = sign((obj_player.x-180) - x);
                //show_debug_message("DIRECTION = " + string(dir));
               }
           }
       }
    if (firing == false)
       {
        hspd = dir * chsSpeed;
       }
   } 
if (alarm[0] = -1 && firing == false && alarm[7] == -1 && alarm[8] == -1)
   {
    if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,false) && !collision_line(x,y,obj_player.x,obj_player.y,obj_enemy,false,true))
       {
        alarm[0] = room_speed * ((firSpeed/60) / (1+first_shot));
        first_shot = false; 
       }
   }
   

   
/*if (dir == -1)
   {
    image_xscale = -1;
   }
else if (dir == 1)
   {
    image_xscale = 1;
   }*/
   
if (obj_player.state == states.knockback)
   {
    //vspd = 0;
    dir = 0;
    alarm[0] = -1; 
   }

  
//Valid Target
scr_enemy_targeted();
   
//Hit by the Bat   
scr_hit_by_bat();

//Hit by a Projectile
scr_hit_by_projectile();


//Collision
scr_collision();
