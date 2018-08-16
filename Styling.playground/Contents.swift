import UIKit
import PlaygroundSupport

final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Styling Sample"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLabel.textColor = .darkGray
        view.addSubview(titleLabel)
        view.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = """
        Through secure mobile payment, conichi saves time and enables fast check-­in/-out. conichi allows hotels to cleverly upsell and directly communicate with guests through push-notifications. Prior to arrival, shared guest preferences and profiles enhance personal interaction. conichi has been developed to work with virtually any hotel’s property management system, enabling simple implementation for both independent hotel properties and chains.
        """
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subtitleLabel.textColor = .lightGray
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        view.addSubview(subtitleLabel)
        view.addConstraints([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        let actionButton = UIButton(type: .system)
        actionButton.setTitle("Do Something", for: .normal)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitleColor(.blue, for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        actionButton.layer.cornerRadius = 6
        actionButton.layer.borderColor = UIColor.blue.cgColor
        actionButton.layer.borderWidth = 1
        view.addSubview(actionButton)
        view.addConstraints([
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

let vc = SampleViewController()
vc.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
PlaygroundPage.current.liveView = vc.view
