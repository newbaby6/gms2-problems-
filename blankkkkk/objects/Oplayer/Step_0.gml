//get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,Owall)) and (key_jump)
{	
    vsp = -7;
}

//horizontal collision
if (place_meeting(x+hsp,y,Owall))
{
      while (!place_meeting(x+sign(hsp),y,Owall))
	  {
	       x = x + sign(hsp);  
	  }
	  hsp = 0;
}
x = x + hsp;

//V collision
if (place_meeting(x,y+vsp,Owall))
{
      while (!place_meeting(x,y+sign(vsp),Owall))
	  {
	       y = y + sign(vsp);  
	  }
	  vsp = 0;
}
y = y + vsp;

//animation
if (keyboard_check(vk_right))
{    
	x += 3
    sprite_index = spradventurerRUN;
    image_xscale = 1; 
} 
else
if (keyboard_check(vk_left))
 {    
	 x -= 3
     sprite_index = spradventurerRUN;
     image_xscale = -1;
}
else
if (keyboard_check_pressed(vk_space))
 {   
	 y -= 3 
     sprite_index = spradventurerjump;
     image_xscale = 1;
 }
else
{
	sprite_index = spradventurerIDLE;
	
}	
