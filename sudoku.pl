
sudoku([
    [5, 3, 4, 6, 7, 8, 9, 1, 2],
    [6, 7, 2, 1, 9, 5, 3, 4, 8],
    [1, 9, 8, 3, 4, 2, 5, 6, 7],
    [8, 5, 9, 7, 6, 1, 4, 2, 3],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
    [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 6, 1, 5, 3, 7, 2, 8, 4],
    [2, 8, 7, 4, 1, 9, 6, 3, 5],
    [3, 4, 5, 2, 8, 6, 1, 7, 9]
]).



/* Verificar que todo una fila (horizontal) tenga numeros sin repetir
DOM: lista (LIST)
REC: bool */
horizontalCompleto(LIST):-
    verificarUnicoNum(LIST,1),verificarUnicoNum(LIST,2),verificarUnicoNum(LIST,3),
    verificarUnicoNum(LIST,4),verificarUnicoNum(LIST,5),verificarUnicoNum(LIST,6),
    verificarUnicoNum(LIST,7),verificarUnicoNum(LIST,8),verificarUnicoNum(LIST,9).

/* Verificar que todas las fila (horizontal) de una estructura Sudoku tenga numeros sin repetir
DOM: estructura Sudoku (Lista X Lista)
REC: bool */
todoHorizontalCompleto([]).
todoHorizontalCompleto([CAB_Sudoku|COLA]):-horizontalCompleto(CAB_Sudoku),todoHorizontalCompleto(COLA).


/* Verificacion de que una lista tenga una sola vez un numero N ingresado
DOM: lista (LIST) X n (num)
REC: bool */
verificarUnicoNum(Lista,N):-verificarUnicoNum(Lista,N,false).
verificarUnicoNum([],_,true).
verificarUnicoNum([X|COLA],N,Existe):- X==N, Existe==false ,verificarUnicoNum(COLA,N,true),!.
verificarUnicoNum([X|_],N,Existe):- X==N, Existe==true,false,!.
verificarUnicoNum([X|COLA],N,Existe):- X\=N, verificarUnicoNum(COLA,N,Existe).




/* Verificacion de que todas las columnas (verticales) de una estructura Sudoku tengan numeros sin repetidos
DOM: estructura Sudoku (Lista X Lista)
REC: bool */
todoVerticalCompleto([[],[],[],[],[],[],[],[],[]]).
todoVerticalCompleto([[C1|COLA1],[C2|COLA2],[C3|COLA3],[C4|COLA4],[C5|COLA5],[C6|COLA6],[C7|COLA7],[C8|COLA8],[C9|COLA9]]):-
    horizontalCompleto([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
    todoVerticalCompleto([COLA1,COLA2,COLA3,COLA4,COLA5,COLA6,COLA7,COLA8,COLA9]).



/* Verificacion sudoku correctamente resuelto
DOM: estructura Sudoku (Lista X Lista)
REC: bool */
sudokuResuelto(SUDO):-todoHorizontalCompleto(SUDO),todoVerticalCompleto(SUDO).



/* Insertar un numero entre 1 y 9 en las variables de una lista
DOM: lista con variables (LIST) X variable lista salida (var)
REC: lista completa de numeros (LIST) */
insertarNum([X|COLA1],[Y|COLA2]):- var(X), % verificamos que es variable
    between(1,9,Y), % Unifica la var Y con un numero entre 1 y 9
    insertarNum(COLA1,COLA2).
insertarNum([X|COLA1],[X|COLA2]):- number(X), %verificamos que es numero
    insertarNum(COLA1,COLA2).
insertarNum([],[]).



%insertarNumSinRepeFILA(F,RESUL):-insertarNum(F,RESUL),horizontalCompleto(RESUL).
/* Insertar numeros faltantes en todo las listas de la estructura del sudoku
DOM: estructura Sudoku (Lista X Lista) X variable Sudoku salida (var)
REC: estructura Sudoku (Lista X Lista) */
todoInsertar([],[]).
todoInsertar([CAB|COLA],[RE|COLA1]):-insertarNum(CAB,RE),horizontalCompleto(RE),todoInsertar(COLA,COLA1).

resolver(SUDO,R1):-todoInsertar(SUDO,R1),todoVerticalCompleto(R1).