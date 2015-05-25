d = 36;
$fn=128;

difference(){
	union(){
		cylinder(d=100, h=4);
		cylinder(d=d+0.5+2, h=20);
		translate([0, 0, 20]) cylinder(d=d+2.5, h=60);
		translate([0, 0, 80]) cylinder(d=d - 1, h=20);
		translate([0, 0, 4]) cylinder(d=d+2.5+15*2, h=15);
	}
	cylinder(d=d - 0.5, h=20);
	translate([0, 0, 20]) cylinder(d1=d - 0.5, d2= d - 1- 2, h=60);
	translate([0, 0, 80]) cylinder(d=d-1-2, h=20);
	translate([0, 0, 4+15]) rotate_extrude(convexity = 10)
		translate([d/2+1.25+15, 0, 0])
			circle(r = 15); 

}