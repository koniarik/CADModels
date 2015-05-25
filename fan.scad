a = 125; //  screw distance
b = 136; //fan outter diameter
c = 44; // fan inner diameter
d = 14; // space around screw
e = 4; // screw diameter
h = 3; // height

difference(){

hull(){
	translate([a/2, a/2, 0]) cylinder(d=d, h=h);
	translate([-a/2, a/2, 0]) cylinder(d=d, h=h);
	translate([-a/2, -a/2, 0]) cylinder(d=d, h=h);
	translate([a/2, -a/2, 0]) cylinder(d=d, h=h);
}


intersection(){

	for(i=[-5:4], y=[-8:7]) translate([i*16, y*10, 0]) {
		cylinder(d=10, h=10, center=true, $fn=6);
		translate([8, 5, 0]) cylinder(d=10, h=10, center=true, $fn=6);
	}

	difference(){
		cylinder(d=b, h=10, center=true);
		cylinder(d=c, h=100, center=true);
	}

}


translate([a/2, a/2, 0]) cylinder(d=e, h=10, center=true);
translate([-a/2, a/2, 0]) cylinder(d=e, h=10, center=true);
translate([-a/2, -a/2, 0]) cylinder(d=e, h=10, center=true);
translate([a/2, -a/2, 0]) cylinder(d=e, h=10, center=true);

}