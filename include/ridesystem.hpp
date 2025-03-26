#ifndef RIDESYSTEM_HPP
#define RIDESYSTEM_HPP
#include <queue>
#include <map>

#include <memory>
class Ride {
public:
    Ride() = delete;
    Ride(std::string&& pickup, std::string&& dropoff, double distance);
    
    // calculate fare based on distance
    virtual double calculateFare() = 0;
    // print ride information
    void rideDetails();

protected:
    int rideID_;
    double distance_;
private:
    std::string pickup_;
    std::string dropoff_;

};

class StandardRide : public Ride {
public:
    StandardRide() = delete;
    StandardRide(const StandardRide& ride) = delete;
    StandardRide(std::string&& pickup, std::string&& dropoff, double distance);
    double calculateFare() override;

};

class PremiumRide : public Ride {
public:
    PremiumRide() = delete;
    PremiumRide(const PremiumRide& ride) = delete;
    PremiumRide(std::string&& pickup, std::string&& dropoff, double distance);
    double calculateFare() override;

};

class Driver {
public:
    Driver() = delete;
    //Driver(const Driver& driver) = default;
    Driver(Driver&& driver) = default;
    Driver(std::string&& name, int rating);
    
    void addRide(std::shared_ptr<Ride> ride);
    void getDriverInfo();
    int getID() const { return driverID_; }
    friend std::ostream& operator<<(std::ostream& os, const Driver& driver) {
        os << driver.name_;
        return os;
    }
private:
    std::unique_ptr<std::vector<std::shared_ptr<Ride>>> assignedRidePtr_;
    int rating_;
    int driverID_;
    std::string name_;
};

class Rider {
public:
    Rider() = delete;
    //Rider(const Rider& rider) = default;
    Rider(Rider&& rider) = default;
    Rider(std::string&& name);
    
    void requestRide(std::shared_ptr<Ride> ride);
    void viewRides();
    int getID() const { return rideID_; }
    friend std::ostream& operator<<(std::ostream& os, const Rider& rider) {
        os << rider.name_;
        return os;
    }
private:
    std::unique_ptr<std::vector<std::shared_ptr<Ride>>> requestedRidePtr;
    int rideID_;
    std::string name_;

};

class SharingRideSystem {
public:
    SharingRideSystem();
    void addRider(std::shared_ptr<Rider> rider);
    void addDriver(std::shared_ptr<Driver> driver);
    std::shared_ptr<Rider> addRider(Rider&& rider);
    std::shared_ptr<Driver> addDriver(Driver&& driver);
    void addDrivertoQueue(std::shared_ptr<Driver> driver);
    void addRidertoQueue(std::shared_ptr<Rider> rider);
    std::shared_ptr<Ride> createRide(std::string&& pickup, std::string&& dropoff, double distance, int rideType = 1);
    std::shared_ptr<Rider> getRider();
    std::shared_ptr<Driver> getDriver();
private:
    // queue of riders and drivers
    std::unique_ptr<std::queue<std::shared_ptr<Rider>>> riderQueuePtr_;
    std::unique_ptr<std::queue<std::shared_ptr<Driver>>> driverQueuePtr_;
    // driver and rider info
    std::map<int, std::shared_ptr<Driver>> driverMap_;
    std::map<int, std::shared_ptr<Rider>> riderMap_;
};

#endif // RIDESYSTEM_HPP