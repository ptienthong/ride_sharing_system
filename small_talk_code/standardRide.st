"Subclass representing a standard ride"
Ride subclass: #StandardRide
    instanceVariableNames: 'pickup_ dropoff_ distance_ rideID_' ;
    package: 'ShareRidingSystem'.

"Prevent default instantiation of StandardRide using 'new'"
StandardRide class >> new
    self error: 'Use newRideWithPickup:dropoff:distance: instead of new'.

"Class method to create a new StandardRide"
StandardRide class >> newRideWithPickup: pickup dropoff: dropoff distance: distance
    | newRide |
    newRide := self new.
    newRide initializeWithPickup: pickup dropoff: dropoff distance: distance.
    ^ newRide.

"Instance method to initialize a ride"
StandardRide >> initializeWithPickup: pickup dropoff: dropoff distance: distance
    super initializeWithPickup: pickup dropoff: dropoff distance: distance.
    ^ self.

"Calculate fare for standard ride based on distance"
StandardRide >> calculateFare
    ^ distance_ * 1.5.
