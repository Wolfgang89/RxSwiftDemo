//
//  ViewController.swift
//  RxSwift-Demo
//
//  Created by Wolfgang on 22/11/2017.
//  Copyright © 2017 Wolfgang. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    
//    var name = ""
//    var age:Int = 0
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///  RxSwift的使用
        /* 本质上Subject就是一个代理
         怎么理解呢？
         */
        
        /// PublishSubject
        
//        let aaa = PublishSubject<Int>()
        
//        let bag = DisposeBag()
        
        
//        aaa.subscribe { (event) in
//            
//            print("\(event)")
//        }.disposed(by: bag)
//                aaa.skipWhile{ (a) in
//                    a != 3
//                    }.subscribe { (bbb) in
//                        print("bbb--------\(bbb)")
//                }.disposed(by: bag)
        ///skipWhile 只忽略到第一个不满足条件的事件

        // 忽略个数
//        aaa.skip(2).subscribe { (e) in
//            print("e------\(e)")
//        }.disposed(by: bag)
//
        // 忽略onNext事件
//        aaa.ignoreElements().subscribe { (e) in
//             print("e------\(e)")
//        }.disposed(by: bag)
        
        // 下标指定的事件 下标0 1 2 开始
//        aaa.elementAt(2).subscribe { (e) in
//            print("e-----\(e)")
//        }.disposed(by: bag)
        
        
        // 前两个事件
//        aaa.take(2).subscribe { (a) in
//            print("e-----\(a)")
//        }.disposed(by: bag)
        
        //  一开始就满足了闭包里的条件，就释放了信号  从该条件开始 之前的订阅可以存在  从该条件开始 不在订阅  闭包里是 终止订阅取反
//        aaa.takeWhile{ (a) -> Bool in
//            a != 2
//        }.subscribe { (w) in
//             print("e-----\(w)")
//        }.disposed(by: bag)
        
//        aaa.takeWhileWithIndex { (value, index) -> Bool in
//                value != 2 && index < 1
//            }.subscribe {
//                print("------\($0)")
//            }.disposed(by: bag)
        
        
//        aaa.enumerated().takeWhile { (value, index) -> Bool in
//
////            let (value, index) = arg0
//            return  value != 2 && index < 3
//
//            }.subscribe {
//                print("------\($0)")
//            }.disposed(by: bag)
        
        //
        //        aaa.onNext(1)
        //        aaa.onNext(2)
        //        aaa.onNext(3)
        //        aaa.onCompleted()
        
        
        
        /// 订阅的 另一种写法
        let aaa = PublishSubject<Int>()
        
        let bag = DisposeBag()
        
        aaa.subscribe { (s) in
            print("-------------\(s)")
        }
        
        let  reseSubject  = Observable<Int>.create { (observer) -> Disposable in
            
            observer.onNext(1)
            observer.onNext(2)
            observer.onNext(3)
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        reseSubject.subscribe(aaa).disposed(by: bag)

    }

}
    

