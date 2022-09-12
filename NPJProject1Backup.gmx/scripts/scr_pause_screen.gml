if (pause_menu == true)
   {
    key_pause = keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start);
   }
else
   {
    key_pause = false;
   }

   
key_select_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) < -0.45 && stick_moved_up == false); 
key_select_up_held = keyboard_check(ord("W")) || keyboard_check(vk_up) || gamepad_button_check(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) < -0.45);
key_select_up_released = keyboard_check_released(ord("W")) || keyboard_check_released(vk_up) || gamepad_button_check_released(0, gp_padu) || (gamepad_axis_value(0, gp_axislv) >= -0.45 && stick_moved_up == true);
  
key_select_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.45 && stick_moved_down == false);
key_select_down_held = keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_button_check(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) > 0.45);
key_select_down_released = keyboard_check_released(ord("S")) || keyboard_check_released(vk_down) || gamepad_button_check_released(0, gp_padd) || (gamepad_axis_value(0, gp_axislv) <= 0.45 && stick_moved_down == true);

key_select_enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_face3);

if (key_select_down)
{
    show_debug_message("D O W N: axis = " + string(gamepad_axis_value(0, gp_axislv)) + " and already down = " + string(stick_moved_down) + " D-PAD = " + string(gamepad_button_check_pressed(0, gp_padd)));
}

if (gamepad_axis_value(0, gp_axislv) < -0.45 && stick_moved_up == false)
{
    stick_moved_up = true;
}
else if (gamepad_axis_value(0, gp_axislv) >= -0.45 && stick_moved_up == true)
{
    stick_moved_up = false;
}

if (gamepad_axis_value(0, gp_axislv) > 0.45 && stick_moved_down == false)
{
    stick_moved_down = true;
}
else if (gamepad_axis_value(0, gp_axislv) <= 0.45 && stick_moved_down == true)
{
    stick_moved_down = false;
}   

//back_button = keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(0, gp_face4);

if (key_pause)
{
    if (paused == false)
    {
        paused = true;
        instance_deactivate_all(true);
        instance_activate_object(obj_checkpoint_manager);
        instance_activate_object(obj_music_sfx_manager);
        for (i = 0; i < array_length_1d(button_array); i ++)
        {
             instance_create(view_xview[0]+(view_wview[0]/2), view_yview[0]+((view_hview[0]/2)-(128-(i*128))), button_array[i]);
        }
        button_array[starting_selected_button_index].button_selected = true;
        
        //Pause Looping Sounds
        if (audio_is_playing(snd_charging_level1_SFX))
        {
            audio_pause_sound(snd_charging_level1_SFX);
        }
        if (audio_is_playing(snd_charging_level2_SFX))
        {
            audio_pause_sound(snd_charging_level2_SFX);
        } 
    }
    else
    {
        paused = false;
        for (i = 0; i < array_length_1d(button_array); i ++)
        {
             instance_destroy(button_array[i]);
        }
        instance_activate_all();
        
        //Resume Looping Sounds
        if (audio_is_paused(snd_charging_level1_SFX))
        {
            audio_resume_sound(snd_charging_level1_SFX);
        }
        if (audio_is_paused(snd_charging_level2_SFX))
        {
            audio_resume_sound(snd_charging_level2_SFX);
        } 
    }
}
   
if (paused == true || pause_menu == false)
   {
    //Select up
    if (key_select_up)
       {
        show_debug_message("Select UP.");
        selected_button_index -= 1;
        if (selected_button_index < 0)
           {
            selected_button_index = array_length_1d(button_array) - 1;
           }
        for (i = 0; i < array_length_1d(button_array); i++)
            {
             button_array[i].button_selected = false;
            }
        button_array[selected_button_index].button_selected = true;
        
        //Play select sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_menu_select_SFX,other,false);    
            }
        } 
       }
    //Select down
    if (key_select_down)
       {
        //show_debug_message("Select down.");
        selected_button_index += 1;
        if (selected_button_index > array_length_1d(button_array) - 1)
           {
            selected_button_index = 0;
           }
        for (i = 0; i < array_length_1d(button_array); i++)
            {
             button_array[i].button_selected = false;
            }
        button_array[selected_button_index].button_selected = true;
        
        //Play select sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_menu_select_SFX,other,false);    
            }
        } 
       }
    //Hit enter on selected button   
    if (key_select_enter)
       {
        //Play confirm sound
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_menu_confirm_SFX,other,false);    
            }
        } 
       
        //show_debug_message("Enter!");
        script_execute(button_array[selected_button_index].button_script);
       }
    //Hit back button
    /*if (back_button)
       {
        script_execute(scr_menu_button_back_script());
       }*/
   }
