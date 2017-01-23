/*if (place_meeting(x, y, obj_enemy) && iframes = false && siframes = false)
   {
    attacking_enemy = instance_place(x,y, obj_enemy)
    if (attacking_enemy.state != e_state.crash)
       {
        if (attacking_enemy.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 15;
        if (alarm[7] = -1)
           {
            alarm[7] = 7;   
           }
        knock_force = 8;
        state = states.knockback;    
       }
   }  */

if (place_meeting(x, y, obj_projectile) && iframes = false && siframes = false)
   {   
    projectile_meeting = instance_place(x,y, obj_projectile)
    if (projectile_meeting.struck = false)
       {
        if (projectile_meeting.x > x)
           {
            hitdir = -1;
           } 
        else
           {
            hitdir = 1;
           }
        hp -= 7;
        if (drive = false)
           {
            if (alarm[7] = -1)
               {
                alarm[7] = 7;   
               }
            knock_force = 4;
            state = states.knockback;
           }
        projectile_meeting.state = proj_state.destroyed;
       }    
   }       
