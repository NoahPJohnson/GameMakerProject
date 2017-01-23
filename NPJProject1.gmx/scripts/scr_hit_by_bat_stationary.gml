if (place_meeting(x, y, obj_bat) && obj_bat.hit = false)
   {
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);  
   }          

if (place_meeting(x, y, obj_bat_launcher) && obj_bat_launcher.hit = false)
   {
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);    
   }          

if (place_meeting(x, y, obj_bat_spike) && obj_bat_spike.hit = false)
   {
    hp -= (1 + obj_player.chargeOne + obj_player.chargeTwo);
   }   
   
//Out of HP
scr_enemy_hp_zero();                
