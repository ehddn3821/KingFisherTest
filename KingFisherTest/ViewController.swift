//
//  ViewController.swift
//  KingFisherTest
//
//  Created by 앱지 Appg on 2021/06/29.
//

import UIKit
import Kingfisher
import SnapKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    var loadButton = UIButton()
    var separater = UIView()
    var imageView = UIImageView()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        loadButton.rx.tap.bind {
            self.imageView.kf.indicatorType = .activity
            let imageUrl = "https://source.unsplash.com/random"
            guard let url = URL(string: imageUrl) else { return }
            self.imageView.kf.setImage(with: url, options: [.forceRefresh])
        }
        .disposed(by: disposeBag)
    }
    
    func setUI() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        view.addSubview(separater)
        separater.layer.borderColor = UIColor.label.cgColor
        separater.layer.borderWidth = 1
        separater.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        view.addSubview(loadButton)
        loadButton.setTitle("사진 불러오기", for: .normal)
        loadButton.setTitleColor(.white, for: .normal)
        loadButton.layer.cornerRadius = 10
        loadButton.backgroundColor = .systemIndigo
        loadButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.9)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct Preview: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
#endif

