Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'.
    
"Class method to create a new driver with a name and rating"
Driver class >> newDriverWithName: name rating: rating
    ^ self new initializeWithName: name rating: rating; yourself.

"Instance method to initialize the driver attributes"
Driver >> initializeWithName: name rating: rating
    self name := name.
    self rating := rating.
    self driverID := self class nextID.
    self assignedRides := OrderedCollection new.
    ^ self.

"Class method to generate unique driver ID"
Driver class >> nextID
    Smalltalk at: #DriverCounter ifAbsentPut: [0].
    Smalltalk at: #DriverCounter put: (Smalltalk at: #DriverCounter) + 1.
    ^ Smalltalk at: #DriverCounter.

"Instance method to assign a ride to the driver"
Driver >> addRide: ride
    self assignedRides add: ride.
    Transcript show: 'Ride added to driver: ', self name; cr.

"Instance method to display driver details"
Driver >> getDriverInfo
    Transcript show: 'Driver ID: ', self driverID printString; cr.
    Transcript show: 'Name: ', self name; cr.
    Transcript show: 'Rating: ', self rating printString; cr.
    Transcript show: 'Assigned Rides: ', self assignedRides size printString; cr.
    Transcript show: '-----------------------------'; cr.

"Overriding printString for custom driver representation"
Driver >> printString
    ^ self name.
