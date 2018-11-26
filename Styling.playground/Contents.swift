import UIKit
import PlaygroundSupport

// Base Styles
func autolayoutStyle<V: UIView>(_ view: V) {
    view.translatesAutoresizingMaskIntoConstraints = false
}

// Label Styles
let titleLabelStyle = autolayoutStyle
    <> mutate(\UILabel.font, .systemFont(ofSize: 20, weight: .medium))
    <> mutate(\.textColor, .darkGray)

let subtitleLabelStyle = autolayoutStyle
    <> mutate(\UILabel.font, .systemFont(ofSize: 14, weight: .medium))
    <> mutate(\.textColor, .lightGray)
    <> mutate(\.textAlignment, .center)
    <> mutate(\.numberOfLines, 0)

// Button Styles
extension UIButton {
    var normalTitleColor: UIColor? {
        set { setTitleColor(newValue, for: .normal) }
        get { return titleColor(for: .normal) }
    }
    
    var titleFont: UIFont? {
        set { titleLabel?.font = newValue }
        get { return titleLabel?.font }
    }
}

func borderStyle<V: UIView>(_ color: UIColor, _ width: CGFloat) -> (V) -> () {
    return {
        $0.layer.borderColor = color.cgColor
        $0.layer.borderWidth = width
    }
}

func cornerStyle<V: UIView>(_ radius: CGFloat) -> (V) -> () {
    return {
        $0.layer.cornerRadius = radius
        $0.clipsToBounds = true
    }
}

let actionRoundedButtonStyle = autolayoutStyle
    <> cornerStyle(6)
    <> borderStyle(.blue, 1)
    <> mutate(\UIButton.normalTitleColor, .blue)
    <> mutate(\.titleFont, .systemFont(ofSize: 20, weight: .medium))

// View Controller
final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Styling Sample"
        titleLabel |> titleLabelStyle
        view.addSubview(titleLabel)
        view.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = """
        Through secure mobile payment, conichi saves time and enables fast check-­in/-out. conichi allows hotels to cleverly upsell and directly communicate with guests through push-notifications. Prior to arrival, shared guest preferences and profiles enhance personal interaction. conichi has been developed to work with virtually any hotel’s property management system, enabling simple implementation for both independent hotel properties and chains.
        """
        subtitleLabel |> subtitleLabelStyle
        view.addSubview(subtitleLabel)
        view.addConstraints([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        let actionButton = UIButton(type: .system)
        actionButton.setTitle("Do Something", for: .normal)
        actionButton |> actionRoundedButtonStyle
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
