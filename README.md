# Pong

Autor: Carlos Javier Martín Perdomo

Descripcion: Imitacion del clasico juego pong. Para esto se ha usado el software processing. El juego cuenta con la posibilidad de comenzar cada partida(Tecla de intro) y tambien de volver a empezar desde cero (tecla de retroceso). Todo esto es unicamente accesible desde el menu. Los controles para cada jugador son las teclas w y s  para el jugador de la izquierda (jugador 1) y las flechas arriba y abajo para el jugador de la derecha (jugador 2). Tambien se cuenta con un marcador. A continuaciuon una imagen del menu del juego:

![alt text](https://github.com/CarlosJavierMartin/Pong/blob/master/image.png?raw=true)



Decisiones de codigo:
- Primero Cree dos clases, player y ball. Estas clases tienen lo necesario para reprensentar a un jugador y una pelota respectivamente. 
- Lo siguiente fue crear un sistema de movimiento aleatorio para la pelota y los movimientos de los jugadores. Tuve complicaciones para el movimiento simultaneo pero pude arreglarlo.
- Luego cree el sistema de colision de la pelota con los bordes superior e inferior para el rebote. Con lo aprendido de esta colision cree ahora el sistema de colision pelota-jugador. Este sistema tiene la complicasion de la sincronizacion de movimiento pero se pudo solucionar facilmente. Ademas añadi un tipo de colision especial con las esquinas de los rectangulos de cada jugador y configure un aumento de velocidad adecuado y limitado. Tambien simultaneamiente añadi el sistema de puntuacion.
- Finalmente añadi un menu para mostrar la informacion de los controles.

Resultado de unas partidas:





Referencias:
- Musica y sonidos:
  - Original Tetris Theme (https://www.youtube.com/watch?v=NmCCQxVBfyM)
  - Pokemon emerald wall bump (https://www.sounds-resource.com/game_boy_advance/pokemonemerald/sound/4206/)
  - DBZ Instant Transmission Sound effect (https://www.youtube.com/watch?v=8sZnEYtn664)
- Fuente:
  - Bit 5x3 Font (http://www.mattlag.com/bitfonts/)
-Recursos de programación:
  - https://processing.org/reference/
