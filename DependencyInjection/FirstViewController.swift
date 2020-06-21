//
//  FirstViewController.swift
//  DependencyInjection
//
//  Created by Jaedoo Ko on 2020/06/20.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //  화면에 보여줄 텍스트를 생성해줍니다
//    private let generator: HelloWorldGenerator = HelloWorldGenerator()
    
    //  헬로월드 제네레이터 대신 스트링 제네레이터로 바꿔줍니다
    private let generator: StrGenerator
    
    //  생성된 텍스트를 화면에 띄워줍니다
    private let label: UILabel = {
        let lb = UILabel()
        lb.textColor = .blue
        lb.font = .systemFont(ofSize: 30)
        lb.textAlignment = .center
        lb.layer.borderWidth = 1
        lb.layer.borderColor = UIColor.black.cgColor
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    //  세컨드 뷰 컨트롤러로 연결할 버튼입니다
    private let btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("go to second", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.backgroundColor = .lightGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //  생성자 주입
    init(strGenerator: StrGenerator) {
        self.generator = strGenerator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
        
        label.text = generator.generate()
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }

    private func setLayout() {
        view.addSubview(label)
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 100),
            
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.widthAnchor.constraint(equalToConstant: 200),
            btn.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    //  버튼과 연결될 메서드입니다
    @objc
    private func btnClicked(_ sender: UIButton) {
        //  세컨드 뷰 컨트롤러를 생성하고 화면에 띄워줍니다
        let generator: StrGenerator = HelloWorldGenerator()
        let vc = SecondViewController(strGenerator: generator)
        present(vc, animated: true, completion: nil)
    }

}

