//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Kerry Toonen on 2016-02-18.
//  Copyright © 2016 Lighthouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Mark : Properties
    
    var animator:UIDynamicAnimator?
    
    var snapBehaviour:UISnapBehavior?
    
    var initialAddPosition: CGAffineTransform?
    
    var isExpanded: Bool = false
    
    var imageNameArray: [String]? = []
    
    
    
    //Mark: Image Properties
    
    var stackView: UIStackView?
    
    var oreosImageView: UIImageView?
    
    var poptartsImageView: UIImageView?
    
    @IBOutlet weak var tableView: UITableView!
    
    var pizzaPocketsImageView: UIImageView?
    
    var popsicleImageView: UIImageView?
    
    var ramenImageView: UIImageView?
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var navBarView: UIView!
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            self.initialAddPosition = addButton.transform
        }
    }
    
    @IBAction func addButtonAction(sender: AnyObject) {
        self.isExpanded = !self.isExpanded
        
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
            if self.isExpanded {
                self.addButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
                self.heightConstraint.constant = 200
                
                
                
            } else {
                self.addButton.transform = self.initialAddPosition!
                self.heightConstraint.constant = 66
            }
            self.stackView?.hidden = !self.isExpanded
            self.view.layoutIfNeeded()
            
        }), completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStackView()
        
        
    }
    
    
    private func getImageViews() {
        
        self.oreosImageView = UIImageView()
        self.pizzaPocketsImageView = UIImageView()
        self.popsicleImageView = UIImageView()
        self.ramenImageView = UIImageView()
        self.poptartsImageView = UIImageView()
        
        
        let oreosImageName = "oreos.png"
        let oreosImage = UIImage(named: oreosImageName)
        self.oreosImageView! = UIImageView(image:oreosImage)
        self.oreosImageView!.userInteractionEnabled = true
        self.oreosImageView!.tag = 1
        self.oreosImageView!.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"imageTapped:"))
        
        oreosImageView!.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        navBarView.addSubview(oreosImageView!)
        
        oreosImageView!.heightAnchor.constraintEqualToConstant(50).active = true;
        oreosImageView!.widthAnchor.constraintEqualToConstant(50).active = true;
        
        
        let pizzaPocketsImageName = "pizza_pockets.png"
        let pizzaPocketsImage = UIImage(named: pizzaPocketsImageName)
        self.pizzaPocketsImageView = UIImageView(image: pizzaPocketsImage)
        self.pizzaPocketsImageView!.userInteractionEnabled = true
        self.pizzaPocketsImageView!.tag = 2
        self.pizzaPocketsImageView!.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"imageTapped:"))
        
        
        pizzaPocketsImageView!.frame = CGRect(x: 60, y: 0, width: 50, height: 100)
        navBarView.addSubview(pizzaPocketsImageView!)
        
        pizzaPocketsImageView!.heightAnchor.constraintEqualToConstant(50).active = true;
        pizzaPocketsImageView!.widthAnchor.constraintEqualToConstant(50).active = true;
        
        let poptartsImageName = "pop_tarts.png"
        let poptartsImage = UIImage(named: poptartsImageName)
        self.poptartsImageView = UIImageView(image: poptartsImage)
        self.poptartsImageView!.userInteractionEnabled = true
        self.poptartsImageView!.tag = 3
        self.poptartsImageView!.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"imageTapped:"))
        
        
        poptartsImageView!.frame = CGRect(x: 120, y: 0, width: 50, height: 100)
        navBarView.addSubview(poptartsImageView!)
        
        poptartsImageView!.heightAnchor.constraintEqualToConstant(50).active = true;
        poptartsImageView!.widthAnchor.constraintEqualToConstant(50).active = true;
        
        let popsicleImageName = "popsicle.png"
        let popsicleImage = UIImage(named: popsicleImageName)
        self.popsicleImageView = UIImageView(image: popsicleImage)
        self.popsicleImageView!.userInteractionEnabled = true
        self.popsicleImageView!.tag = 4
        self.popsicleImageView!.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"imageTapped:"))
        
        popsicleImageView!.frame = CGRect(x: 180, y: 0, width: 50, height: 100)
        navBarView.addSubview(popsicleImageView!)
        
        popsicleImageView!.heightAnchor.constraintEqualToConstant(50).active = true;
        popsicleImageView!.widthAnchor.constraintEqualToConstant(50).active = true;
        
        let ramenImageName = "ramen.png"
        let ramenImage = UIImage(named: ramenImageName)
        self.ramenImageView = UIImageView(image: ramenImage)
        self.ramenImageView!.userInteractionEnabled = true
        
        self.ramenImageView!.tag = 5
        self.ramenImageView!.addGestureRecognizer(UITapGestureRecognizer(target:self, action:"imageTapped:"))
        
        ramenImageView!.frame = CGRect(x: 240, y: 0, width: 50, height: 100)
        navBarView.addSubview(ramenImageView!)
        
        ramenImageView!.heightAnchor.constraintEqualToConstant(50).active = true;
        ramenImageView!.widthAnchor.constraintEqualToConstant(50).active = true;
    }
    
    
    
    private func setStackView() {
        
        getImageViews()
        stackView = UIStackView()
        
        self.stackView!.axis  = UILayoutConstraintAxis.Horizontal
        self.stackView!.distribution  = UIStackViewDistribution.EqualSpacing
        self.stackView!.alignment = UIStackViewAlignment.Center
        self.stackView!.spacing   = 10
        
        self.stackView!.addArrangedSubview(oreosImageView!)
        self.stackView!.addArrangedSubview(pizzaPocketsImageView!)
        self.stackView!.addArrangedSubview(poptartsImageView!)
        self.stackView!.addArrangedSubview(popsicleImageView!)
        self.stackView!.addArrangedSubview(ramenImageView!)
        
        
        self.stackView!.translatesAutoresizingMaskIntoConstraints = false;
        
        self.navBarView.addSubview(self.stackView!)
        
        self.stackView!.hidden = !isExpanded
        
        //Constraints
        self.stackView!.centerXAnchor.constraintEqualToAnchor(self.navBarView.centerXAnchor).active = true
        self.stackView!.centerYAnchor.constraintEqualToAnchor(self.navBarView.centerYAnchor).active = true
    }
    
    func imageTapped(img: UITapGestureRecognizer)
    {
        
        var snackName: String?
        
        if img.view?.tag == self.oreosImageView?.tag {
            snackName = "Oreos"
        }
        
        if img.view?.tag == self.poptartsImageView?.tag {
            snackName = "Poptarts"

        }
        
        if img.view?.tag == self.popsicleImageView?.tag {
            snackName = "Popsicle"
        }
        if img.view?.tag == self.ramenImageView?.tag {
            snackName = "Ramen"
        }
        if img.view?.tag == self.pizzaPocketsImageView?.tag {
            snackName = "Pizza Pockets"
        }
        
        self.imageNameArray?.insert(snackName!, atIndex: 0)
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }
    
    
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.imageNameArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SnackCellTableViewCell
        
        let snackName = imageNameArray![indexPath.row]
        
        cell.cellNameLabel.text = snackName
        //Table view cells are reused and should be dequeued using a cell identifier.
        
        return cell
    }
}













