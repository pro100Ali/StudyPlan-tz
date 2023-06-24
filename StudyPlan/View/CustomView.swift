import UIKit
import SnapKit

class CustomView: UIView {
    
    
    lazy private var label: UIView = {
        let label = UIView()
        label.backgroundColor = .white
        return label
    }()
    
    lazy private var hours: UIView = {
        let label = UIView()
        label.backgroundColor = .white
        return label
    }()
    init(frame: CGRect, lessons: [Lessons]) {
        super.init(frame: frame)
        
        setupSubviews(lessons)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupSubviews(_ lessons: [Lessons]) {
        var previousView: UIView? = nil
        let spacing: CGFloat = 0  // Set the desired spacing between the subviews
        
        for index in 0..<lessons.count {
            let subview = UIView()
            subview.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
            let realHours = UILabel()
            realHours.numberOfLines = 2
            
            let hours = UILabel()
            
            hours.text = "/ \(lessons[index].Hours!)"
            realHours.text = lessons[index].RealHours
            
            realHours.textColor = .systemGreen
    
            if lessons[index].RealHours == lessons[index].Hours {
                hours.textColor = .systemGreen
            } else {
                hours.textColor = .systemRed
            }
                
            
            [realHours, hours].forEach { $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)}
            
            subview.addSubview(realHours)
            subview.addSubview(hours)
            addSubview(subview)
            
            realHours.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                make.center.equalToSuperview()
            }
            
            hours.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(19)
                make.top.equalToSuperview()
                make.center.equalToSuperview()
            }
            
            subview.snp.makeConstraints { make in
                make.width.equalTo(70)
                make.height.equalTo(50)
                
                if let previousView = previousView {
                    make.left.equalTo(previousView.snp.right).offset(spacing)
                } else {
                    make.left.equalToSuperview().offset(spacing)
                }
            }
            
            previousView = subview
        }
        
    }
    
}


