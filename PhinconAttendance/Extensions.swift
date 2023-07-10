//
//  Extensions.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        self.layer.mask = mask
    }
}

extension UIImageView {
    
    func loadAndCache(url: String, cache: URLCache?, placeholder: UIImage?) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let cache = cache ?? URLCache.shared
        
        var request = URLRequest(url: url)
        
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        } else {
            request.httpMethod = "GET"
            NetworkManager.shared.sendRequest(with: request) { [weak self] result in
                switch result {
                case .success(let passedData):
                    let data = passedData.0
                    let response = passedData.1
                    let error = passedData.2
                    if let unwrappedData = data, let unwrappedResponse = response, error == nil {
                        let cachedData = CachedURLResponse(response: unwrappedResponse, data: unwrappedData)
                        self?.image = UIImage(data: unwrappedData)
                    } else {
                        print(APIError.failedToGetData)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
