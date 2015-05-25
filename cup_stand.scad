inner_d = 160;
t = 6;
rim_t = 6;

difference(){
	union(){
		for(x=[-inner_d/2-2:t:inner_d/2 +2], y=[-inner_d/2-2:t:inner_d/2+2]){
			if( sqrt(x*x + y*y) < inner_d/2){
				translate([x, y, t/2]) cube([t, t, t], center=true);
				translate([x, y, t/2  + rands(1, rim_t/2, 1)[0] ]) cube([t, t, t], center=true);
			}else if(sqrt(x*x + y*y) < inner_d/2 + t){
				translate([x, y, t/2 + rim_t/2]) cube([t, t, rim_t + t], center=true);
				translate([x, y, t/2  + rim_t/2 + rands(1, rim_t/2, 1)[0] ]) cube([t, t, t + rim_t], center=true);
			}
		}
		
	}
}
for(x=[-inner_d/2-2:t*2:inner_d/2 ], y=[-inner_d/2-2:t*2:inner_d/2]){
	if( sqrt(x*x + y*y) < inner_d/2 - t*2){
		translate([x, y, t + rim_t/2 - 1]) cube([t, t, rim_t + 2], center=true);
	}
}