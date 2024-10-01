//
//  TrackPartnersViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/30/24.
//

import UIKit
import GoogleMaps
class TrackPartnersViewController: BaseViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    var startLatitude = 25.213400
    var startLongitude = 55.273287
    var endLatitude = 25.208095
    var endLongitude = 55.264312
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllerTitle = "Track Partners"
        type = .myProfile
        
        let camera = GMSCameraPosition.camera(withLatitude: startLatitude, longitude: startLongitude, zoom: 14.0)
        mapView.camera = camera
        
        // Add custom markers
        addMarker(at: CLLocationCoordinate2D(latitude: startLatitude, longitude: startLongitude), with: "map-location")
        addMarker(at: CLLocationCoordinate2D(latitude: endLatitude, longitude: endLongitude), with: "map-pin")
        
        let start = CLLocationCoordinate2D(latitude: startLatitude, longitude: startLongitude)
        let end = CLLocationCoordinate2D(latitude: endLatitude, longitude: endLongitude)
        
        fetchRoute(from: start, to: end) { path in
            guard let path = path else { return }
            DispatchQueue.main.async {
                self.drawDashedPolyline(for: path)
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabbar = tabBarController as? TabbarController
        tabbar?.hideTabBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let tabbar = tabBarController as? TabbarController
        tabbar?.showTabBar()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TrackPartnersViewController{
    
    func fetchRoute(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D, completion: @escaping (GMSPath?) -> Void) {
        let baseURL = "https://maps.googleapis.com/maps/api/directions/json?"
        let origin = "origin=\(start.latitude),\(start.longitude)"
        let destination = "destination=\(end.latitude),\(end.longitude)"
        let mode = "mode=driving"
        let apiKey = Config.googleApiKey

        let urlString = "\(baseURL)\(origin)&\(destination)&\(mode)&key=\(apiKey)"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let routes = json["routes"] as? [[String: Any]],
                   let overviewPolyline = routes.first?["overview_polyline"] as? [String: Any],
                   let points = overviewPolyline["points"] as? String {
                    
                    let path = GMSPath(fromEncodedPath: points)
                    completion(path)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }.resume()
    }

    func drawDashedPolyline(for path: GMSPath) {
        let dashedPolyline = GMSPolyline(path: path)
        dashedPolyline.strokeWidth = 4
        dashedPolyline.strokeColor = UIColor(hex: "#FF9100") ?? .orange // Or your desired color
        
        var dashedPath = [GMSPath]()

        for i in 0..<path.count() - 1 {
            let point1 = path.coordinate(at: i)
            let point2 = path.coordinate(at: i + 1)
            
            let segmentPath = GMSMutablePath()
            segmentPath.add(point1)
            segmentPath.add(point2)
            
            dashedPath.append(segmentPath)
        }

        for (index, segment) in dashedPath.enumerated() {
            let polyline = GMSPolyline(path: segment)
            polyline.strokeWidth = dashedPolyline.strokeWidth
            polyline.strokeColor = index % 2 == 0 ? dashedPolyline.strokeColor : .clear
            polyline.map = mapView
        }
    }

    
    func addMarker(at position: CLLocationCoordinate2D, with imageName: String) {
        let marker = GMSMarker()
        marker.position = position
        marker.icon = UIImage(named: imageName) // Custom image for the marker
        marker.map = mapView
    }
}
