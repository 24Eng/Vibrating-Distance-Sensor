objectThickness = 2;
majorDiameter = 20;
infinity = majorDiameter*3;
interiorHeight = 24;
interiorWidth = 49;
interiorDepth = 12;
wireRadius = 2;
screwWingScale = 20;
screwWingHoleRadius = 2.6;
$fn = 25;

use <servoHornBase.scad>
use <distanceSensorFootPrint.scad>
use <screwWing.scad>
use <ssymbol.scad>

//body //body //body //body //body //body //body //body //body //body //body //body //body //body 

// The servoHornCam will attach to a servo motor mounted inside the enclosure
translate([0, -25, 0]){
//	servoHornCam();
}


translate ([0, 35, 0]){
	// The face is where the distance sensor will attach
	difference(){
		enclosureFace();
		distanceSensorFootPrint(objectThickness+1);
	}

	// The walls will be attached to the face to allow the servo to attach to the back abd
	// a hole will be added to pass power and servo wires.
	difference(){
		walls();
		translate([interiorWidth*(2/6),-(objectThickness + (interiorDepth/1) - 1),interiorDepth-wireRadius]){
			rotate([90,0,0]){
				powerHole();
			}
		}
	}
	// Add the little holey wings for inserting screws. These were taken from
	// the tea maker project and made into a module.
	translate([(interiorWidth/2 + objectThickness), 0, 0]){
		rotate([0,0,0]){
			screwWing(objectThickness, screwWingScale, screwWingHoleRadius);
		}
	}
	translate([-(interiorWidth/2 + objectThickness), 0, 0]){
		rotate([0,0,180]){
			screwWing(objectThickness, screwWingScale, screwWingHoleRadius);
		}
	}
	// A small riser is added on the inside between the ultrasonic transducers so
	// the devices sits level because there is a crystal mounted on the inside.
	difference(){
		translate([0,5,objectThickness+1]){
			cube([12,5,3.25], center = true);
		}
		distanceSensorFootPrint(10);
	}
}


translate([0,0,0]){
	// Make a new face like the distance sensor face.
	// This will be the back of the enclosure.
	// Add the ssymbol for style.
	difference(){
		enclosureFace();
		translate ([interiorWidth/4,0,-objectThickness/2-1]){
			rotate ([0,0,30]){		
				scale([0.25, 0.25, 1]){
					ssymbol();
				}
			}
		}
	}
	// Add the little holey wings for inserting screws. These were taken from
	// the tea maker project and made into a module.
	translate([(interiorWidth/2 + objectThickness), 0, 0]){
		rotate([0,0,0]){
			screwWing(objectThickness, screwWingScale, screwWingHoleRadius);
		}
	}
	translate([-(interiorWidth/2 + objectThickness), 0, 0]){
		rotate([0,0,180]){
			screwWing(objectThickness, screwWingScale, screwWingHoleRadius);
		}
	}
	// This will allow the servo to be mounted on the outside of the enclosure.
	translate([-interiorWidth/5, 0, objectThickness/2]){
		rotate([0,0,0]){
			servoMount();
		}
	}
	
}



//body //body //body //body //body //body //body //body //body //body //body //body //body //body

module servoMount(){
	servoBodyWidth = 23.5;
	servoBodyHeight = 12.5;
	servoBodyDepth = 16;
	servoClampWidth = 33;
	servoMountingHoleRadius = 0.75;
	mountingHoleDisplacement = 28/2;

	translate([0,0,servoBodyDepth/2]){
		difference(){
			translate([0, 0, 0]){
				cube([servoClampWidth,servoBodyHeight,servoBodyDepth], center = true);
			}
			translate([0, 0, 0]){
				cube([servoBodyWidth,servoBodyHeight+1, servoBodyDepth+1], center = true);
			}
			translate([mountingHoleDisplacement,0,0]){
				cylinder(infinity, servoMountingHoleRadius, servoMountingHoleRadius, center = true);
			}
			translate([-mountingHoleDisplacement,0,0]){
				cylinder(infinity, servoMountingHoleRadius, servoMountingHoleRadius, center = true);
			}
		}
	}
}

// The posts are the little tabs which are used to align with the front enclosure walls.
module posts(){
	cubeSide = 4;
	postHorizontalShift = (interiorWidth/2 - objectThickness + 1);
	postVerticalShift = (interiorHeight/2 - objectThickness + 1);
	postZShift = (cubeSide/2);
	translate([postHorizontalShift, postVerticalShift, postZShift]){
		cube([cubeSide, cubeSide, cubeSide], center = true);
	}
	translate([-postHorizontalShift, postVerticalShift, postZShift]){
		cube([cubeSide, cubeSide, cubeSide], center = true);
	}
	translate([postHorizontalShift, -postVerticalShift, postZShift]){
		cube([cubeSide, cubeSide, cubeSide], center = true);
	}
	translate([-postHorizontalShift, -postVerticalShift, postZShift]){
		cube([cubeSide, cubeSide, cubeSide], center = true);
	}
}

// This part will attach to the servo horn but off center so it can
// apply different pressure based on rotation. Spokes or something
// would look nice and take less plastic to print.
module servoHornCam(){
	difference(){
		translate([12-majorDiameter, 0, 0]){
			cylinder(objectThickness, majorDiameter, majorDiameter, center = true);
		}
		translate([0, infinity/2 - (15-majorDiameter), 0]){
			cube([infinity, infinity, objectThickness+1],center = true);
		}
		servoHornHole(objectThickness+1,3,1.25,16);
	}
}

// The front face will have holes for the ultrasonic distance sensor
module enclosureFace(){
	cube([interiorWidth + 2*objectThickness,interiorHeight + 2*objectThickness,objectThickness], center = true);
}
// Add walls for the front face.
module walls(){
	translate([0, (interiorHeight+objectThickness)/2, interiorDepth/2]){
		rotate([90,0,0]){
			cube([interiorWidth+2*objectThickness, interiorDepth, objectThickness], center = true);
		}
	}
	translate([0, -(interiorHeight+objectThickness)/2, interiorDepth/2]){
		rotate([90,0,0]){
			cube([interiorWidth+2*objectThickness, interiorDepth, objectThickness], center = true);
		}
	}
	translate([((interiorWidth+objectThickness)/2), 0, interiorDepth/2]){
		rotate([0,90,0]){
			cube([interiorDepth, (interiorHeight + objectThickness*2), objectThickness], center = true);
		}
	}
	translate([-((interiorWidth+objectThickness)/2), 0, interiorDepth/2]){
		rotate([0,90,0]){
			cube([interiorDepth, (interiorHeight + objectThickness*2), objectThickness], center = true);
		}
	}
}

// The power enters here
module powerHole(){
	cylinder(objectThickness+2, wireRadius, wireRadius, center = true);
	translate([0,wireRadius,0]){
		cube([2*wireRadius, 2*wireRadius,objectThickness+2], center = true);
	}
}