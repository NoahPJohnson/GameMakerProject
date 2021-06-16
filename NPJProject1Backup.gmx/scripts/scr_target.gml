if (enemy != noone)
   { 
    if (!place_meeting(x,y,obj_hit_cone))
       {
        instance_destroy();
       }

    if (target_state == e_state.crash)
       {
        instance_destroy();
       }

    if (target_state == e_state.hitstun)
       { 
        instance_destroy();
       } 

    hspd = enemy.hspd;
    vspd = enemy.vspd;

    speed = enemy.speed;
    direction = enemy.direction;
   }

else
   {
    instance_destroy()
   }

x += hspd;
y += vspd;       
