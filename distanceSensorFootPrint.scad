transducerOffset = 26;
transducerRadius = 8.75;
screwRadius = 1.5;
screwHorizontalOffset = 40;
screwVerticalOffset = 15;

altScrewRadius = 0.9;
altScrewHorizontalOffset = 42.4;
altScrewVerticalOffset = 17.25;

crystalWidth = 11;
crystalHeight = 5;
crystalDistanceFromCenter = 7.5;

$fn = 20;
module distanceSensorFootPrint(thickness){
// Transducer holes
	translate([transducerOffset/2, 0, 0]){
		cylinder(thickness, transducerRadius, transducerRadius, center = true);
	}
	translate([-transducerOffset/2, 0, 0]){
		cylinder(thickness, transducerRadius, transducerRadius, center = true);
	}
	
	translate([0, crystalDistanceFromCenter, 0]){
		crystalCutout(crystalWidth, crystalHeight, thickness);
	}

// Screw holes with dimensions found online
//	translate([-screwHorizontalOffset/2, -screwVerticalOffset/2, 0]){
//		cylinder(thickness, screwRadius, screwRadius, center = true);
//	}
//	translate([screwHorizontalOffset/2, screwVerticalOffset/2, 0]){
//		cylinder(thickness, screwRadius, screwRadius, center = true);
//	}


// Screw holes with measured dimensions
	translate([altScrewHorizontalOffset/2, altScrewVerticalOffset/2, 0]){
		cylinder(thickness, altScrewRadius, altScrewRadius, center = true);
	}
//	translate([altScrewHorizontalOffset/2, -altScrewVerticalOffset/2, 0]){
//		cylinder(thickness, altScrewRadius, altScrewRadius, center = true);
//	}
//	translate([-altScrewHorizontalOffset/2, altScrewVerticalOffset/2, 0]){
//		cylinder(thickness, altScrewRadius, altScrewRadius, center = true);
//	}
	translate([-altScrewHorizontalOffset/2, -altScrewVerticalOffset/2, 0]){
		cylinder(thickness, altScrewRadius, altScrewRadius, center = true);
	}
}

module crystalCutout(width, height, depth){
	cube([width-height, height, depth], center = true);
	translate([(width/2)-height/2,0,0]){
		cylinder(depth, height/2, height/2, center = true);
	}
	translate([-((width/2)-height/2),0,0]){
		cylinder(depth, height/2, height/2, center = true);
	}
}

distanceSensorFootPrint(3);