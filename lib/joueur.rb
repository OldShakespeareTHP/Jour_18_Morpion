class Joueur
  attr_reader :name, :signe

  def initialize(nom_du_joueur, signe_du_joueur)
    @name = nom_du_joueur
    @signe = signe_du_joueur
  end

  #Le regex c'est :
  #
  def choisir_case
    puts "Choisissez votre case #{self.name}"
    while ((case_choisie = gets.chomp) !~ /^[\t" "]*[A-C][1-3][\t" "]*$/i)
      puts "Cette case est invalide !"
    end
    case_choisie.upcase!
    return case_choisie
  end
end

