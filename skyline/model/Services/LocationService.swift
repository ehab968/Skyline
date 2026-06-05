//
//  LocationService.swift
//  skyline
//
//  Created by Ehab Salah on 05/06/2026.
//

import Foundation
import CoreLocation

protocol LocationServiceProtocol {
    func getCurrentLocation() async throws -> CLLocationCoordinate2D
}

class LocationService: NSObject, LocationServiceProtocol, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var continuation: CheckedContinuation<CLLocationCoordinate2D, Error>?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
    }
    
    func getCurrentLocation() async throws -> CLLocationCoordinate2D {
        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation
            
            // التحقق من حالة الصلاحية
            let status = locationManager.authorizationStatus
            switch status {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.requestLocation()
            case .restricted, .denied:
                continuation.resume(throwing: NSError(domain: "LocationDenied", code: 1, userInfo: [NSLocalizedDescriptionKey: "permission denied"]))
                self.continuation = nil
            @unknown default:
                break
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            continuation?.resume(returning: location.coordinate)
            continuation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        continuation?.resume(throwing: error)
        continuation = nil
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .denied, .restricted:
            continuation?.resume(throwing: NSError(domain: "LocationDenied", code: 1, userInfo: [NSLocalizedDescriptionKey: "permission denied"]))
            continuation = nil
        case .notDetermined:
            break
        @unknown default:
            break
        }
    }
}


