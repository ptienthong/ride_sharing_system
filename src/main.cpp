#include "ridesystem.hpp"


int main() {
    // create sharing ride system
    SharingRideSystem simpleRideSystem;
    
    // Add the driver to system
    auto d1 = simpleRideSystem.addDriver(Driver("John Doe", 10));
    auto d2 = simpleRideSystem.addDriver(Driver("James T", 8));

    // Add the rider to system
    auto r1 = simpleRideSystem.addRider(Rider("Jane Doe"));

    //////////////////////////////////////////////////////////////
    // Add to the queue
    simpleRideSystem.addDrivertoQueue(d1);
    simpleRideSystem.addDrivertoQueue(d2);
    simpleRideSystem.addRidertoQueue(r1);
    
    {
        // Create a standard ride
        auto ride = simpleRideSystem.createRide("A", "B", 10.0);

        // Request a ride
        auto rider = simpleRideSystem.getRider();
        rider->requestRide(ride);

        // Accept the ride
        auto driver = simpleRideSystem.getDriver();
        driver->addRide(ride);

        // Get ride detail
        ride->rideDetails();

        // Get the driver info
        driver->getDriverInfo();

        // Get the rider info
        rider->viewRides();

    }
    //////////////////////////////////////////////////////////////
    // Jane Doe is using the ride service again
    simpleRideSystem.addRidertoQueue(r1);
    {
        // Create a premium ride
        auto ride = simpleRideSystem.createRide("C", "D", 20.0, 2);
        // Request a ride
        auto rider = simpleRideSystem.getRider();
        rider->requestRide(ride);

        // Accept the ride
        auto driver = simpleRideSystem.getDriver();
        driver->addRide(ride);

        // Get ride detail
        ride->rideDetails();

        // Get the driver info
        driver->getDriverInfo();

        // Get the rider info
        rider->viewRides();

    }
    //////////////////////////////////////////////////////////////
    // John Doe is driving again
    simpleRideSystem.addDrivertoQueue(d1);
    simpleRideSystem.addRidertoQueue(r1);
    {
        // Create a standard ride
        auto ride = simpleRideSystem.createRide("E", "F", 15.0);
        // Request a ride
        auto rider = simpleRideSystem.getRider();
        rider->requestRide(ride);

        // Accept the ride
        auto driver = simpleRideSystem.getDriver();
        driver->addRide(ride);

        // Get ride detail
        ride->rideDetails();

        // Get the driver info
        driver->getDriverInfo();

        // Get the rider info
        rider->viewRides();

    }
    //////////////////////////////////////////////////////////////
    // No driver/rider is in the queue
    {
        // Create a standard ride
        auto ride = simpleRideSystem.createRide("G", "H", 25.0);
        // Request a ride
        auto rider = simpleRideSystem.getRider();
        rider->requestRide(ride);

    }
    
    return 0;
}