//
//  main.swift
//  lesson6
//
//  Created by Марк Голубев on 21.03.2021.
//

import Foundation

class Message: CustomStringConvertible {
    let size: Int
    let priority: Bool
    var description: String {
        return "Сообщение размером \(size) kiB с \(self.priority ? "высоким" : "низким") приоритетом.\n"
    }
    init(size: Int, priority: Bool) {
        self.priority = priority
        self.size = size
    }
}

struct PriorityQueue<T> {
    
    private var elements: [T] = []
 
    func filter(perdicate: (T) -> Bool) -> [T] {
        var tempArray:[T] = []
        for element in elements {
            if perdicate(element){
                tempArray.append(element)
            }
        }
        return tempArray
    }
    
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

extension PriorityQueue {
    
    subscript(index: Int) -> T? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements[index]
    }
}

var priorityMessages = PriorityQueue<Message>()

priorityMessages.push(Message(size: 132, priority: true))
priorityMessages.push(Message(size: 10, priority: false))
priorityMessages.push(Message(size: 130, priority: true))
priorityMessages.push(Message(size: 100, priority: false))
priorityMessages.push(Message(size: 130, priority: false))
priorityMessages.push(Message(size: 130, priority: false))
priorityMessages.push(Message(size: 150, priority: true))
priorityMessages.push(Message(size: 160, priority: true))
priorityMessages.push(Message(size: 130, priority: false))
priorityMessages.push(Message(size: 250, priority: true))

var filterMessages = priorityMessages.filter() {element in element.priority != false}

print(filterMessages)

let example = filterMessages[2]
print(example)

priorityMessages.pop()
priorityMessages.pop()

// Я хотел написать вместо функции фильтрации функцию сортировки (которая меняет исходную коллекцию) и я мог бы извлекать из своей уже отсортированной очереди сообщения (сортировать по значению ключа priotity, а оно Bool), но у меня не получилось. Не могу сообразить как функцию объявить в PriorityQueue<T> и дальше потом использовать. Видимо с кложурами пока не совсем разобрался( Как это можно сделать? Я смотрел эту функцию в доке на сайте эпл дев, но тоже пока не смог разобраться. Хотя там есть пример.
