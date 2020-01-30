require 'bundler'
Bundler.require
$:.unshift File.expand_path("./lib", __FILE__)
require_relative 'lib/jeu'


def perform
  jouer = true

  while (jouer == true)
    system("clear")
    jeu = Jeu.new
    jeu.morpion.afficher_morpion  
    etat_du_jeu = 0
    while(etat_du_jeu == 0)
      puts "Ceci est le tour N.#{jeu.nombre_de_tours}\n"
      etat_du_jeu = jeu.jouer_tour
      sleep(1)
      jeu.morpion.afficher_morpion
    end
    puts "Le jeu est termine."
    jeu.afficher_message_fin(etat_du_jeu)
    puts "\n\nVoudriez-vous rejouer ?\n'o' pour oui, 'n' pour non"
    if (gets.chomp != 'o')
      jouer = false
    end
  end
  puts"\n\n A bientot!"
end

perform