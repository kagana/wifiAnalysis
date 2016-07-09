# wifiAnalysis
MATLAB code for coverage analysis of a WIFI router in your home or office. You can see wi-fi signal power at different locations.

I wrote this code for my own curiosity about wi-fi signals in my home. 

## Method
Signal source is the router and power levels drop due to the distance and walls. Power drop due to distance **r** is calculated by:
![]({{site.baseurl}}/f1.JPG)
You can simply substract power loss due to the walls. Walls have different attenuation properties, for example iron & glass walls and doors have much more obstruction than a simple brick wall. This difference was not taken into account. 
I used following coefficients for a generic router:
gama = 0.9;
dB0 = -40;
R = 1;

And attenuation due to a wall:

wallDrop = 3;

## Usage
Follow steps below:

### 1. Run getData1.m
You should see a plot window. Draw a sketch of your home by clicking lines. You should always click points next to eachother for drawing a wall. Jump points than restart clicking consecutive points if you want to make a space(door).




