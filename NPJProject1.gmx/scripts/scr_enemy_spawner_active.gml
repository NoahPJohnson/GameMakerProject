///Spawn Enemies
///Initialize Variables
//enemies_to_spawn_array[0] = obj_enemy;
//waves = 1;
//wave_sizes_array[0] = 1;
//enemies_active[0] = -1;
//time_between_spawns = 30;

//enemy_index = 0;]
if (!instance_exists(barrier))
   {
    instance_activate_object(barrier);
   }
if (i < waves)
   {
    //How many enemies are active? 
    enemies_active_count = 0;
    for (e = 1; e < array_length_1d(enemies_active_array); e ++)
        {
         if (enemies_active_array[e] != noone)
            {
             if (enemies_active_array[e].state == e_state.crash)
                {
                 enemies_active_array[e] = noone;
                }
             else
                {
                 enemies_active_count += 1;
                }
            }
        }
    //If there are no more active enemies, the wave advances
    if (enemies_active_count == 0 && started_spawning == true)
       {
        i += 1;
        started_spawning = false;
       }
    
        
    //If there are less enemies than the size of the wave, spawn more enemies
    if (i < waves)
       {
        if (enemies_active_count < wave_sizes_array[i])
           {       
            //show_debug_message("Enemies active = " + string(enemies_active_count) + " and Wave size = " + string(wave_sizes_array[i]));
            if (alarm[0] == -1)
               {
                //show_debug_message("Set spawn alarm. i = " + string(i) + " enemy index = " + string(enemy_index));
                alarm[0] = room_speed * (time_between_spawns/60);
               }
           }     
       }
   }
else
   {
    instance_destroy();
    //instance_destroy(obj_enemy_spawner_barrier);
    barrier.alarm[0] = room_speed * (60/60);
   }
//if (enemies_active.length == 0 && waves == 0) -> destroy?
