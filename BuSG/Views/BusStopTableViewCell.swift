//
//  BusStopTableViewCell.swift
//   BuSG
//
//  Created by Ryan The on 4/12/20.
//

import UIKit

class BusStopTableViewCell: UITableViewCell {
    
    public lazy var busStopCodeLabel = UILabel()
    public lazy var roadDescLabel = UILabel()
    public lazy var roadNameLabel = UILabel()
    public lazy var distanceLabel = UILabel()
    private lazy var sequenceCircleShape = { () -> CAShapeLayer in
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: bounds.width-K.margin.large*2, y: frame.height/2), radius: 12, startAngle: 0, endAngle: 360, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.accent.cgColor
        shapeLayer.lineWidth = 4
        return shapeLayer
    }()
    private lazy var busServicesLabel = UILabel()
    
    public var busServices: [BusService] = [] {
        didSet {
            busServicesLabel.text = busServices.map({ $0.serviceNo }).joined(separator: "  ")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(roadDescLabel)
        roadDescLabel.font = .medium
        roadDescLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roadDescLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.margin.large),
            roadDescLabel.topAnchor.constraint(equalTo: topAnchor, constant: K.margin.small),
        ])
        
        addSubview(busStopCodeLabel)
        busStopCodeLabel.font = .detail
        busStopCodeLabel.textColor = .secondaryLabel
        busStopCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            busStopCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.margin.large),
            busStopCodeLabel.topAnchor.constraint(equalTo: roadDescLabel.bottomAnchor, constant: K.margin.small),
        ])
        
        addSubview(roadNameLabel)
        roadNameLabel.font = .detail
        roadNameLabel.textColor = .secondaryLabel
        roadNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roadNameLabel.leadingAnchor.constraint(equalTo: busStopCodeLabel.trailingAnchor, constant: K.margin.small),
            roadNameLabel.topAnchor.constraint(equalTo: roadDescLabel.bottomAnchor, constant: K.margin.small),
        ])
        
        addSubview(busServicesLabel)
        busServicesLabel.font = .detail
        busServicesLabel.textColor = .accent
        busServicesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            busServicesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.margin.large),
            busServicesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.margin.large),
            busServicesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -K.margin.small),
        ])
        
        addSubview(distanceLabel)
        distanceLabel.font = .detail
        distanceLabel.textColor = .secondaryLabel
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            distanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.margin.large),
            distanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: K.margin.small),
        ])
        
//        layer.addSublayer(sequenceCircleShape)

        backgroundColor = .clear
        selectedBackgroundView = FillView(solidWith: UIColor.label.withAlphaComponent(0.1))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        sequenceCircleShape.bounds = CGRect(x: bounds.width-K.margin.large*2, y: frame.height/2, width: 0, height: 0)
    }
}
