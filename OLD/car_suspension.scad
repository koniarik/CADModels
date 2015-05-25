$fn=46;

part_thickness = 5;

screw_head_d = 6;
screw_wall_thickness = 5;
screw_d = 3;

h_screw_d = 16;

s_screw_offset = 8;
s_screw_z_offset = 2;
s_screw_d = 7;
s_screw_angle = 5;

f_screw_angle = 5;
f_screw_offset = 20;

module screw_hole(hole_d=40){
	rotate([180, 0, 0]) cylinder(d=screw_head_d, h=100, $fn=6);

	translate([0, 0, -1]) cylinder(d=screw_d, h=screw_wall_thickness + 2);

	translate([0, 0, screw_wall_thickness]) cylinder(d=hole_d, h=20);

}


translate([0, 0, 00]) difference(){
	hull(){
		for(i=[-1, 1]){
			translate([i*h_screw_d/2, 0, 0]) cylinder(d=8, h=part_thickness);
			translate([i*s_screw_d/2, s_screw_offset, 0]) rotate([0, i*s_screw_angle, 0]) rotate([0, 0, 30]) translate([0, 0, s_screw_z_offset]) cylinder(d=8, h=part_thickness);
		}

		translate([0, f_screw_offset, 0]) rotate([-f_screw_angle, 0, 0]) cylinder(d=8, h=part_thickness);
	}

	for(i=[-1, 1]){
		translate([i*h_screw_d/2, 0, 0]) screw_hole(8);
		translate([i*s_screw_d/2, s_screw_offset, 0]) rotate([0, i*s_screw_angle, 0]) rotate([0, 0, 30]) translate([0, 0, s_screw_z_offset]) screw_hole();
	}

	translate([0, f_screw_offset, 0]) rotate([-f_screw_angle, 0, 0]) translate([0, 0, 1]) screw_hole();

}


base_first_d = 40;
base_second_d = 36;
base_second_offset = 40;
base_third_d = 36;
base_third_offset = 30 + base_second_offset;
base_s_offset = 50;
base_s_z_offset = 4;

base_thickness = 5;
difference(){

		for(i=[-1, 1]){

			hull(){
				translate([i*base_first_d/2, 0, 0]) cylinder(d=6, h=base_thickness);
				translate([0, base_s_offset, 0]) cylinder(d=8, h=base_thickness+base_s_z_offset);
			}
			hull(){
				translate([i*base_second_d/2, base_second_offset, 0]) cylinder(d=6, h=base_thickness);
				translate([0, base_s_offset, 0]) cylinder(d=8, h=base_thickness+base_s_z_offset);
			}
			hull(){
				translate([i*base_third_d/2, base_third_offset, 0]) cylinder(d=6, h=base_thickness);
				translate([0, base_s_offset, 0]) cylinder(d=8, h=base_thickness+base_s_z_offset);
			}

		}


	for(i=[-1, 1]){

		translate([i*base_first_d/2, 0, 0]) screw_hole(8);
		translate([i*base_second_d/2, base_second_offset, 0]) screw_hole(8);
		translate([i*base_third_d/2, base_third_offset, 0]) screw_hole(8);

	}

	translate([0, base_s_offset, base_s_z_offset]) screw_hole();

}