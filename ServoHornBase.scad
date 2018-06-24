objectThickness = 3;
keyHoleRadius = 1.25;
keyFrameRadius = 6;
keyHoleDistance = 16;
servoHornHubRadius = 3;
//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-
$fn = 25;
translate ([-keyHoleDistance/2, 0, 0]){
	servoHornBase(keyHoleRadius, keyFrameRadius, keyHoleDistance, objectThickness, keyLength, keyStaffHeight, servoHornHubRadius);
}

//translate ([-keyHoleDistance/2, 10, 0]){
//	servoHornHole(objectThickness, servoHornHubRadius, keyHoleRadius, keyHoleDistance);
//}

module servoHornBase(holeRadius, outerRadius, differentialDistance, thickness, stalkLength, stalkOffshoot, hubRadius){
	// Make the handle. First create the outline, then subtract the oblong holes one at a time.
	difference(){
		translate([0,0,0]){
			keyHandle(outerRadius, differentialDistance, thickness);
		}
		translate([0.5*differentialDistance,0,0]){
			cylinder(thickness, hubRadius, hubRadius, center=true);
		}
		translate([0,0,0]){
			keyHole(holeRadius, differentialDistance, thickness);
		}
		translate([(differentialDistance-differentialDistance/3),0,0]){
			keyHole(holeRadius, differentialDistance, thickness);
		}
	}
}

module servoHornHole(thickness, hubRadius, holeRadius, differentialDistance){
	translate ([-differentialDistance/2, 0, 0]){
		translate([0.5*differentialDistance,0,0]){
			cylinder(thickness, hubRadius, hubRadius, center=true);
		}
		translate([0,0,0]){
			keyHole(holeRadius, differentialDistance, thickness);
		}
		translate([(differentialDistance-differentialDistance/3),0,0]){
			keyHole(holeRadius, differentialDistance, thickness);
		}
	}
}

//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-
module keyHandle(OD, offset, thickness){
	translate([0,0,0]){
		cylinder(thickness, OD, OD, center = true);
	}
	translate([offset,0,0]){
		cylinder(thickness, OD, OD, center = true);
	}
	translate([0.5*offset,0,0]){
		cube([offset,2*OD,thickness], center = true);
	}
}

module keyHole(ID, offset, thickness){
	translate([0,0,0]){
		cylinder(thickness, ID, ID, center = true);
	}
	translate([offset/3,0,0]){
		cylinder(thickness, ID, ID, center = true);
	}
	translate([offset/6,0,0]){
		cube([offset/3,2*ID,thickness], center = true);
	}
}

module boltHole(holeRadius, materialThickness){
	translate([0,0,0.5*materialThickness]){
		cylinder(materialThickness, holeRadius, holeRadius, center = true);
		translate([0,0,0.25*materialThickness]){
			cylinder(0.5*materialThickness, 2*holeRadius, 2*holeRadius, center = true);
		}
	}
}
