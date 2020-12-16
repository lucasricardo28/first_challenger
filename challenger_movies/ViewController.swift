//
//  ViewController.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 14/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var scrollViewPresentation: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: VARS
    var slides:[Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollViewPresentation.delegate = self
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [Slide]
    {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imagePrincipal.image = UIImage(named: "bob")
        slide1.labelName.text = "Bob Esponja: O Incrível Resgate"
        slide1.labelDescription.text = "Onde está Gary? Segundo Bob Esponja, Gary foi (caracolstrado) pelo temível Rei Poseidon e levado para a cidade perdida de Atlantic City. Junto a Patrick Estrela, ele sai em uma missão de resgate ao querido amigo, e nesta jornada os dois vão conhecer novos personagens e viver inimagináveis aventuras."
            
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imagePrincipal.image = UIImage(named: "selena")
        slide2.labelName.text = "Selena: A Série"
        slide2.labelDescription.text = "Na adolescência, a cantora americana de origem mexicana Selena precisa fazer escolhas difíceis junto com sua família em nome do amor e da música."
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imagePrincipal.image = UIImage(named: "mandalorian")
        slide3.labelName.text = "The Mandalorian"
        slide3.labelDescription.text = "A saga de um guerreiro solitário, que também é um mercenário e pistoleiro, viajando pelos territórios esquecidos e marginais do espaço, logo após a queda do Império e antes da criação da temida Primeira Ordem."
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imagePrincipal.image = UIImage(named: "simpsons")
        slide4.labelName.text = "Os Simpsons "
        slide4.labelDescription.text = "A família Simpsons mora na cidade de Springfield, uma cidade americana como qualquer outra. Homer trabalha como inspetor de segurança numa usina de energia nuclear. Marge tenta manter a paz em sua família. Bart é um travesso garoto de 10 anos. Lisa, 8, é a inteligente da família, que adora tocar saxofone e é vegetariana. E a pequena Maggie conquista todos enquanto não larga sua chupeta. E a série tem um rico, e muitas vezes estranho, universo de personagens que também habitam Springfield. Com roteiros inteligentes, humor subversivo e divertidamente genial, a série faz piadas de si mesma e de todo mundo que aparecer em seu caminho."
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imagePrincipal.image = UIImage(named: "the_boys")
        slide5.labelName.text = "The Boys"
        slide5.labelDescription.text = "Na trama, conhecemos um mundo em que super-heróis são as maiores celebridades do planeta, e rotineiramente abusam dos seus poderes ao invés de os usarem para o bem.n"
            
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollViewPresentation.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollViewPresentation.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollViewPresentation.isPagingEnabled = true
       
       for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollViewPresentation.addSubview(slides[i])
       }
        
    }
}

extension ViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
//        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
    
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imagePrincipal.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imagePrincipal.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imagePrincipal.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imagePrincipal.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imagePrincipal.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imagePrincipal.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imagePrincipal.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imagePrincipal.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
}

