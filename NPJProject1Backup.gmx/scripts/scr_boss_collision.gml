///Boss Collision
//Horizontal Collision
if (place_meeting(x+hspd,y,obj_boundary) || place_meeting(x+hspd,y,obj_enemy) || place_meeting(x+hspd,y,obj_player))
   {
    y_adj = 0;
    while (place_meeting(x+hspd,y-y_adj, obj_boundary) && y_adj <= abs(slope_mod*hspd))
          {
           y_adj += 1;
          }
    if (place_meeting(x+hspd,y-y_adj,obj_boundary))
       {
        y_adj = 0;
       }
    /*else if (place_meeting(x+hspd,y-y_adj,obj_enemy))
       {
        y_adj = 0;
       }*/
    else if (place_meeting(x+hspd,y-y_adj,obj_player))
       {
        y_adj = 0;
       }
    //Going Up Slope
    else 
       {
        y -= y_adj;
       }
    /*if (place_meeting(x+hspd,y,obj_enemy))
       {
        if (state != states.sliding)
           {
            while (!place_meeting(x+sign(hspd),y,obj_enemy))
                  {
                   x += sign(hspd);
                  }
            hspd = 0;
           }
       }*/    
    if (place_meeting(x+hspd,y,obj_player))
       {
        player_collision = instance_place(x+hspd,y, obj_player);
        //player_collision.x += hspd;
        
        var player_blocked = false;
        var reference_hspd = hspd;
        with (player_collision)
             {
              if (!place_meeting(x + reference_hspd,y,obj_boundary) && !place_meeting(x + reference_hspd,y,obj_boss_main_body) && !place_meeting(x + reference_hspd,y,obj_boss_claw) && !place_meeting(x + reference_hspd,y,obj_boss_weakpoint))
                 {
                  x += reference_hspd;
                 }
              else
                 {
                  player_blocked = true;
                 }
             }
        if (player_blocked == true)
           {
            while (!place_meeting(x+sign(hspd),y,obj_player))
                  {
                   x += sign(hspd);
                  }
            hspd = 0;
           }   
       }
    
    
    
    if (place_meeting(x+hspd,y,obj_boss_canister))
       {
        player_collision = instance_place(x+hspd,y, obj_boss_canister);
        //player_collision.x += hspd;
        
        var player_blocked = false;
        var reference_hspd = hspd;
        with (player_collision)
             {
              if (!place_meeting(x + reference_hspd,y,obj_boundary) && !place_meeting(x + reference_hspd,y,obj_boss_main_body) && !place_meeting(x + reference_hspd,y,obj_boss_claw) && !place_meeting(x + reference_hspd,y,obj_boss_weakpoint))
                 {
                  x += reference_hspd;
                 }
              else
                 {
                  player_blocked = true;
                 }
             }
        if (player_blocked == true)
           {
            while (!place_meeting(x+sign(hspd),y,obj_boss_canister))
                  {
                   x += sign(hspd);
                  }
            hspd = 0;
           }   
       }       
    else if (place_meeting(x+hspd,y,obj_boundary))
       {
        while (!place_meeting(x+sign(hspd),y,obj_boundary))
              {
               x += sign(hspd);
              }
        hspd = 0;
       }
   }

if (place_meeting(x,y-1,obj_player))
       {
        player_collision = instance_place(x,y-1,obj_player)
        //show_debug_message("There's a player on top while boss is moving horizontally.");
        var player_blocked = false;
        var reference_hspd = hspd;
        with (player_collision)
             {
              if (!place_meeting(x + reference_hspd,y,obj_boundary) && !place_meeting(x+reference_hspd,y,obj_enemy))
                 {
                  x += reference_hspd;
                 }
              else
                 {
                  player_blocked = true;
                  //show_debug_message("player is BLOCKED.");
                 }
             }
       }
//show_debug_message("Horizontal Speed = " + string(hspd));
   
x += hspd;


//Vertical Collision
/*if (place_meeting(x,y+vspd,obj_enemy))
   {
    if (state != states.sliding)
       {
        while (!place_meeting(x,y+sign(vspd),obj_enemy))
              {
               y += sign(vspd);
              }
        vspd = 0;
       }       
    
   }*/    
if (place_meeting(x,y+vspd,obj_player))
   {
    player_collision = instance_place(x,y+vspd, obj_player);
    //var player_blocked;
    //var reference_vspd;
    var player_blocked = false;
    var reference_vspd = vspd;
    with (player_collision)
         {
          if (!place_meeting(x,y + reference_vspd,obj_boundary) && !place_meeting(x,y + reference_vspd,obj_enemy))
             {
              y += reference_vspd;
             }
          else
             {
              player_blocked = true;
             }
         }
    if (player_blocked == true)
       {
        /*while (!place_meeting(x,y+sign(vspd),obj_player))
              {
               y += sign(vspd);
              }*/
        vspd = 0;
       }
    //player_collision.y += vspd;   
   }
   
if (place_meeting(x,y+vspd,obj_boss_canister))
   {
    player_collision = instance_place(x,y+vspd, obj_boss_canister);
    //var player_blocked;
    //var reference_vspd;
    var player_blocked = false;
    var reference_vspd = vspd;
    with (player_collision)
         {
          if (!place_meeting(x,y + reference_vspd,obj_boundary) && !place_meeting(x,y + reference_vspd,obj_enemy))
             {
              y += reference_vspd;
             }
          else
             {
              player_blocked = true;
             }
         }
    if (player_blocked == true)
       {
        /*while (!place_meeting(x,y+sign(vspd),obj_player))
              {
               y += sign(vspd);
              }*/
        vspd = 0;
       }
    //player_collision.y += vspd;   
   }
   

   
if (place_meeting(x,y+vspd,obj_boundary))
   {
    while (!place_meeting(x,y+sign(vspd),obj_boundary))
          {
           y += sign(vspd);
          }  
    vspd = 0;
   }   
    
//y += vspd; 



if (place_meeting(x,y-1,obj_player))
   {
    player_collision = instance_place(x,y-1, obj_player);
    //var player_blocked;
    //var reference_vspd;
    y += vspd; 
    var player_blocked = false;
    var reference_vspd = vspd;
    with (player_collision)
         {
          if (place_meeting(x,y + reference_vspd,obj_enemy))
             {
              /*while (!place_meeting(x,y+sign(reference_vspd),obj_enemy))
                    {
                     y += sign(reference_vspd);
                    }*/  
              reference_vspd = 0;
             }
          y += reference_vspd;
         }
    
   }
else
   {
    y += vspd; 
   }
   
   

//Going Down Slope
if ((!place_meeting(x,y+1,obj_boundary) && jumping = false))
   {
    y_adj = 1;
    while (!place_meeting(x,y+y_adj,obj_boundary) && y_adj <= abs(2*hspd) && jumping = false)
          {
           y_adj += 1;
          }
    if (place_meeting(x,y+y_adj,obj_boundary) && jumping = false && !place_meeting(x+hspd,y, obj_boundary) && !place_meeting(x+hspd,y, obj_enemy) && !place_meeting(x+hspd,y, obj_player))
       {
        y+=(y_adj-1)
       }
   }
