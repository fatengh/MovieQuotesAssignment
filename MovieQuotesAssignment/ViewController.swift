//
//  ViewController.swift
//  MovieQuotesAssignment
//
//  Created by admin on 21/12/2021.
//

import UIKit

struct Movies{
    var name: String
    var image: UIImage
    var quotes: String
}


class ViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    var selectedMovies: [Movies] = []
      
     
      
      let movies: [Movies] = [
          Movies(name: "Movie1", image: UIImage(named: "faten")!, quotes: "hello this is movie number one"),
          Movies(name: "Movie2", image: UIImage(named: "tt1")!, quotes: "hello this is movie number 2"),
          Movies(name: "Movie3", image: UIImage(named: "tt5")!, quotes: "hello this is movie number 3"),
          Movies(name: "Movie4", image: UIImage(named: "tt7")!, quotes: "hello this is movie number 4"),
          Movies(name: "Movie5", image: UIImage(named: "tt2")!, quotes: "hello this is movie number 5"),
          Movies(name: "Movie6", image: UIImage(named: "faten")!, quotes: "hello this is movie number 6"),
          Movies(name: "Movie7", image: UIImage(named: "tt1")!, quotes: "hello this is movie number 7"),
          Movies(name: "Movie8", image: UIImage(named: "tt5")!, quotes: "hello this is movie number 8"),
          
      ]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        let swp = UISwipeGestureRecognizer(target: self, action: #selector(swpmethod(gesture: )))
                swp.direction = .left
                self.view.addGestureRecognizer(swp)
                

    
           }
    
    @IBAction func back(_ segue: UIStoryboardSegue ){
        
        
        }
    //to swip
    @objc func swpmethod(gesture: UISwipeGestureRecognizer){
        
          if selectedMovies.isEmpty == false{
              performSegue(withIdentifier: "MoveToNext", sender: self)
          }
          else{
              let alertDailog = UIAlertController(title: "You must choose movies", message: "", preferredStyle: .alert)
              
              alertDailog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              
              self.present(alertDailog, animated: true, completion: nil)
          }
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let destination = segue.destination as! GussingViewController

           for m in selectedMovies{
               destination.selectedMovies.append(m)
           }
       }


}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        
        if cell?.layer.borderWidth == 0{
            cell?.layer.borderColor = UIColor.white.cgColor
            cell?.layer.borderWidth = 4
            cell?.isSelected = true
            selectedMovies.append(movies[indexPath.row])
        }
        else{
            for i in 0..<selectedMovies.count{
                if selectedMovies[i].name == movies[indexPath.row].name && selectedMovies[i].image == movies[indexPath.row].image{
                    selectedMovies.remove(at: i)
                    cell?.layer.borderWidth = 0
                    cell?.isSelected = false
                }
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imgLebel.text = movies[indexPath.row].name
        cell.imageViewOutlet.image = movies[indexPath.row].image
       
        return cell
    }
    
    
}
