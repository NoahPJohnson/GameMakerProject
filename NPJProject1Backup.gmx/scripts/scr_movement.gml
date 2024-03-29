#define scr_movement
///Input Movement
key_R = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0.55);
key_L = -(keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < -0.55));
key_J = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check(0, gp_face2);
key_J_held = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1) || gamepad_button_check(0, gp_face2);
key_Swing_Held = keyboard_check(vk_numpad2) || keyboard_check(vk_shift) || keyboard_check(vk_enter) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_face4);
key_Swing_Pressed = keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face3) gamepad_button_check_pressed(0, gp_face4);
key_Swing_Released = keyboard_check_released(vk_numpad2) || keyboard_check_released(vk_shift) || keyboard_check_released(vk_enter) || gamepad_button_check_released(0, gp_face3) || gamepad_button_check_released(0, gp_face4);


mve = key_L + key_R;
if (mve == -1)
   {
    image_xscale = -1;
   }
else if (mve == 1)
   {
    image_xscale = 1; 
   }

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
if (crouching == true)
{
    if (key_J && right == true && sliding == false && sp > 45)
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
        state = states.sliding;
        
        //Play slide sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_slide_SFX,other,false);    
            }
        }
    }
    
    if (key_J && right == false && sliding == false && sp > 45)
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
        
        //Play slide sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_player_slide_SFX,other,false);    
            }
        }
    }
}
   
//Jumping
if (crouching = false)
   {
    if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy) || place_meeting(x-(hspd*2), y+1, obj_boundary) || place_meeting(x-(hspd*2), y+1, obj_enemy)) && key_J == true)
       {
        vspd = key_J * -jspd;
        jumping = true;
       }     

    if (vspd < 0 && !key_J_held)
       {
        vspd = max(vspd,-jspd/4);
       }   
   }
if ((place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)) && key_J == false)
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
//scr_zero_health();

//Collision            
scr_collision();  

//Bunting
scr_bunt();

//Swinging
///Input Swing
if (crouching == false && swinging == false && recovery == false && state != states.hitstop && (place_meeting(x, y+1, obj_boundary) || place_meeting(x, y+1, obj_enemy)))
   { 
    if (key_Swing_Held)
       {
        show_debug_message("Switch to swing state."); 
        if (up == true)
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
/*if (place_meeting(x, y+1, obj_enemy) && !place_meeting(x,y,obj_enemy))
   {
    enemy_bouncing_on = instance_place(x,y+1, obj_enemy)
    if (enemy_bouncing_on.state != e_state.crash || enemy_bouncing_on.stopped == false)
       {
        vspd = -jspd;
        jumping = true;
       }
   }
if (vspd < 0 && !key_J_held)
   {
    vspd = max(vspd,-jspd/4);
   }*/