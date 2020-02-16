# Spothole

This app is meant ease the process of finding potholes and repairing them.
Using this app anyone can report a pothole to the concerned authorities which can then be used to start the repair work.

The ML model in the app first detects if the image contains any pothole or not. If it detects any pothole in the image clicked by the user, the current location of the user is sent to the concerned authorities. This way it prevents users from spamming images of random stuff.

Once a pothole is repaired, the authorities can mark the pothole as repaired and the users can later check if the reported pothole is repaired or not.

### The ML model:
We used SSD Mobilenet due to its low latency for mobile deivces. 
We trained the model over a dataset of 600 images that was self annotated.

The trained tflite model can be found [here](https://github.com/mayan-sharma/SIH/blob/master/assets/Model/model.tflite).

## Future Scope:
We plan on adding a feature so that every user can see the location of all the potholes in the area, and hence choose a better route for their travel.