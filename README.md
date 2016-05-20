# model_sigmo

Création : Vendredi 20 Mai 2015, 10h42 heure de Paris

QF

Ce dossier contient tous les codes nécessaires au fonctionnement du modèle de remplacement sémantique. 
Le fichier sigmo_model_2.py contient le script principal, à faire tourner sous python. 
Ce script appelle la fonction no_memory_random_walk.pyx, une fonction cython qu'il est nécessaire de compiler avant utilisation. 
Pour ce faire, il faut utiliser la ligne de commande suivante :

python setup_cython.py build_ext --inplace

le script setup_cython.py étant inclus dans ce dossier. 

Il est également possible d'analyser le temps pris par chacune des lignes de la fonction en appelant le script suivant :

python profile_cython_function.py

On peut enfin visualiser le script en "C" de la fonction cython à l'aide des lignes de commande suivantes :

cython -a no_memory_random_walk_cython.pyx

firefox no_memory_random_walk_cython.html 






