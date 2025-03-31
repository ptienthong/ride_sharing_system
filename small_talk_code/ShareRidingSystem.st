Object subclass: #Driver
	instanceVariableNames: 'driverID_ name_ rating_ assignedRides_'
	classVariableNames: ''
	package: 'ShareRidingSystem'!

!Driver methodsFor: 'initialization' stamp: '3/31/2025 15:54'!
initializeWithName: name rating: rating
    name_ := name.
    rating_ := rating.
    driverID_ := self class nextID.
    assignedRides_ := OrderedCollection new.
	 Transcript show: 'Driver: ', name_, ' is created' ; cr.
	 Transcript show: '-----------------------------'; cr.
    ! !


!Driver methodsFor: 'adding' stamp: '3/31/2025 15:54'!
addRide: ride
    assignedRides_ add: ride.
    Transcript show: 'Ride added to driver: ', name_; cr.
	 Transcript show: '-----------------------------'; cr.! !


!Driver methodsFor: 'as yet unclassified' stamp: '3/31/2025 16:12'!
getDriverInfo
    Transcript show: '[INFO] Driver ID: ', driverID_ printString; cr.
    Transcript show: 'Name: ', name_; cr.
    Transcript show: 'Rating: ', rating_ printString; cr.
    Transcript show: 'Assigned Rides: ', assignedRides_ size printString; cr.
    Transcript show: '-----------------------------'; cr.! !

!Driver methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:34'!
getID
	^ driverID_.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Driver class
	instanceVariableNames: ''!

!Driver class methodsFor: 'instance creation' stamp: '3/30/2025 23:23'!
newDriverWithName: name rating: rating
    ^ self new initializeWithName: name rating: rating; yourself.! !


!Driver class methodsFor: 'as yet unclassified' stamp: '3/31/2025 01:26'!
nextID
    Smalltalk at: #DriverCounter ifAbsentPut: [1].
    Smalltalk at: #DriverCounter put: (Smalltalk at: #DriverCounter) + 1.
    ^ Smalltalk at: #DriverCounter.! !


!Driver class methodsFor: 'initialization' stamp: '3/31/2025 15:53'!
resetDriverCounter
    Smalltalk at: #DriverCounter put: 1.
! !


Object subclass: #Rider
	instanceVariableNames: 'riderID_ name_ requestedRides_'
	classVariableNames: ''
	package: 'ShareRidingSystem'!

!Rider methodsFor: 'initialization' stamp: '3/31/2025 16:09'!
initializeWithName: name
    name_ := name.
    "Assign a unique ID to the rider"
    riderID_ := self class nextID.
    requestedRides_ := OrderedCollection new.  
	 Transcript show: 'Rider: ', name_, ' is created' ; cr.
	 Transcript show: '-----------------------------'; cr.
	 ! !


!Rider methodsFor: 'as yet unclassified' stamp: '3/31/2025 16:09'!
requestRide: ride
    requestedRides_ add: ride.
    Transcript show: 'Ride requested by rider: ', name_; cr.
	 Transcript show: '-----------------------------'; cr.! !

!Rider methodsFor: 'as yet unclassified' stamp: '3/31/2025 16:12'!
viewRides
    requestedRides_ isEmpty 
        ifTrue: [Transcript show: 'No rides requested.'; cr]
        ifFalse: [
    			Transcript show: '[INFO] Rides requested by ', name_, ':'; cr.        
				requestedRides_ do: [:ride |
                ride rideDetails.
            ].
        ].! !

!Rider methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:34'!
getID 
	^ riderID_.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Rider class
	instanceVariableNames: ''!

!Rider class methodsFor: 'instance creation' stamp: '3/31/2025 14:19'!
newRiderWithName: name
    ^ self new initializeWithName: name; yourself.! !


!Rider class methodsFor: 'as yet unclassified' stamp: '3/31/2025 01:26'!
nextID
    Smalltalk at: #RiderCounter ifAbsentPut: [1].
    Smalltalk at: #RiderCounter put: (Smalltalk at: #RiderCounter) + 1.
    ^ Smalltalk at: #RiderCounter.! !


!Rider class methodsFor: 'initialization' stamp: '3/31/2025 15:55'!
resetRiderCounter
    Smalltalk at: #RiderCounter put: 1.
! !


