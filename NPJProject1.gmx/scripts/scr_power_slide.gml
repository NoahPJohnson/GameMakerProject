///Power Slide
sliding = true;
siframes = true;
dashing = false;
drive = false;
charging = false;
chargeOne = false;
chargeTwo = false;
alarm[3] = -1;
alarm[4] = -1;
sprite_index = spr_player_crouching;

//Stamina
scr_stamina();

//Gravity
if (vspd < 10) 
   {
    vspd += grv;
   }

//Collision
scr_collision();

if (hspd > .2)
   {
    hspd -= .6;
   }
else if (hspd < -.2)
   {
    hspd += .6;
   }
else 
   {
    hspd = 0;
    siframes = false;
    sliding = false;
    sprite_index = spr_player;       
    state = states.normal
    mspd = mspd_normal;
   }
   
