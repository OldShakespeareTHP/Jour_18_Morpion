class Morpion
  attr_accessor :morpion_affichage, :morpion_valeurs, :case_1

  def initialize
    @morpion_valeurs = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    @case_1 = " "
    @morpion_affichage ="
                             1     2     3
                          ╔═════╦═════╦═════╗
                        A ║  #{@morpion_valeurs[0][0]}  ║  #{@morpion_valeurs[0][1]}  ║  #{@morpion_valeurs[0][2]}  ║
                          ╠═════╬═════╬═════╣
                        B ║  #{@morpion_valeurs[1][0]}  ║  #{@morpion_valeurs[1][1]}  ║  #{@morpion_valeurs[1][2]}  ║
                          ╠═════╬═════╬═════╣
                        C ║  #{@morpion_valeurs[2][0]}  ║  #{@morpion_valeurs[2][1]}  ║  #{@morpion_valeurs[2][2]}  ║
                          ╚═════╩═════╩═════╝"
  end

  def afficher_morpion
    system("clear")
    en_tete = "

#   __       __   ______   _______   _______   ______   ______   __    __ 
#  /  \     /  | /      \ /       \ /       \ /      | /      \ /  \  /  |
#  $$  \   /$$ |/$$$$$$  |$$$$$$$  |$$$$$$$  |$$$$$$/ /$$$$$$  |$$  \ $$ |
#  $$$  \ /$$$ |$$ |  $$ |$$ |__$$ |$$ |__$$ |  $$ |  $$ |  $$ |$$$  \$$ |
#  $$$$  /$$$$ |$$ |  $$ |$$    $$< $$    $$/   $$ |  $$ |  $$ |$$$$  $$ |
#  $$ $$ $$/$$ |$$ |  $$ |$$$$$$$  |$$$$$$$/    $$ |  $$ |  $$ |$$ $$ $$ |
#  $$ |$$$/ $$ |$$ \__$$ |$$ |  $$ |$$ |       _$$ |_ $$ \__$$ |$$ |$$$$ |
#  $$ | $/  $$ |$$    $$/ $$ |  $$ |$$ |      / $$   |$$    $$/ $$ | $$$ |
#  $$/      $$/  $$$$$$/  $$/   $$/ $$/       $$$$$$/  $$$$$$/  $$/   $$/ 
#                                                                         
    "
    puts en_tete
    puts @morpion_affichage

    puts "\n\n\n\n\n\n"
  end

  def case_disponible?(x, y)#ex : 0, 1
    @morpion_valeurs[x][y] == " " ? true : false
  end

  #Je dois "reactualiser" la variable morpion_affichage quand je change une des valeurs
  def changer_case(x, y, signe)
    @morpion_valeurs[x][y] = signe
    @morpion_affichage ="
                             1     2     3
                          ╔═════╦═════╦═════╗
                        A ║  #{@morpion_valeurs[0][0]}  ║  #{@morpion_valeurs[0][1]}  ║  #{@morpion_valeurs[0][2]}  ║
                          ╠═════╬═════╬═════╣
                        B ║  #{@morpion_valeurs[1][0]}  ║  #{@morpion_valeurs[1][1]}  ║  #{@morpion_valeurs[1][2]}  ║
                          ╠═════╬═════╬═════╣
                        C ║  #{@morpion_valeurs[2][0]}  ║  #{@morpion_valeurs[2][1]}  ║  #{@morpion_valeurs[2][2]}  ║
                          ╚═════╩═════╩═════╝"
  end

  #Test tous les cas de win possibles
  def est_termine?(signe)
    ret = false
    if @morpion_valeurs.flatten.count(signe) >= 3 #Ne verifie que s'il y a au moins 3 cases d'un meme signe
      @morpion_valeurs.each do |row| #Verifie les lignes
        if (row.count(signe) == 3)
          ret = true
        end
      end
      if(@morpion_valeurs[1][1] == signe && ((@morpion_valeurs[0][0] == signe && @morpion_valeurs[2][2] == signe) || (@morpion_valeurs[0][2] == signe && @morpion_valeurs[2][0] == signe)))#Verifie les 2 diagonales
        ret = true
      end
      ary_temp = @morpion_valeurs.flatten
      3.times do |i|
        if ary_temp[i] == signe && ary_temp[i + 3] == signe && ary_temp[i + 6] = signe #Verifie les colonnes (je prefere faire comme ca que faire 2 boucles pour un si petit tableau)
        ret = true
       end
      end
    end
  return ret
  end
end
