# Pong

Autor: Carlos Javier Martín Perdomo

Descripción: Imitación del clásico juego pong. Para esto se ha usado el software processing. El juego cuenta con la posibilidad de comenzar cada partida(Tecla de intro) y también de volver a empezar desde cero (tecla de retroceso). Todo esto es únicamente accesible desde el menú. Los controles para cada jugador son las teclas w y s  para el jugador de la izquierda (jugador 1) y las flechas arriba y abajo para el jugador de la derecha (jugador 2). También se cuenta con un marcador. A continuación una imagen del menú del juego:

![alt text](https://github.com/CarlosJavierMartin/Pong/blob/master/image.png?raw=true)



Decisiones de código:
- Primero Cree dos clases, player y ball. Estas clases tienen lo necesario para representar a un jugador y una pelota respectivamente. 
- Lo siguiente fue crear un sistema de movimiento aleatorio para la pelota y los movimientos de los jugadores. Tuve complicaciones para el movimiento simultaneo pero pude arreglarlo.
- Luego cree el sistema de colisión de la pelota con los bordes superior e inferior para el rebote. Con lo aprendido de esta colisión cree ahora el sistema de colisión pelota-jugador. Este sistema tiene la complicación de la sincronización de movimiento pero se pudo solucionar fácilmente. Además añadí un tipo de colisión especial con las esquinas de los rectángulos de cada jugador y configuré un aumento de velocidad adecuado y limitado. También simultaneamente añadí el sistema de puntuación.
- Finalmente añadí un menú para mostrar la información de los controles.

Resultado:
![alt text](https://github.com/CarlosJavierMartin/Pong/blob/master/pong.gif?raw=true)

Acciones realizadas:
- Intro para empezar partida.
- Demostracion de distintas coslisiones
- Se ve brebemente pero se puede ver el marcador subir (pulsé retroceso muy rapidamente para resetear y que se viera el reset)

Referencias:
- Musica y sonidos:
  - Original Tetris Theme (https://www.youtube.com/watch?v=NmCCQxVBfyM)
  - Pokemon emerald wall bump (https://www.sounds-resource.com/game_boy_advance/pokemonemerald/sound/4206/)
  - DBZ Instant Transmission Sound effect (https://www.youtube.com/watch?v=8sZnEYtn664)
- Fuente:
  - Bit 5x3 Font (http://www.mattlag.com/bitfonts/)
- Recursos de programación:
  - https://processing.org/reference/
