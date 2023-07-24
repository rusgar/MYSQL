-- Creamos un procedimiento para sacar el ganador de la partida segun la fecha de entrada  
DELIMITER //
drop procedure if exists obtener_ganador//
create procedure obtener_ganador( in P_Fecha date)
begin
        
     select resultado
     from partidas
     where fecha= P_fecha
     into @color_ganador;
     
     if @color_ganador = 'N' then
     select jugadores.jugador, jugadores.pais
     from jugadores inner join partidas on jugadores.id_jugador = partidas.id_jugador_N
     where partidas.fecha= p_fecha;
     
     elseif @color_ganador = 'B'then
      select jugadores.jugador, jugadores.pais
      from jugadores inner join partidas on jugadores.id_jugador = partidas.id_jugador_B
      where partidas.fecha= p_fecha;
     
     else
         select 'La partida termino en tabla' as 'No hay ningun ganador';
         
     end if; 
     END

//

call chess.obtener_ganador('20230719');
