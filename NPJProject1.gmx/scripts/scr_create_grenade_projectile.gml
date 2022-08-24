///scr_create_grenade_projectile()    
    //x = Vx * frames
    //y = Vy * frames - (1/2 (0.8*frames^2))
    //x = speed * cos(direction) * frames
    //y = speed * sin(direction) * frames - (1/2)(0.8)(frames^2)
    //Vx = speed * cos(direction)
    //Vy = (speed * sin(direction)) - (0.8 * frames)
    //frames = (2*speed*sin(direction))/0.8
    //frames_to_reach_max_height = (speed * sin(direction))/0.8
    //ftrmh * 0.8 = speed * sin(direction)
    /*var firing_angle = point_direction(x,y,obj_player.x,obj_player.y);
    var firing_velocity = 15;
    var ftrmh = 0;
    var angle_found = false;
    for (i = 0; i < 25; i++)
        {
         firing_angle = point_direction(x,y,obj_player.x+(sign(obj_player.x-x)*48),obj_player.y);
         firing_velocity += 1;
         for (j = 1; j < 18; j++)
             {
              firing_angle += (sign(obj_player.x-x)*(5));
              if (sign(obj_player.x-x) < 0)
                 {
                  firing_angle = clamp(firing_angle,100,170);
                 }
              else
                 {
                  firing_angle = clamp(firing_angle,0,80);
                 }
              if (!collision_line(x,y,x+lengthdir_x(distance_to_object(obj_player),firing_angle),y+lengthdir_y(distance_to_object(obj_player),firing_angle),obj_boundary,false,false))
                 {
                  //instance_create(x+lengthdir_x(distance_to_object(obj_player),firing_angle),y+lengthdir_y(distance_to_object(obj_player),firing_angle),obj_test2);
                  //firing_angle = point_direction(x,y,obj_player.x-((j*(obj_player.x-x))/16),obj_player.y-160);
                  ftrmh = (firing_velocity * sin(firing_angle*(pi/180)))/0.8;
                  if (((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))) > abs((obj_player.y-160)-(y-32)))
                     {
                      angle_found = true;
                      //instance_create(obj_player.x-((j*(obj_player.x-x))/16),obj_player.y-96,obj_test2);
                      //instance_create(x+(firing_velocity*cos(firing_angle*(pi/180))*ftrmh),y-((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))),obj_test2);
                      show_debug_message(string((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))) + " > " + string(abs((obj_player.y-160)-(y-32))));
                      //show_debug_message("FTRMH = " + string(ftrmh));
                      show_debug_message("Break the loop");
                      break;
                     }
                  else
                     {
                      //instance_create(x+(firing_velocity*cos(firing_angle*(pi/180))*ftrmh),y-((firing_velocity * sin(firing_angle*(pi/180)) * ftrmh) - (0.5*0.8*power(ftrmh,2))),obj_test2);
                      //show_debug_message("Rejected firing angle = " + string(firing_angle) + " and velocity = " + string(firing_velocity));
                      //show_debug_message(string((firing_velocity * sin(firing_angle) * ftrmh) - (0.5*0.8*power(ftrmh,2))) + " <= " + string(abs((obj_player.y-64)-y)));
                     }
                 }
             }
         if (angle_found == true)
            {
             break;
            }
        }   
    show_debug_message("Firing Angle = " + string(firing_angle));
    show_debug_message("Firing Velocity = " + string(firing_velocity));
    if (angle_found == true)
       {
        projectile = scr_create_projectile(firing_velocity,firing_angle,x,y-32,obj_projectile_grenade);//instance_create(x,y-32, obj_projectile_grenade);
        if (instance_exists(obj_music_sfx_manager))
        {
            with (obj_music_sfx_manager) 
            {
                scr_prompt_sound(snd_enemy_grenade_pin_pull_SFX,other,false);    
            }
        }
       }
*/


var firing_angle = 50;
var firing_velocity = 15;

var target_y = -(obj_player.y - (y-32));
var target_x = abs((obj_player.x-(sign(obj_player.x-x)*98)) - x); //want the projectile to land just in front of the player
var target_direction = sign((obj_player.x-(sign(obj_player.x-x)*98)) - x);

var p_grv = 0.8;

var Gx_sqr = p_grv*power(target_x,2);
var v_sqr_y = power(firing_velocity, 2)*target_y;
var Gx = p_grv*target_x;

show_debug_message("Target x = " + string(target_x));
show_debug_message("Target y = " + string(target_y));
/*show_debug_message("Velocity^2 = " + string(power(firing_velocity,2)));
show_debug_message("Velocity^4 = " + string(power(firing_velocity,4)));
show_debug_message("Gx^2 = " + string(Gx_sqr));
show_debug_message("2v^2y = " + string(2*v_sqr_y));
show_debug_message("Gx = " + string(Gx));*/

//show_debug_message(">> " + string(power(firing_velocity,2)) + " + SQRT[ " + string(power(firing_velocity,4)) + " - -0.8 ( " + string(Gx_sqr) + " + " + string(2*v_sqr_y) + ") ] / " + string(Gx));
var value_to_sqrt = power(firing_velocity,4) - (p_grv * (Gx_sqr + 2*v_sqr_y));
if (value_to_sqrt < 0)
{
    return noone;
}
var value_to_arctan = (power(firing_velocity,2) + sqrt(value_to_sqrt))/Gx;
//show_debug_message("VALUE to arctan = " + string(value_to_arctan));

var firing_angle_radians = arctan(value_to_arctan);
firing_angle = firing_angle_radians*(180/pi);
show_debug_message("Firing angle = " + string(firing_angle));

if (target_direction < 0)
{
    firing_angle = 180 - firing_angle;
}

var max_height = (power(firing_velocity,2) * power(sin(firing_angle_radians),2))/(2*p_grv)
//Check a line ending at halfway from x to player x at the apex of the arc for collision
//show_debug_message("max height = " + string(max_height));
//instance_create(x+((target_direction*target_x)*0.5),y-max_height-56, obj_explosion_small);
//instance_create(x+(target_direction*target_x),obj_player.y, obj_explosion_small);
if (collision_line(x,y,x+((target_direction*target_x)*0.5),y-max_height-56,obj_boundary,false,false) || collision_line(x+((target_direction*target_x)*0.5),y-max_height-56,x+(target_direction*target_x),obj_player.y,obj_boundary,false,false))
{
    //If there is a collision, try the other angle
    show_debug_message("Try the shallow angle");
    value_to_arctan = (power(firing_velocity,2) - sqrt(value_to_sqrt))/Gx;
    var firing_angle_radians = arctan(value_to_arctan);
    firing_angle = firing_angle_radians*(180/pi);
    
    show_debug_message("Firing angle NUMBER 2 = " + string(firing_angle));
    
    if (target_direction < 0)
    {
        firing_angle = 180 - firing_angle;
    }
}

projectile = scr_create_projectile(firing_velocity,firing_angle,x,y-32,obj_projectile_grenade);//instance_create(x,y-32, obj_projectile_grenade);

//Play Pin Pull sound
if (instance_exists(obj_music_sfx_manager))
{
    with (obj_music_sfx_manager) 
    {
        scr_prompt_sound(snd_enemy_grenade_pin_pull_SFX,other,false);    
    }
}

