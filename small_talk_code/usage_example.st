| system rider1 rider2 driver1 driver2 ride |

"Create a ride-sharing system"
system := SharingRideSystem new.

"Create riders"
rider1 := Rider newRiderWithName: 'Alice'.
rider2 := Rider newRiderWithName: 'Bob'.

"Create drivers"
driver1 := Driver newDriverWithName: 'John' rating: 5.
driver2 := Driver newDriverWithName: 'Emily' rating: 4.

"Add riders and drivers to the system"
system addRider: rider1.
system addRider: rider2.
system addDriver: driver1.
system addDriver: driver2.

"Retrieve a rider and driver from the queue"
rider := system getRider.
driver := system getDriver.

"Create a ride for the rider"
ride := system createRidePickup: 'Downtown' dropoff: 'Mall' distance: 5 rideType: 1.

"Rider requests the ride"
rider requestRide: ride.

"Driver assigns the ride"
driver addRide: ride.

"View rider's requested rides"
rider viewRides.