Object subclass: #SharingRideSystem
	instanceVariableNames: 'driverQueue_ riderQueue_'
	classVariableNames: ''
	package: 'ShareRidingSystem'!

!SharingRideSystem methodsFor: 'initialization' stamp: '3/31/2025 16:10'!
initialize
    driverQueue_ := OrderedCollection new.
    riderQueue_ := OrderedCollection new.
    Transcript show: 'SharingRideSystem created'; cr.
	 Transcript show: '-----------------------------'; cr.! !


!SharingRideSystem methodsFor: 'adding' stamp: '3/31/2025 16:09'!
addDriver: driver
    self addDrivertoQueue: driver.
	 Transcript show: 'Added driver to queue'; cr.
	 Transcript show: '-----------------------------'; cr.! !

!SharingRideSystem methodsFor: 'adding' stamp: '3/31/2025 16:10'!
addRider: rider
    self addRidertoQueue: rider.
	 Transcript show: 'Added rider to queue'; cr.
	 Transcript show: '-----------------------------'; cr.! !

!SharingRideSystem methodsFor: 'adding' stamp: '3/30/2025 23:36'!
addDrivertoQueue: driver
    driverQueue_ add: driver.! !

!SharingRideSystem methodsFor: 'adding' stamp: '3/30/2025 23:36'!
addRidertoQueue: rider
    riderQueue_ add: rider.! !


!SharingRideSystem methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:37'!
getRider
    ^ riderQueue_ isEmpty ifTrue: [nil] ifFalse: [riderQueue_ removeFirst].! !

!SharingRideSystem methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:37'!
getDriver
    ^ driverQueue_ isEmpty ifTrue: [nil] ifFalse: [driverQueue_ removeFirst].! !

!SharingRideSystem methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:38'!
createRidePickup: pickup dropoff: dropoff distance: distance rideType: rideType
    ^ (rideType = 1)
        ifTrue: [StandardRide newRideWithPickup: pickup dropoff: dropoff distance: distance]
        ifFalse: [PremiumRide newRideWithPickup: pickup dropoff: dropoff distance: distance].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SharingRideSystem class
	instanceVariableNames: ''!

!SharingRideSystem class methodsFor: 'instance creation' stamp: '3/31/2025 14:48'!
newSystem
	^ self new initialize; yourself.! !


Object subclass: #Ride
	instanceVariableNames: 'rideID_ pickup_ dropoff_ distance_'
	classVariableNames: ''
	package: 'ShareRidingSystem'!

!Ride methodsFor: 'initialization' stamp: '3/31/2025 15:40'!
initializeWithPickup: pickup dropoff: dropoff distance: distance
    rideID_ := self class nextID.
    pickup_ := pickup.
    dropoff_ := dropoff.
    distance_ := distance.
    ! !


!Ride methodsFor: 'as yet unclassified' stamp: '3/31/2025 16:03'!
calculateFare
    self subclassResponsibility.
! !

!Ride methodsFor: 'as yet unclassified' stamp: '3/31/2025 15:49'!
rideDetails
    Transcript show: 'Ride ID: ', rideID_ printString; cr;
        show: 'Pickup: ', pickup_; cr;
        show: 'Dropoff: ', dropoff_; cr;
        show: 'Distance: ', distance_ printString, ' miles'; cr;
        show: 'Fare: $', (self calculateFare) printString; cr.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Ride class
	instanceVariableNames: ''!

!Ride class methodsFor: 'instance creation' stamp: '3/31/2025 15:42'!
newRideWithPickup: pickup dropoff: dropoff distance: distance
    ^ self new initializeWithPickup: pickup dropoff: dropoff distance: distance; yourself.
! !


!Ride class methodsFor: 'as yet unclassified' stamp: '3/31/2025 15:52'!
nextID
    Smalltalk at: #RideCounter ifAbsentPut: [0].
    Smalltalk at: #RideCounter put: (Smalltalk at: #RideCounter) + 1.
    ^ Smalltalk at: #RideCounter.
! !

Ride subclass: #StandardRide
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'ShareRidingSystem'!

!StandardRide methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:19'!
calculateFare
    ^ distance_ * 1.5.! !

Ride subclass: #PremiumRide
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'ShareRidingSystem'!

!PremiumRide methodsFor: 'as yet unclassified' stamp: '3/30/2025 23:20'!
calculateFare
    ^ distance_ * 3.0.! !
