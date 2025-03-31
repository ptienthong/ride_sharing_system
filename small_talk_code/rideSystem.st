Object subclass: #SharingRideSystem
    instanceVariableNames: 'drivers riders driverQueue riderQueue'.

"Initialize ride-sharing system with empty collections"
SharingRideSystem >> initialize
    self drivers := Dictionary new.
    self riders := Dictionary new.
    self driverQueue := OrderedCollection new.
    self riderQueue := OrderedCollection new.
    Transcript show: 'SharingRideSystem created'; cr.

"Add a driver to the system and queue"
SharingRideSystem >> addDriver: driver
    self drivers at: driver driverID put: driver.
    self addDrivertoQueue: driver.

"Add a rider to the system and queue"
SharingRideSystem >> addRider: rider
    self riders at: rider riderID put: rider.
    self addRidertoQueue: rider.

"Add a driver to the queue"
SharingRideSystem >> addDrivertoQueue: driver
    self driverQueue add: driver.

"Add a rider to the queue"
SharingRideSystem >> addRidertoQueue: rider
    self riderQueue add: rider.

"Retrieve the next rider in the queue, or return nil if queue is empty"
SharingRideSystem >> getRider
    ^ self riderQueue isEmpty ifTrue: [nil] ifFalse: [self riderQueue removeFirst].

"Retrieve the next driver in the queue, or return nil if queue is empty"
SharingRideSystem >> getDriver
    ^ self driverQueue isEmpty ifTrue: [nil] ifFalse: [self driverQueue removeFirst].

"Create a ride based on the selected ride type (1 for Standard, else Premium)"
SharingRideSystem >> createRidePickup: pickup dropoff: dropoff distance: distance rideType: rideType
    ^ (rideType = 1)
        ifTrue: [StandardRide newRideWithPickup: pickup dropoff: dropoff distance: distance]
        ifFalse: [PremiumRide newRideWithPickup: pickup dropoff: dropoff distance: distance].
