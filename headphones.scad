//use <write.scad>;
rod_d = 9;
thickness = 3;

height = thickness + rod_d*2;

$fn=64;

module top() difference(){

	union(){
		difference(){
			cylinder(r=80, h=height, center=true);
			cylinder(r=62, h=height + 2, center=true);
			rotate([0, 0, 36]) translate([0, -100, 0]) cube(200, center=true);
			rotate([0, 0, -34.5]) translate([0, -100, 0]) cube(200, center=true);
		}

		writecylinder("HEADPHONES", [0,0, 0],90,0, face="top", h=20, t=30, font="orbitron.dxf");
	}

	rotate_extrude(convexity = 10)
		translate([129, 0, 0])
		circle(r = 50); 

	rotate([-90, 0, 0]) cylinder(d=rod_d, h=1000);

}


module bottom() {

	a = 16;
	steps = (130)/a;
	mini = 6;
	maxi = 50;
	size_step = (maxi-mini)/steps;

	difference(){

	union(){

	difference(){
		for(y=[-steps:steps], i=[-steps:steps]) translate([i*a, y*a, 0]) {
			if(sqrt((i*a)*(i*a) + (y*a)*(y*a)) < 134){
				cube([
					a,
					a, 
					rands(
						maxi - 5 - size_step*max(abs(i), abs(y)),
						maxi + 5 -size_step*max(abs(i), abs(y)),
					 1)[0]
				], center=true);
			}
		  }
		rotate([180, 0, 0])cylinder(r=200, h=100);	
	}

	cylinder(d=30, h=26);

	//translate([0, 0, 16]){
//		writecylinder("AC/DC", [0, 0, 0], 65, 0, face="top" ,h=30, t=20, font="orbitron.dxf");
//		rotate([0, 0, 180]) writecylinder("PAIN", [0, 0, 0], 65, 0, face="top" ,h=30, t=20, font="orbitron.dxf");
//	}
//	translate([0, 0, 10]){
//writecylinder("Deathstars", [0, 0, 0], 105, 0, face="top" ,h=30, t=16, font="orbitron.dxf");
//		rotate([0, 0, 180]) writecylinder("Apocalyptica", [0, 0, 0], 105, 0, face="top" ,h=30, t=16, font="orbitron.dxf");
//	}
//	translate([0, 0, 15/2]){
//
//		writecylinder("Guns N'Roses", [0, 0, 0], 140, 0, face="top" ,h=30, t=12, font="orbitron.dxf");
//		rotate([0, 0, 130]) writecylinder("Korpiklaani", [0, 0, 0], 140, 0, face="top" ,h=30, t=12, font="orbitron.dxf");
//		rotate([0, 0, 240]) writecylinder("Powerwolf", [0, 0, 0], 140, 0, face="top" ,h=30, t=12, font="orbitron.dxf");
//	}

	}
	cylinder(d=rod_d, h=50);

	}

}

bottom();
