# Leap_Motion_To_DMX
This was a sample software for converting leap motion gestures to DMX output using Titan Tubes as the designated output

This program was designed to utilize the spacial readout from a Leap Motion controller and map it onto a series of effects that were designed to test how a person might ineract with a kiosk that could control the ouput of some light fixtures. 

Usage: 
This program uses the DMX P512 library to output via a Enttec DMX USB Pro module. You will have to change the dmxport string in the LeapAndDMX.pde file to whatever your device is labeled by your operating system. 

This program was built using the profile for a Titan Tube, which has a particular DMX output profile. You will have to change that if you are using any other light fixture. 

This program uses keyboard input to change between effects. Check the LeapAndDMX.pde file to find where the keyboard input maps to. 

This program is free to use, given appropriate attribution. 
