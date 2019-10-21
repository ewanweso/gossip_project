Pour tester cette Gossip App, faire `bundle install` puis lancer `shotgun -p 4567` dans le terminal. Puis rendez-vous sur `http://localhost:4567/`.

Version de Ruby utilisée 2.5.1

--------

<h2>Gossip</h2>

En quelques mots, ce projet web permet à n'importe qui de créer un Gossip (potin), qui est constitué d'un auteur et d'un contenu. La page d'accueil affiche tous les Gossips et un bouton pour créer un nouveau Gossip. Il est possible d'aller sur la page de chaque Gossip, de le modifier, de le commenter et de voir les commentaires. 

<b>Fonctionnement</b>

* `config.ru` : qui fait tourner le controller.
* `Controller` : utilise une url pour appeler les actions et les vues correspondantes. Transmet les données utiles pour une action spécifique (créer, lire, modifier) et fait le lien entre `views` et `models`.
* `Gossip` : c'est un `model` qui a comme attributs un `author` et un `content`. C'est ce fichier qui fait le lien avec notre base de données (pour save ou edit un gossip par exemple).
* `Comment` : c'est un `model` qui a comme attributs un `comment_author`, un `comment_content` et un `gossip_id` qui nous permet ici de lier un commentaire à un `Gossip` en particulier. Egalement, fait le lien avec notre base de données pour les commentaires.
* `views` : nos fichiers en `.erb` qui permettent d'afficher et de mettre en forme le contenu que l'utilisateur voit, tout en mettant du ruby et des variables.
* `gossip.csv` et `comment.csv` : nos fichiers bases de données.

<b>Objectif</b>

Manipulier les différents éléments d'une architecture MVC (Mode, View, Controller) pour bien comprendre le rôle de chacun, les interactions entre les fichiers, avec la base de données, avec les urls. Comprendre le fonctionnement pour appréhender sa mise en place dans des projets de plus grande envergure.

--------

Fait en utilisant les ressources de <a href="https://www.thehackingproject.org" target="_blank">The Hacking Project</a>
