///Movement between points
if (active == true)
   {
    
    hspd = dirX * moveSpeed;
    vspd = dirY * moveSpeed;
    //show_debug_message("dirX " + string(dirX) + " switchX " + string(switchSignX));
    //show_debug_message("dirY: " + string(dirY) + " switchY " + string(switchSignY));
    //show_debug_message("INDEX1 = " + string(pointsIndex));
    
    if ((dirX != sign((startingX+pointsXArray[pointsIndex]) - (x))) || (dirY != sign((startingY+pointsYArray[pointsIndex]) - (y))) || (dirX == 0 && dirY == 0))
       {
        //show_debug_message("Past point.");
        if (pointsIndex < array_length_1d(pointsXArray))
           {
            pointsIndex += (1*reverseFactor);
            //show_debug_message("increase index = " + string(pointsIndex)); 
            if (pointsIndex < 0 || pointsIndex >= array_length_1d(pointsXArray))
               {
                reverseFactor *= -1;
                
                pointsIndex += (1*reverseFactor);

                dirX = sign((startingX+pointsXArray[pointsIndex]) - x);
                dirY = sign((startingY+pointsYArray[pointsIndex]) - y);
                
                //show_debug_message("dirX " + string(dirX) + " switchX " + string(switchSignX));
                //show_debug_message("dirY: " + string(dirY) + " switchY " + string(switchSignY));
               }
           }
       }
   }
