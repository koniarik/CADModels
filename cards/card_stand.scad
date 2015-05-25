r1 = 10;
beta = 70;
alfa = 40;
gama = 65;
r2 = 15;
card_width = 60 + 2;
card_height = 30;
t = 2;

width = card_width - 2;

S1 = [0, r1];
X = [-cos(alfa)*r1, r1-sin(alfa)*r1];
S2 = [  (r1 + r2)*(X[0] - S1[0])/r1 + S1[0], (r1 + r2)*( X[1] - S1[1])/r1 + S1[1]];

L1 = [S1[0] - cos(90-beta)*(r1*2), S1[1] + sin(90-beta)*(r1*2)];

module tube(r, t, height){
    difference(){
        cylinder(r=r+t/2, h=height, center=true);
        cylinder(r=r-t/2, h=height + 2, center=true);
    }
}

module card_holder(){
    difference(){
        union(){
            translate([t, card_height/2 + t/2, 0])
                cube([t, card_height + t, width], center=true);
            translate([0, card_height/6, 0]) difference() {
                cube([t*3, card_height/3, width], center=true);
            }
        }
        translate([0, card_height/2 + t, 0])
            cube([t, card_height, card_width], center=true);
    }
}

$fn=128;

module holder(){
    difference(){
        translate([S1[0], S1[1] + t/2, 0]) tube(r1, t,width);
    linear_extrude(h=width, center=true)
        polygon(points=[
            S1,
            L1,
            [S1[0]-1000, S1[1]],
            S2
        ], lines=[[0,1,2,3]]);
    }

    difference(){
        translate([S2[0], S2[1] + t/2, 0]) tube(r2, t, width);
        translate([S2[0], S2[1], 0]) rotate([0, 0, asin((S1[1]-S2[1])/(r2+r1))]) hull() for(x=[-r2/2, r2*2]){
            translate([x, -r2/2, 0]) cylinder(r=r2/2, h=width + 2, center=true);
        }
        translate([0, -500, 0]) cube(1000, center=true);
    }

    translate([S1[0], S1[1], 0])
        rotate([0, 0, beta])
        translate([0, r1 + 3*t/2, 0])
        rotate([0, 0, -90])
            card_holder();

    translate([S2[0], S2[1], 0])
        rotate([0, 0, gama])
        translate([0, r2 + 3*t/2, 0])
        rotate([0, 0, -90])
            card_holder();
}

rotate([90, 0, 0]) holder();