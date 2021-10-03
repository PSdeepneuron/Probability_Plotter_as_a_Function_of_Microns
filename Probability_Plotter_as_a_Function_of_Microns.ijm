waitForUser("Ground truth", "Open the table containing the ground truth data,\nthen press OK.");
depth_microns1 = Table.getColumn("Distance_(microns)");
area_microns_1 = Table.getColumn("Gray_Value");
depth1 = lengthOf(area_microns_1);
normalised_gray_value1_array = newArray();
for (i=0;i<depth1;i++) {
	normalised_value = area_microns_1[i]/255;
	normalised_gray_value1_array = Array.concat(normalised_gray_value1_array,normalised_value); 
}
waitForUser("prediction", "Open the table containing the first prediction data,\nthen press OK.");
depth_microns2 = Table.getColumn("Distance_(microns)");
area_microns_2 = Table.getColumn("Gray_Value");
depth1 = lengthOf(area_microns_2);
normalised_gray_value2_array = newArray();
for (i=0;i<depth1;i++) {
	normalised_value = area_microns_2[i]/255;
	normalised_gray_value2_array = Array.concat(normalised_gray_value2_array,normalised_value); 
}

all_arrays = Array.concat(depth_microns1,depth_microns2);

Array.getStatistics(all_arrays, min, max, mean, stdDev);

Plot.create("Normalised_Probability_as_a_function_of_Distance_in_Microns", "distance (μm)", "Normalised probability");

Plot.setColor("red");
Plot.add("line", depth_microns1, normalised_gray_value1_array);
Plot.setColor("cyan");
Plot.add("line", depth_microns2, normalised_gray_value2_array);

Plot.setLimits(min,max,-0.1,1.25);
