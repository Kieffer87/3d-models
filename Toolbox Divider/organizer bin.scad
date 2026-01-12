// Toolbox Drawer Organizer
// All dimensions in mm
// Build plate: 256 x 256 mm


// ===== CONFIGURABLE PARAMETERS =====

/* [External Dimensions] */
External_Width = 4; // .125
External_Depth = 3.15; // .125
External_Height = 2; // .125

/* [Thickness] */
Wall_Thickness = 3; // Wall thickness (mm)
Base_Thickness = 3; // Base thickness (mm)

/* [Corner Radius] */
Corner_Radius = 2; // Corner radius (mm)

// ===== CONVERT INCHES TO MM =====
calculated_bin_width = External_Width * 25.4;
calculated_bin_depth = External_Depth * 25.4;
calculated_bin_height = External_Height * 25.4;

// ==== CALCULATE INNER DIMENSIONS ====
calculated_inner_width = calculated_bin_width - (2 * Wall_Thickness); // Inner width (mm)
calculated_inner_depth = calculated_bin_depth - (2 * Wall_Thickness); // Inner depth (mm)
calculated_inner_height = calculated_bin_height - Base_Thickness; // Inner height (mm)


/* [Hidden] */
// Fragment count for smooth curves
$fn = 30; // Fragment count




// ===== MAIN ORGANIZER BIN =====
difference() {
    // Outer box with rounded corners using minkowski sum
    minkowski() {
        cube([calculated_bin_width - 2*Corner_Radius, calculated_bin_depth - 2*Corner_Radius, calculated_bin_height - Corner_Radius]);
        sphere(r=Corner_Radius);
    }
    
    // Inner cavity with rounded corners
    translate([Wall_Thickness, Wall_Thickness, Base_Thickness])
        minkowski() {
            cube([calculated_inner_width - 2*Corner_Radius, calculated_inner_depth - 2*Corner_Radius, calculated_inner_height - Corner_Radius + 1]);
            sphere(r=Corner_Radius);
        }
}
