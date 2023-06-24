//
//  LectureCustomView.swift
//  StudyPlan
//
//  Created by Али  on 23.06.2023.
//

import UIKit
import SnapKit

class LectureCustomView: UIView {
    
 
    
    lazy private var nameDiscipline: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("TITLE", comment: "")
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2

        return label
    }()
    
    lazy private var lecture: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("LECTURE", comment: "")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center

        return label
    }()
    
    lazy private var seminar: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("SEMINAR", comment: "")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center

        return label
    }()
    
    lazy private var labaratory: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("LAB", comment: "")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [nameDiscipline, lecture, seminar, labaratory].forEach{ addSubview($0) }
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        nameDiscipline.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
        }
        lecture.snp.makeConstraints { make in
            make.left.equalTo(nameDiscipline.snp.right).offset(20)
            make.centerY.equalToSuperview()

        }
        seminar.snp.makeConstraints { make in
            make.left.equalTo(lecture.snp.right).offset(20)
            make.centerY.equalToSuperview()

        }
        labaratory.snp.makeConstraints { make in
            make.left.equalTo(seminar.snp.right).offset(20)
            make.centerY.equalToSuperview()


        }
    }
}
