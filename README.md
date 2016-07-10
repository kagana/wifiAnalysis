# wifiAnalysis
MATLAB code for coverage analysis of a WIFI router in your home or office. You can see wi-fi signal power at different locations.

I wrote this code for my own curiosity about wi-fi signals in my home. 

## Method
Signal source is the router and power levels drop due to the distance and walls. Power drop due to distance **r** is calculated by:

![](/f1.JPG?raw=true "")

You can simply substract power loss due to the walls. Walls have different attenuation properties, for example iron & glass walls and doors have much more obstruction than a simple brick wall. This difference was not taken into account. 
I used following coefficients for a generic router:
gama = 0.9;
dB0 = -40;
R = 1;

And attenuation due to a wall:

wallDrop = 3;

## Usage
Follow the two steps below:

### 1. Run getData1.m
You should see a plot window. Draw a sketch of your home by clicking lines. You should always click points next to eachother for drawing a wall. Jump points than restart clicking consecutive points if you want to make a space(door).
You can save **ldata** if you want to save your sketch.

Interestingly, if you click the exact point, it is harder to draw. This could be a bug of MATLAB. Click a very close point to the point you want to select if feel it hard.

Here is a simple sketch of my house in Istanbul.

![](/sketch1.jpg)

### 2. Run evalData.m
This will ask you coordinates of the router. Enter x and y coordinates.

![](/enterData.JPG)

You should see the results. Colorbar unit is dB.

![](/res1.JPG)


Just rerun evalData to make a new analysis with new coordinates.

My living room was suffering from low signal power. I decided to make a change. New location enlarges the coverage, so I can update my PS3 :)

![](/res2.jpg)

I checked different locations against signal power level using a wi-fi signal level meter android application on my mobile phone and satisfied. 

## Modifications
You can change wall attenuation, router signal levels. You can define finer grids as your needs. Just dig the code a little bit.

## Thanks
I used InterX function from MATLAB file exchange to find intersection points of two lines. [InterX](https://www.mathworks.com/matlabcentral/fileexchange/22441-curve-intersections/content/InterX.m) Thank you NS. 


