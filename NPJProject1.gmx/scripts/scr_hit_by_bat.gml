if (place_meeting(x, y, obj_bat) && obj_bat.hit = false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    impetus = 13 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10) + (instance_exists(melee_hitbox) * 7);
    speed = (abs(speed) * hitdir) + (impetus * hitdir);
    direction = 0;
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);
    if (state != e_state.crash)
       {
        state = e_state.hitstun;
       }   
   }          

if (place_meeting(x, y, obj_bat_launcher) && obj_bat_launcher.hit = false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    impetus = 9 + (obj_player.chargeOne * 5) + (obj_player.chargeTwo * 10);
    speed = (abs(speed) * hitdir) + (impetus * hitdir);
    direction = 55 * hitdir;
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);    
    if (state != e_state.crash)
       {
        state = e_state.hitstun;
       }
   }          

if (place_meeting(x, y, obj_bat_spike) && obj_bat_spike.hit = false)
   {
    if (obj_player.right = true)
       {
        hitdir = 1; 
       }
    else
       {
        hitdir = -1;
       }
    if (hitstun = false && place_meeting(x,y+1, obj_boundary))
       {
        impetus = 8;
        speed = (abs(speed) * hitdir) + (impetus * hitdir);
        direction = 60 * hitdir;
       }
    else
       {
        impetus = 7;
        speed = (abs(speed) * hitdir) + (impetus * hitdir);
        direction = -60 * hitdir;
       }
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);
    if (state != e_state.crash)
       {
        state = e_state.hitstun;
       }
   }   
   
//Out of HP
scr_enemy_hp_zero();                
