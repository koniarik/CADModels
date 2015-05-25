a = 100;
rod_d = 12;
nut_d = 22;
nut_h = 10;
thickness = 6;
width = 10;

$fn= 128;

difference(){

union(){
	cube([a, thickness, width], center=true);
	translate([0, a, 0]){
		cylinder(d=nut_d + thickness*2, h=width, center=true);
		translate([a/2  - 5, -7, 0]) cube([10, 10, width], center=true);
		translate([-a/2  + 5, -7, 0]) cube([10, 10, width], center=true);
	}
	translate([0, (a-thickness*2)/2, 0]) cube([a, a - thickness*2, width], center=true);
}


translate([a/2, (a - thickness*2.5)/2, 0]) cylinder(d=a - thickness*3, h=width +2, center=true);
translate([-a/2, (a - thickness*2.5)/2, 0]) cylinder(d=a - thickness*3, h=width +2, center=true);


translate([0, a, -width/2]) cylinder(d=nut_d, h=nut_h, $fn=6, center=true);

translate([0, a, 0]){
	cylinder(d=rod_d, h=width + 2, center=true);
	translate([a/2  - 12, -2, 0]) cylinder(r=10, h=width+2, center=true);
	translate([-a/2  + 12, -2, 0]) cylinder(r=10, h=width+2, center=true);
}

}

