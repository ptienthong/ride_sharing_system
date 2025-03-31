"Subclass representing a standard ride"
Ride subclass: #PremiumRide
    instanceVariableNames: 'pickup_ dropoff_ distance_ rideID_' ;
    package: 'ShareRidingSystem'.

"Prevent default instantiation of StandardRide using 'new'"
PremiumRide class >> new
    self error: 'Use newRideWithPickup:dropoff:distance: instead of new'.

"Class method to create a new PremiumRide"
PremiumRide class >> newRideWithPickup: pickup dropoff: dropoff distance: distance
    | newRide |
    newRide := self new.
    newRide initializeWithPickup: pickup dropoff: dropoff distance: distance.
    ^ newRide.

"Instance method to initialize a ride"
PremiumRide >> initializeWithPickup: pickup dropoff: dropoff distance: distance
    super initializeWithPickup: pickup dropoff: dropoff distance: distance.
    ^ self.

"Calculate fare for standard ride based on distance"
PremiumRide >> calculateFare
    ^ distance_ * 3.0.
