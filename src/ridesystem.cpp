#include "ridesystem.hpp"
#include <iostream>
#include <memory>

Ride::Ride(std::string&& pickup, std::string&& dropoff, double distance) : pickup_(std::move(pickup)), dropoff_(std::move(dropoff)), distance_(distance) {
    static int rideID = 0;
    rideID_ = rideID++;
}

void Ride::rideDetails() {
    std::cout << "Ride ID: " << rideID_ << std::endl;
    std::cout << "Pickup: " << pickup_ << std::endl;
    std::cout << "Dropoff: " << dropoff_ << std::endl;
    std::cout << "Distance: " << distance_ << " miles" << std::endl;
    std::cout << "Fare: $" << calculateFare() << std::endl;
    std::cout << "--------------------------------" << std::endl;
}

StandardRide::StandardRide(std::string&& pickup, std::string&& dropoff, double distance) : Ride(std::move(pickup), std::move(dropoff), distance) {
    std::cout << "StandardRide created with ID: "<< rideID_ << std::endl;
}

double StandardRide::calculateFare() {
    return distance_ * 1.5; // $1.50 per mile
}

PremiumRide::PremiumRide(std::string&& pickup, std::string&& dropoff, double distance) : Ride(std::move(pickup), std::move(dropoff), distance) {
    std::cout << "PremiumRide created with ID: "<< rideID_ << std::endl;
}

double PremiumRide::calculateFare() {
    return distance_ * 3.0; // $3.0 per mile
}

Driver::Driver(std::string&& name, int rating) : name_(std::move(name)), rating_(rating) {
    static int driverID = 0;
    driverID_ = driverID++;
    assignedRidePtr_ = std::make_unique<std::vector<std::shared_ptr<Ride>>>();
    
    std::cout << "Driver name: " << name_ << " is created with ID: " << driverID_ << std::endl;
    std::cout << "--------------------------------" << std::endl;
}

void Driver::addRide(std::shared_ptr<Ride> ride) {
    if (this == nullptr) {
        std::cerr << "Error: Ride is not available" << std::endl;
        return;
    }
    assignedRidePtr_->push_back(ride);
    std::cout << "Ride added to driver: "<< this->name_ << std::endl;
}

void Driver::getDriverInfo() {
    std::cout << "Driver ID: " << driverID_ << std::endl;
    std::cout << "Driver Name: " << name_ << std::endl;
    std::cout << "Driver Rating: " << rating_ << std::endl;
    std::cout << "Assigned Rides: " << assignedRidePtr_->size() << std::endl;
    std::cout << "--------------------------------" << std::endl;
}

Rider::Rider(std::string&& name) : name_(std::move(name)) {
    static int riderID = 0;
    rideID_ = riderID++;
    requestedRidePtr = std::make_unique<std::vector<std::shared_ptr<Ride>>>();

    std::cout << "Rider name: " << name_ << " is created with ID: " << rideID_ << std::endl;
    std::cout << "--------------------------------" << std::endl;
}

void Rider::requestRide(std::shared_ptr<Ride> ride) {
    if (this == nullptr) {
        std::cerr << "Error: Ride is not available" << std::endl;
        return;
    }
    requestedRidePtr->push_back(ride);
    std::cout << "Ride requested added for customer: " << this->name_ << std::endl;
}

void Rider::viewRides() {
    std::cout << "Rider ID: " << rideID_ << std::endl;
    std::cout << "Rider Name: " << name_ << std::endl;
    std::cout << "Requested Rides: " << requestedRidePtr->size() << std::endl;
    std::cout << "--------------------------------" << std::endl;
}

SharingRideSystem::SharingRideSystem() {
    driverQueuePtr_ = std::make_unique<std::queue<std::shared_ptr<Driver>>>();
    riderQueuePtr_= std::make_unique<std::queue<std::shared_ptr<Rider>>>();
    
    std::cout << "SharingRideSystem created" << std::endl;
    std::cout << "--------------------------------" << std::endl;
}

void SharingRideSystem::addDriver(std::shared_ptr<Driver> driver) {
    driverQueuePtr_->push(driver);
    driverMap_[driver->getID()] = driver;
    //std::cout << "Driver added to the system" << std::endl;
}

void SharingRideSystem::addRider(std::shared_ptr<Rider> rider) {
    riderQueuePtr_->push(rider);
    riderMap_[rider->getID()] = rider;
    //std::cout << "Rider added to the system" << std::endl;
}

void SharingRideSystem::addDrivertoQueue(std::shared_ptr<Driver> driver) {
    driverQueuePtr_->push(driver);
}

void SharingRideSystem::addRidertoQueue(std::shared_ptr<Rider> rider) {
    riderQueuePtr_->push(rider);
}

std::shared_ptr<Driver> SharingRideSystem::addDriver(Driver&& driver) {
    std::shared_ptr<Driver> driverPtr = std::make_shared<Driver>(std::move(driver));
    driverMap_[driverPtr->getID()] = driverPtr;
    return driverPtr;
    //std::cout << "Driver added to the system" << std::endl;
}

std::shared_ptr<Rider> SharingRideSystem::addRider(Rider&& rider) {
    std::shared_ptr<Rider> riderPtr = std::make_shared<Rider>(std::move(rider));
    riderMap_[riderPtr->getID()] = riderPtr;
    return riderPtr;
    //std::cout << "Rider added to the system" << std::endl;
}

std::shared_ptr<Ride> SharingRideSystem::createRide(std::string&& pickup, std::string&& dropoff, double distance, int rideType) {
    std::shared_ptr<Ride> ride;
    if (rideType == 1) {
        ride = std::make_unique<StandardRide>(std::move(pickup), std::move(dropoff), distance);
    } else if (rideType == 2) {
        ride = std::make_unique<PremiumRide>(std::move(pickup), std::move(dropoff), distance);
    } else {
        std::cerr << "Invalid ride type" << std::endl;
    }
    return ride;
}

std::shared_ptr<Rider> SharingRideSystem::getRider() {
    if (riderQueuePtr_->empty()) {
        std::cerr << "Error: No riders available in the queue." << std::endl;
        return nullptr;
    }
    auto rider = riderQueuePtr_->front();
    riderQueuePtr_->pop();
    return rider;
}

std::shared_ptr<Driver> SharingRideSystem::getDriver() {
    if (driverQueuePtr_->empty()) {
        std::cerr << "Error: No riders available in the queue." << std::endl;
        return nullptr;
    }
    auto driver = driverQueuePtr_->front();
    driverQueuePtr_->pop();
    return driver;
}