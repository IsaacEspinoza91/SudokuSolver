
sudoku([
    [5, 3, _, _, 7, _, _, _, _],
    [6, _, _, 1, 9, 5, _, _, _],
    [_, 9, 8, _, _, _, _, 6, _],
    [8, _, _, _, 6, _, _, _, 3],
    [4, _, _, 8, _, 3, _, _, 1],
    [7, _, _, _, 2, _, _, _, 6],
    [_, 6, _, _, _, _, 2, 8, _],
    [_, _, _, 4, 1, 9, _, _, 5],
    [_, _, _, _, 8, _, _, 7, 9]
]).

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



%suma 45 que locura
horizontalCompleto(LIST):-
    verificarUnicoNum(LIST,1),verificarUnicoNum(LIST,2),verificarUnicoNum(LIST,3),
    verificarUnicoNum(LIST,4),verificarUnicoNum(LIST,5),verificarUnicoNum(LIST,6),
    verificarUnicoNum(LIST,7),verificarUnicoNum(LIST,8),verificarUnicoNum(LIST,9).

todoHorizontalCompleto([]).
todoHorizontalCompleto([CAB_Sudoku|COLA]):-horizontalCompleto(CAB_Sudoku),todoHorizontalCompleto(COLA).



verificarUnicoNum(Lista,N):-verificarUnicoNum(Lista,N,false).
verificarUnicoNum([],_,true).
verificarUnicoNum([X|COLA],N,Existe):- X==N, Existe==false ,verificarUnicoNum(COLA,N,true),!.
verificarUnicoNum([X|_],N,Existe):- X==N, Existe==true,false,!.
verificarUnicoNum([X|COLA],N,Existe):- X\=N, verificarUnicoNum(COLA,N,Existe).




%sumar elementos lista
sum([],0):-!.
sum([X|Y],R):-sum(Y,R1),R is R1+X.

su(LISTA,RESUL):-su(LISTA,0,RESUL).
su([],AC,AC).
su([X|Y],ACUM,R):-AC1 is ACUM+X,su(Y,AC1,R) .


