Object subclass: #Rider
    instanceVariableNames: 'riderID name requestedRides'.

"Class method to create a new rider with a name"
Rider class >> newRiderWithName: name
    ^ self new initializeWithName: name; yourself.

"Instance method to initialize rider attributes"
Rider >> initializeWithName: name
    self name := name.
    "Assign a unique ID to the rider"
    self riderID := self class nextID.
    self requestedRides := OrderedCollection new.
    ^ self.

"Class method to generate unique rider ID"
Rider class >> nextID
    Smalltalk at: #RiderCounter ifAbsentPut: [0].
    Smalltalk at: #RiderCounter put: (Smalltalk at: #RiderCounter) + 1.
    ^ Smalltalk at: #RiderCounter.

"Allow a rider to request a ride and store it in requestedRides"
Rider >> requestRide: ride
    self requestedRides add: ride.
    Transcript show: 'Ride requested by rider: ', self name; cr.

"View all requested rides"
Rider >> viewRides
    Transcript show: 'Rides requested by ', self name, ':'; cr.
    self requestedRides isEmpty 
        ifTrue: [Transcript show: 'No rides requested.'; cr]
        ifFalse: [
            self requestedRides do: [:ride |
                ride rideDetails.
            ].
        ].

"Overriding printString to display the rider's name"
Rider >> printString
    ^ self name.
