
hexagon_d = 10;
hexagon_x = 9;
hexagon_y = 5;
hexagon_h = 50; // centered

min_x = - 100;
max_x = 100;
min_y = -100;
max_y = 100;

wall_t = 5;

module to_hollowify(){
    
    import("hexasource.stl", convexity=10);
    
}

difference(convexity=10){
    to_hollowify();
    linear_extrude(h=hexagon_x, center=true,convexity=10){
        difference(){
            // hexagon array
            for(
                x=[min_x:hexagon_x*2:max_x], 
                y=[min_y:hexagon_y*2:max_y]
            ) translate([x, y, 0]) {
                circle(d=hexagon_d,  center=true, $fn=6);
                translate([hexagon_x, hexagon_y, 0]) circle(d=hexagon_d, center=true, $fn=6);
            }

            minkowski(){
                difference(){
                    translate([min_x, min_y, 0])
                        square([hexagon_x + max_x-min_x, hexagon_y + max_y-min_y]);
                    projection() to_hollowify();
                }
                circle(r=wall_t);
            }
        }
    }
}


color("green") translate([0, 150, 0]) to_hollowify();