Object << #Ride
    slots: { #rideID. #pickup. #dropoff. #distance };
    package: 'ShareRidingSystem'.

"Class method to create a new ride (factory method)"
Ride class >> newRideWithPickup: pickup dropoff: dropoff distance: distance [
    ^ self new initializeWithPickup: pickup dropoff: dropoff distance: distance; yourself.
]

"Instance method to initialize ride details (constructor equivalent)"
Ride >> initializeWithPickup: pickup dropoff: dropoff distance: distance [
    self rideID: (self class nextID).
    self pickup: pickup.
    self dropoff: dropoff.
    self distance: distance.
    ^ self.
]

"Abstract method to calculate fare - subclasses must implement"
Ride >> calculateFare [
    self subclassResponsibility.
]

"Method to print ride details"
Ride >> rideDetails [
    Transcript show: 'Ride ID: ', self rideID printString; cr;
        show: 'Pickup: ', self pickup; cr;
        show: 'Dropoff: ', self dropoff; cr;
        show: 'Distance: ', self distance printString, ' miles'; cr;
        show: 'Fare: $', (self calculateFare) printString; cr.
]

"Class method to generate unique ride ID"
Ride class >> nextID [
    Smalltalk at: #RideCounter ifAbsentPut: [0].
    Smalltalk at: #RideCounter put: (Smalltalk at: #RideCounter) + 1.
    ^ Smalltalk at: #RideCounter.
]
