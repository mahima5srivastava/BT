//
//  PageManager.swift
//  BT
//
//  Created by Mahima Personal on 21/02/24.
//

import Foundation
import UIKit
class PageManager {
    
    var totalPages = 0
    var vcArray: [ViewController] = []
    

    func getFirstVc(completion: @escaping (ViewController?) -> ()) {
        getPages() { isSuccess in
            if isSuccess, let firstVc = self.vcArray.first {
                completion(firstVc)
            } else {
                completion(nil)
            }
        }
    }
    
    func getNextPage(for index: Int) -> ViewController? {
        guard vcArray.count > 0, index < vcArray.count - 1 else {return nil}
        return vcArray[index + 1]
    }
    
    func getPreviousPage(for index: Int) -> ViewController? {
        guard vcArray.count > 0, index > 0, index < vcArray.count else {return nil}
        return vcArray[index - 1]
    }
    
    private func getPages(completion: @escaping (Bool) -> ()) {
        NetworkManager().getData(pageNum: 0) { completeData in
            DispatchQueue.main.async {
                let totalPage = completeData.totalPages ?? 0
                for i in 0..<totalPage {
                    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController {
                        vc.index = i
                        self.vcArray.append(vc)
                    }
                }
                completion(true)
            }
        }
    }
}
