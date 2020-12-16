//
//  MovieRepository.swift
//  challenger_movies
//
//  Created by Ricardo Martins on 15/12/20.
//

import Foundation
import UIKit

class MovieRepository{
    
    static func getAllMovies() -> Array<Movie>
    {
        let movie1 = Movie(image_background: #imageLiteral(resourceName: "selena"), image_main: #imageLiteral(resourceName: "selena"), title: "Selena", category: "Drama", description: "Na adolescência, a cantora americana de origem mexicana Selena precisa fazer escolhas difíceis junto com sua família em nome do amor e da música.")
        
        let movie2 = Movie(image_background: #imageLiteral(resourceName: "the_boys"), image_main: #imageLiteral(resourceName: "the_boys"), title: " The Boys ", category: "Sci-Fi & Fantasy, Action & Adventure", description: "Na trama, conhecemos um mundo em que super-heróis são as maiores celebridades do planeta, e rotineiramente abusam dos seus poderes ao invés de os usarem para o bem..")
        
        let movie3 = Movie(image_background: #imageLiteral(resourceName: "bob"), image_main: #imageLiteral(resourceName: "bob"), title: "Bob Esponja: O Incrível Resgate", category: " Animação, Fantasia, Aventura, Comédia, Família ", description: "Onde está Gary? Segundo Bob Esponja, Gary foi (caracolstrado) pelo temível Rei Poseidon e levado para a cidade perdida de Atlantic City. Junto a Patrick Estrela, ele sai em uma missão de resgate ao querido amigo, e nesta jornada os dois vão conhecer novos personagens e viver inimagináveis aventuras.")
        
        let movie4 = Movie(image_background: #imageLiteral(resourceName: "simpsons"), image_main: #imageLiteral(resourceName: "simpsons"), title: "Os Simpsons ", category: " Animação, Comédia, Família, Drama ", description: "A família Simpsons mora na cidade de Springfield, uma cidade americana como qualquer outra. Homer trabalha como inspetor de segurança numa usina de energia nuclear. Marge tenta manter a paz em sua família. Bart é um travesso garoto de 10 anos. Lisa, 8, é a inteligente da família, que adora tocar saxofone e é vegetariana. E a pequena Maggie conquista todos enquanto não larga sua chupeta. E a série tem um rico, e muitas vezes estranho, universo de personagens que também habitam Springfield. Com roteiros inteligentes, humor subversivo e divertidamente genial, a série faz piadas de si mesma e de todo mundo que aparecer em seu caminho.")
        
        let movie5 = Movie(image_background: #imageLiteral(resourceName: "mandalorian"), image_main: #imageLiteral(resourceName: "mandalorian"), title: "The Mandalorian", category: " Sci-Fi & Fantasy, Action & Adventure ", description: "A saga de um guerreiro solitário, que também é um mercenário e pistoleiro, viajando pelos territórios esquecidos e marginais do espaço, logo após a queda do Império e antes da criação da temida Primeira Ordem.")
        
        let movie6 = Movie(image_background: #imageLiteral(resourceName: "greys_anatomy"), image_main: #imageLiteral(resourceName: "greys_anatomy"), title: "Grey's Anatomy", category: "Drama", description: "Os médicos do Grey Sloan Memorial Hospital lidam diariamente com casos e consequências de vida ou morte. É um no outro que eles encontram apoio, conforto, amizade e, às vezes, até mais que amizade... Juntos, eles descobrem o quanto a vida profissional e a pessoal podem ser complicadas e se misturarem no meio do caminho.")
        
        return [movie1, movie2, movie3, movie4, movie5, movie6]
    }
}
