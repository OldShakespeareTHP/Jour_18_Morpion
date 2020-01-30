# $:.unshift File.expand_path("./../lib", __FILE__) #Besoin de cette ligne ou on peut require direct dans le dossier couran ?
require 'pry'
require_relative 'joueur'
require_relative 'morpion'

class Jeu
  attr_accessor :joueur1, :joueur2, :morpion, :nombre_de_tours, :gagnant

  def initialize
    @joueur1 = creer_joueur('1', "\033[31m"+"X"+"\033[0m")
    @joueur2 = creer_joueur('2', "\033[34m"+"0"+"\033[0m")
    @morpion = Morpion.new
    @gagnant = nil
    @nombre_de_tours = 1
  end

  def creer_joueur(numero_joueur, signe_du_joueur)
    puts "Quel est ton nom joueur #{numero_joueur} ?"
    joueur = Joueur.new(gets.chomp, signe_du_joueur)
    puts "Vous aurez le signe #{joueur.signe} #{joueur.name}.\n\n"
    sleep(1)
    return joueur
  end

  def afficher_numero_tour
    puts @nombre_de_tours
  end

  #Pour qu'un tour se passe, 1.le choix de la case est converti en coordonnes, puis on 2. verifie la disponibilite de la case, 2.a si la case est occupee, on recommence. Ensuite, 3. on inscris le signe dans la case, et 4. on verifie si on a une win ou un match nul avant de 5. recommencer avec le joueur suivant
  def jouer_tour
    joueur = @joueur1 
    2.times do
      case_coordonnees = convertir_en_coordonnees(joueur.choisir_case)
      while((@morpion.case_disponible?(case_coordonnees[0], case_coordonnees[1])) == false)
        puts "Cette case est deja occupee."
        case_coordonnees = convertir_en_coordonnees(joueur.choisir_case)
      end
      @morpion.changer_case(case_coordonnees[0], case_coordonnees[1], joueur.signe)
      @morpion.afficher_morpion
      if (@morpion.est_termine?(joueur.signe) == true)
        @gagnant = joueur
        return 1
      elsif (morpion.morpion_valeurs.flatten.count(" ") == 0)
        return 2
      end
      joueur = @joueur2
      sleep(1)
    end
    @nombre_de_tours += 1
    return 0
  end

  def verifier_case(case_a_verifier)
    @morpion.case_disponible?()
  end

  #.ord ca convertir un caracter en valeur ascii
  #.chr ca convertie un nombre en son caractere correspondant dans la table ascii
  def convertir_en_coordonnees(case_a_convertir)#ex : "A2" -> "[0, 1]"
    ary_coordonnes = [(case_a_convertir[0].ord - 'A'.ord + '0'.ord).chr.to_i, (case_a_convertir[1].to_i) - 1]
  end

  def afficher_message_fin(etat_du_jeu)
    sleep(1)
    if (etat_du_jeu == 1)
      puts "Bien joue au joueur #{@gagnant.name}"
    elsif (etat_du_jeu == 2)
        puts "Ceci est un match nul !"
    end
    sleep(1)
  end
end
