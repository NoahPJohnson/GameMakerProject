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
            crouching = false;
            charging = false;
            chargeOne = false;
            chargeTwo = false;
            alarm[3] = -1;
            alarm[4] = -1; 
            if (iframes = false)
               {
                if (alarm[8] = -1)
                   {
                    //Invincibility
                    iframes = true;
                    jumping = false;
                    sprite_index = spr_player_iframes;
                    alarm[8] = 15;
                    knock_force = 4;
                    state = states.knockback;
                   }
                //scr_movement();  
               }
           }
        projectile_meeting.state = proj_state.destroyed;
       }    
   }   

//Hit by melee attack   
if (place_meeting(x, y, obj_enemy_melee) && iframes = false && siframes = false)
   {   
    melee_meeting = instance_place(x,y, obj_enemy_melee);
    if (melee_meeting.x > x)
       {
        hitdir = -1;
       } 
    else
       {
        hitdir = 1;
       }
    hp -= 12;
    crouching = false;
    charging = false;
    chargeOne = false;
    chargeTwo = false;
    alarm[3] = -1;
    alarm[4] = -1; 
    if (iframes = false)
       {
        //Invincibility
        iframes = true;
        jumping = false;
        sprite_index = spr_player_iframes;
        if (alarm[8] = -1)
           {
            alarm[8] = 35;
           }
        //scr_movement();                  
       }
    knock_force = 6;
    state = states.knockback;
    melee_meeting.alarm[0] = 1;
   }              
