#define scr_movement
///Input Movement
key_R = keyboard_check(ord("D"));
key_L = -keyboard_check(ord("A"));
key_J = keyboard_check_pressed(vk_space);
key_J_held = keyboard_check(vk_space);



mve = key_L + key_R;

if (crouching = false && dashing = false)
   {
    hspd = mve * mspd * ((60/1000000) * delta_time);
   }

//Dashing 
scr_dash();
   
//Crouching
scr_crouching();
   
//Gravity   
if (vspd < 10) 
   {
    vspd += grv;
   }

//Direction      
if (mve = 1)
   {
    right = true;
   }

if (mve = -1)
   {
    right = false;
   }    

//Sliding
if (crouching = true)
   {
    if (key_J && right = true && sliding = false && sp > 45)
       { 
        sliding = true;
        sp -= 45;
        hspd = (jspd * 2.2);
        siframes = true;  
        if (alarm[9] = -1)
           { 
            alarm[9] = room_speed * (5/60);
            frc = 1;
           }
        state = states.sliding
       }
    
    if (key_J && right = false && sliding = false && sp > 45)
       { 
        sliding = true;
        sp -= 45;
        hspd = (-jspd * 2.2);
        siframes = true;  
        if (alarm[9] = -1)
           { 
            alarm[9] = room_speed * (5/60);
            frc = 1;
           }
        state = states.sliding
       }
   }
   
//Jumping
if (crouching = false)
   {
    if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && !place_meeting(x, y, obj_enemy))
       {
        vspd = key_J * -jspd;
        jumping = true;
       }     

    if (vspd < 0 && !key_J_held)
       {
        vspd = max(vspd,-jspd/4);
       }   
   }
if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && key_J = false)
   {
    jumping = false;
   }
   
//Bounce off Enemy
scr_player_bounce();
   
//Stamina
scr_stamina();
   
//Hit by Projectile   
scr_player_damage();  

//HP = 0
scr_zero_health();

//Collision            
scr_collision();  

//Swinging
///Input Swing
if (swinging = false && recovery = false && (place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)))
   { 
    if (keyboard_check_pressed(vk_numpad2))
       { 
        if (up = true)
           {
            up = true;
           }
        if (alarm[2] = -1)
           {
            alarm[2] = room_speed * (3/60);
           }
        dashing = false;
        state = states.swinging
       } 
   }
   
//Looking up/ Launcher
scr_looking_up();

//Swing in the Air
scr_jumping_swing(); 

#define scr_player_bounce
if (place_meeting(x, y+1, obj_enemy) && !place_meeting(x,y,obj_enemy))
   {
    enemy_bouncing_on = instance_place(x,y+1, obj_enemy)
    if (enemy_bouncing_on.state != e_state.crash)
       {
        vspd = -jspd;
        jumping = true;
       }
   }
if (vspd < 0 && !key_J_held)
   {
    vspd = max(vspd,-jspd/4);
   }