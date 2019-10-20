import UIKit
import PlaygroundSupport /// Makes views being visible

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
containerView.backgroundColor = .lightGray

let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
imageView.image = UIImage(named: "catalina.jpg")
imageView.center = containerView.center

let headerLabel = UILabel(frame: .zero)
headerLabel.text = "macOS"
headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
headerLabel.textColor = .white
headerLabel.alpha = 0.0

let smallHeaderLabel = UILabel(frame: .zero)
smallHeaderLabel.text = "Catalina"
smallHeaderLabel.font = UIFont.boldSystemFont(ofSize: 80.0)
smallHeaderLabel.textColor = .white
smallHeaderLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
smallHeaderLabel.shadowColor = UIColor.black.withAlphaComponent(0.2)
smallHeaderLabel.alpha = 0.0

let textStackView = UIStackView(arrangedSubviews: [headerLabel, smallHeaderLabel])
textStackView.alignment = .center
textStackView.distribution = .fill
textStackView.axis = .vertical
textStackView.translatesAutoresizingMaskIntoConstraints = false

containerView.addSubview(imageView)
containerView.addSubview(textStackView)

NSLayoutConstraint.activate([
    NSLayoutConstraint.init(item: textStackView, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1.0, constant: .zero),
    NSLayoutConstraint.init(item: textStackView, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: .zero)
])

UIView.animate(withDuration: 2.0, animations: {
    let scale = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
    imageView.transform = scale
}) { (_) in
    // Animation with Spring velocity
    UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
        headerLabel.frame.origin.y = headerLabel.frame.origin.y - 20
        headerLabel.alpha = 1.0
    }, completion: nil)
    
    UIView.animate(withDuration: 2.0, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
        smallHeaderLabel.frame.origin.y = smallHeaderLabel.frame.origin.y - 30
        smallHeaderLabel.alpha = 1.0
    }, completion: nil)
}


PlaygroundPage.current.liveView = containerView

