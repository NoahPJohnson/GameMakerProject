///Handles all the ways boss can take damage or enter hitstop
//Hit by projectile
scr_boss_hit_by_projectile();

if (state != boss_state.hitstop)
   {
    with (weakpoint)
         {
          scr_boss_hit_by_projectile();
         }

    with (appendage)
         {
          scr_boss_hit_by_projectile();
         }
   } 

   
//Hit by bat
scr_boss_hit_by_bat();

if (state != boss_state.hitstop)
   {
    with (weakpoint)
         {
          scr_boss_hit_by_bat();
         }

    with (appendage)
         {
          scr_boss_hit_by_bat();
         }
   }

if (weakpoint.state == boss_state.hitstop && state != boss_state.hitstop)
   {
    saved_shot_timer = shot_timer;
    old_state = state;
    alarm[0] = weakpoint.alarm[0];
    damage_hitstop = weakpoint.damage_hitstop;
    state = boss_state.hitstop;
   }

if (appendage.state == boss_state.hitstop && state != boss_state.hitstop)
   {
    saved_shot_timer = shot_timer;
    old_state = state;
    alarm[0] = appendage.alarm[0];
    damage_hitstop = appendage.damage_hitstop;
    state = boss_state.hitstop;
   }
