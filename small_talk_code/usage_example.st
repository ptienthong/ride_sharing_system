Driver resetDriverCounter .
Rider resetRiderCounter .

"create rider and driver (global scope)"
rider1 := Rider newRiderWithName: 'Alice'.
rider2 := Rider newRiderWithName: 'Bob'.

driver1 := Driver newDriverWithName: 'John Doe' rating: 5. 

"add rider and driver to the system"
system := SharingRideSystem newSystem .

"test 1: create a standard ride"
system addDriver: driver1 .
system addRider: rider1 .

ride := system createRidePickup: 'Downtown' dropoff: 'Airport' distance: 10 rideType: 1.

"get rider and driver from queue"
rider := system getRider.
driver := system getDriver.

"request ride and assign to driver"
rider requestRide: ride.
driver addRide: ride.

"print driver info and view requested ride"
rider viewRides .
driver getDriverInfo .


"test 2: create a premium ride"
system addDriver: driver1 .
system addRider: rider2 .

ride := system createRidePickup: 'Downtown' dropoff: 'Airport' distance: 10 rideType: 2.

"get rider and driver from queue"
rider := system getRider.
driver := system getDriver.

"request ride and assign to driver"
rider requestRide: ride.
driver addRide: ride.

"print driver info and view requested ride"
rider viewRides .
driver getDriverInfo .