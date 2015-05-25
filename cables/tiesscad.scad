space_width = 10;
strip_width = 10;
strip_length = 100;
t1 = 0.3;
t2 = 1;
t3 = 3;

spacing = 1;

lines = 4;

module line(){

    difference(){
        hull(){
        translate([0, space_width/2 + strip_width, 0]) cylinder(r=space_width/2 + strip_width, h=t1);
        

        translate([0, strip_length - space_width/2 - strip_width, 0]) cylinder(r=space_width/2 + strip_width, h=t1);
        }
        
        hull(){
            translate([0, space_width/2 + strip_width, -1]) cylinder(r=space_width/2, h=t1+2);

            translate([0, strip_length - space_width/2 - strip_width, -1]) cylinder(r=space_width/2, h=t1+2);
        }
        
    }


    color("blue") hull(){
        translate([0, strip_width/2 - spacing, 0]) cylinder(d=strip_width - spacing*2, h=t3);
        translate([0, strip_width + strip_width/2 + spacing, 0]) difference(){
            cylinder(d=strip_width - spacing*2, h=t3);
            rotate([-90-45, 0, 0]) cylinder(d=strip_width, h= t3);
        }
    }

}

for (i=[-lines/2:lines/2]){
    translate([i*(space_width + strip_width),0 , 0]) line();
}