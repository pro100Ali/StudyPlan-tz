//
//  ViewController.swift
//  StudyPlan
//
//  Created by Али  on 21.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var viewModel = ViewModel()
    private var previousViews: [UIView] = []
    private var viewOpt: UIView?
    
    
    lazy private var yearLabel: UILabel = {
        let label = UILabel()
        if let model = viewModel.model {
            label.text = NSLocalizedString("MAINTITLE", comment: "")
        }
        label.numberOfLines = 3
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy private var buttonFirst: UIButton = {
        let button = UIButton()
        button.setTitle("6 \(NSLocalizedString("SEMESTER", comment: ""))", for: .normal)
        button.backgroundColor = Constants.shared.colorSelectedButton
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(actionButton1), for: .touchUpInside)
        return button
    }()
    
    lazy private var buttonSecond: UIButton = {
        let button = UIButton()
        button.setTitle("7 \(NSLocalizedString("SEMESTER", comment: ""))", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(actionButton2), for: .touchUpInside)
        button.backgroundColor = Constants.shared.colorGray
        return button
    }()
    
    lazy private var viewTable: UIView = {
        let view = UIView()
        return view
    }()
    
    
    lazy private var audioInHours: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("AUDIO", comment: "")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.backgroundColor = Constants.shared.colorGray
        return label
    }()
    
    lazy private var buttonDownload: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(
            pointSize: 30, weight: .medium, scale: .default)
        button.setImage(UIImage(systemName: "arrow.down.doc", withConfiguration: config), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(downloadButton), for: .touchUpInside)
        return button
    }()
    
    let viewHell = LectureCustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchProducts()
        viewModel.fetchModel()
        
        
        [buttonFirst, yearLabel, buttonSecond, viewTable, audioInHours, buttonDownload, viewHell].forEach{ view.addSubview($0)}
        
        drawTable(viewModel.semester[0])
        setupConstraints()
        
        
    }
    
    @objc func downloadButton() {
        guard let model = viewModel.model?.DocumentURL else {return}
        let alert = UIAlertController(title: "Document", message: "\(NSLocalizedString("DOCUMENTURL", comment: "")) \(model)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func clearPreviousViews() {
        for view in previousViews {
            view.removeFromSuperview()
        }
        previousViews.removeAll()
    }
    
    @objc func actionButton1() {
        drawTable(viewModel.semester[0])
        buttonFirst.backgroundColor = Constants.shared.colorSelectedButton
        buttonSecond.backgroundColor = Constants.shared.colorGray
        buttonSecond.setTitleColor(UIColor(red: 0.77, green: 0.80, blue: 0.86, alpha: 1.00), for: .normal)
        buttonFirst.setTitleColor(.black, for: .normal)
    }
    
    @objc func actionButton2() {
        drawTable(viewModel.semester[1])
        buttonFirst.backgroundColor = Constants.shared.colorGray
        buttonSecond.backgroundColor = Constants.shared.colorSelectedButton
        buttonFirst.setTitleColor(UIColor(red: 0.77, green: 0.80, blue: 0.86, alpha: 1.00), for: .normal)
        buttonSecond.setTitleColor(.black, for: .normal)

    }

    func drawTable(_ semester: Semester) {
        
        clearPreviousViews()
        var previousView: UIView? = nil
        var previousDiscipline: UIView? = nil
        guard let disciplines = semester.Disciplines else {return}
        for i in 0..<disciplines.count {
            let discipline = disciplines
            let label = UILabel()
            if let name = discipline[i].DisciplineName?.localized {
                label.text = "\(name)"
                label.font = UIFont.systemFont(ofSize: 14)
                label.numberOfLines = 2
            }
            
            let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), lessons: discipline[i].Lesson!)
            viewTable.addSubview(customView)
            viewTable.addSubview(label)
            
            
            previousViews.append(customView)
            previousViews.append(label)
            
            label.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(250)
                if let previousView = previousDiscipline {
                    make.width.equalTo(150)
                    make.top.equalTo(previousView.snp.bottom)
                    make.leading.equalTo(previousView)
                } else {
                    make.width.equalTo(150)
                    make.centerY.equalToSuperview()
                    make.leading.equalToSuperview().inset(16)

                }
            }
            customView.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(200)
                
                if let previousView = previousView {
                    make.top.equalTo(previousView.snp.bottom)
                    make.leading.equalTo(previousView)

                } else {
                    make.centerY.equalToSuperview()
                    make.centerX.equalToSuperview().offset(90)
                }
                
            }

            previousView = customView
            previousDiscipline = label
        }
    }
    
    func setupConstraints() {
        yearLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        buttonFirst.snp.makeConstraints { make in
            make.top.equalTo(buttonSecond.snp.top)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.leading.equalToSuperview()
        }
        
        buttonSecond.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(270)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalTo(buttonFirst.snp.right)

        }
        audioInHours.snp.makeConstraints { make in
            make.top.equalTo(buttonFirst.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.trailing.equalToSuperview().inset(10)
        }
        buttonDownload.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
        
        viewHell.backgroundColor = Constants.shared.colorGray
        
        viewHell.snp.makeConstraints { make in
            make.top.equalTo(audioInHours.snp.bottom)
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
        viewTable.snp.makeConstraints { make in
            make.top.equalTo(viewHell.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        

    }
    
    

}

