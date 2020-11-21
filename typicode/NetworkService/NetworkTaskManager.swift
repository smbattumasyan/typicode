//
//  NetworkTaskManager.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

final class NetworkTaskManager {
    private var tasks: [String: URLSessionTask] = [:]
    
    var currentTasksCount = 0
    
    func task(forRequest request: URLRequest) -> URLSessionTask? {
        guard let identifier = request.url?.absoluteString else { return nil }
        return tasks[identifier]
    }
    
    func add(_ task: URLSessionTask, forRequest request: URLRequest) {
        guard let identifier = request.url?.absoluteString else { return }
        tasks[identifier] = task
        currentTasksCount += 1
    }
    
    func removeTask(forRequest request: URLRequest) {
        guard let identifier = request.url?.absoluteString else { return }
        tasks[identifier] = nil
        currentTasksCount -= 1
    }
}

