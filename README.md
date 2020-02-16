# Spothole

This app is meant ease the process of finding potholes and repairing them.
Using this app anyone can report a pothole to the concerned authorities which can then be used to start the repair work.

The ML model in the app first detects if the image contains any pothole or not. If it detects any pothole in the image clicked by the user, the current location of the user is sent to the concerned authorities. This way it prevents users from spamming images of random stuff.

### The ML model:
We used SSD Mobilenet due to its low latency for mobile deivces. 
We trained the model over a dataset of 600 images that was self annotated.