**MORPION**

Ce morpion est l'occasion d'appliquer ce que j'ai appris en programmation objet, en Ruby.


Il est organise de la maniere suivante :
```
  app.rb
  /lib/
    jeu.rb
    joueur.rb
    morpion.rb
  /spec/
    morpion_spec.rb
    spec_helper.rb
```

Le fichier app.rb permet de lancer le programme. Il contient une boucle utilisant la classe jeu.

Le fichier jeu.rb contient la plus grande partie du programme, les joueurs et le morpion y sont crees, et la methode joueur_tour permet de faire tourner le jeu. Voir le commentaire correspondant et le code pour plus d'information.

Le fichier joueur.rb permet de creer les 2 joueurs, et contient une seule methode pour permettre au joueur de choisir sa case.

Le fichier morpion.rb permet l'affichage du morpion, et le stockage des cases, il permet aussi de savoir si le jeu est termine, lorsque le morpion est complet ou qu'une ligne/colonne/diagonale est remplie.
