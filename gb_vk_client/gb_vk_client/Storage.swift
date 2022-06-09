//
//  Storage.swift
//  gb_vk_client
//
//  Created by 5vi5t on 18.03.2022.
//

import UIKit

class Storage: NSObject {
    
    static var shared = Storage()
    
    private override init() {
        super.init()
    }
    
    var friendsArray = [
        Friend(name: "Амогус", avatar: "amogus1", surname: "Красный", fotos: ["amogus1", "amogus2", "amogus3", "amogus4", "amogus5"]),
        Friend(name: "Джокер", avatar: "joker1", surname: "Добрый", fotos: ["joker1", "joker2", "joker3", "joker4", "joker5"]),
        Friend(name: "Ана", avatar: "ana", surname: "Бабка", fotos: ["ana"]),
        Friend(name: "Бастион", avatar: "bastion", surname: "Бастик", fotos: ["bastion"]),
        Friend(name: "Кулак", avatar: "doomfist", surname: "Думфист", fotos: ["doomfist"]),
        Friend(name: "ДВА", avatar: "dva", surname: "Дива", fotos: ["dva"]),
        Friend(name: "Генджи", avatar: "genji", surname: "Генга", fotos: ["genji"]),
        Friend(name: "Ханзо", avatar: "hanzo", surname: "Лук", fotos: ["hanzo"]),
        Friend(name: "Крысавчик", avatar: "junkrat", surname: "Джанк", fotos: ["junkrat"]),
        Friend(name: "Люсио", avatar: "lucio", surname: "Лисёк", fotos: ["lucio"]),
        Friend(name: "Мерси", avatar: "mercy", surname: "Мерка", fotos: ["mercy"]),
        Friend(name: "Мойра", avatar: "moira", surname: "О'Доран", fotos: ["moira"]),
        Friend(name: "Ориса", avatar: "orisa", surname: "Лошадь", fotos: ["orisa"]),
        Friend(name: "Фара", avatar: "pharah", surname: "Амари", fotos: ["pharah"]),
        Friend(name: "Жнец", avatar: "reaper", surname: "Рипер", fotos: ["reaper"]),
        Friend(name: "Рейнхардт", avatar: "reinhardt", surname: "Дед", fotos: ["reinhardt"]),
        Friend(name: "Турбосвин", avatar: "roadhog", surname: "Хог", fotos: ["roadhog"]),
        Friend(name: "Солдат", avatar: "soldier_76", surname: "76", fotos: ["soldier_76"]),
        Friend(name: "Сомбра", avatar: "sombra", surname: "Оливия", fotos: ["sombra"]),
        Friend(name: "Симметра", avatar: "symmetra", surname: "Симка", fotos: ["symmetra"]),
        Friend(name: "Торбьёрн", avatar: "torbjorn", surname: "Торб", fotos: ["torbjorn"]),
        Friend(name: "Трейсер", avatar: "tracer", surname: "Лена", fotos: ["tracer"]),
        Friend(name: "Вдова", avatar: "widowmaker", surname: "Видоу", fotos: ["widowmaker"]),
        Friend(name: "Винстон", avatar: "winston", surname: "Макака", fotos: ["winston"]),
        Friend(name: "Заря", avatar: "zarya", surname: "Зарянова", fotos: ["zarya"]),
        Friend(name: "Дзеньятта", avatar: "zenyatta", surname: "Зен", fotos: ["zenyatta"])
    ]
    
    var allGroupsArray = [
        Group(name: "Fantasy Books", avatar: "group1", description: nil),
        Group(name: "Magic Books", avatar: "group2", description: nil),
        Group(name: "Adventure Books", avatar: "group3", description: "Frigate")
    ]
    
}
