-- Vamos a crear un procedimineto llamado ACTUALIZAR_RESULTADO con los parametros de entrada Y debera actualizar el campo de la tabla partidos
--  y todos los campos excepto el puesto de la tabla equipos
use liga;
DELIMITER // 
DROP PROCEDURE IF EXISTS ACTUALIZAR_RESULTADO// 
CREATE PROCEDURE ACTUALIZAR_RESULTADO(IN P_ID_LOCAL INT,
                                      IN P_ID_VISITANTE INT,
									  IN P_MARCADOR_LOCAL INT,
                                      IN P_MARCADOR_VISITANTE INT)
begin

    -- PRIMER PASO QUE DAMOS ES ACTUALIZAR LOS MARCADORES, DE AMBOS EQUIPOS, TANTO LOCAL COMO VISITANTES, CON LOS DATOS INGRESADOS
     UPDATE PARTIDOS
            SET MARCADOR_LOCAL = P_MARCADOR_LOCAL,
                MARCADOR_VISITANTE= P_MARCADOR_VISITANTE
            WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;
            
     -- SEGUNDO PASO ACTUALIZAR EL CAMPO RESULTADO 
     
       -- --------------------------------EMPATE ENTRE LOS EQUIPOS-------------------------------------------------   
      CASE 
          WHEN P_MARCADOR_LOCAL = P_MARCADOR_VISITANTE THEN
               UPDATE PARTIDOS
                      SET RESULTADO = 'E'
                      WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;
               UPDATE EQUIPOS    
                      SET P_EMPATADOS = P_EMPATADOS + 1,
                          P_JUGADOS = P_JUGADOS + 1,
                          PUNTOS = PUNTOS + 1
                      WHERE ID_EQUIPO = P_ID_LOCAL AND ID_EQUIPO = P_ID_VISITANTE;
               UPDATE EQUIPOS
                      SET G_FAVOR = G_FAVOR + P_MARCADOR_LOCAL,
                          G_CONTRA = G_CONTRA + P_MARCADOR_VISITANTE
                      WHERE ID_EQUIPO = P_ID_LOCAL ;
               UPDATE EQUIPOS
                      SET G_FAVOR = G_FAVOR + P_MARCADOR_VISITANTE,
                          G_CONTRA = G_CONTRA + P_MARCADOR_LOCAL
                      WHERE ID_EQUIPO = P_ID_VISITANTE;   
                      
                      
  -- --------------------------------GANADOR VISITANTE-------------------------------------------------  
  
  
          WHEN P_MARCADOR_LOCAL < P_MARCADOR_VISITANTE THEN
               UPDATE PARTIDOS
                      SET RESULTADO = 'V'
                      WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;                      
               UPDATE EQUIPOS
                      SET G_FAVOR = G_FAVOR + P_MARCADOR_LOCAL,
                          G_CONTRA = G_CONTRA + P_MARCADOR_VISITANTE,
                          P_PERDIDOS = P_PERDIDOS + 1,
                          P_JUGADOS = P_JUGADOS + 1
                      WHERE ID_EQUIPO = P_ID_LOCAL ;
                UPDATE EQUIPOS
                      SET G_FAVOR = G_FAVOR + P_MARCADOR_VISITANTE,
                          G_CONTRA = G_CONTRA + P_MARCADOR_LOCAL, 
                          P_GANADOS = P_GANADOS +1,
                          PUNTOS = PUNTOS +3
                       WHERE ID_EQUIPO = P_ID_VISITANTE;    
                       
    -- --------------------------------GANADOR LOCAL-------------------------------------------------                     
          
          WHEN P_MARCADOR_LOCAL > P_MARCADOR_VISITANTE THEN
               UPDATE PARTIDOS
                      SET RESULTADO = 'L'
                      WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;                 
               UPDATE EQUIPOS
                      SET G_FAVOR = G_FAVOR + P_MARCADOR_LOCAL,
                          G_CONTRA = G_CONTRA + P_MARCADOR_VISITANTE,
                          P_GANADOS = P_GANADOS + 1,
                          PUNTOS = PUNTOS + 3
                      WHERE ID_EQUIPO = P_ID_LOCAL ;
                UPDATE EQUIPOS
                      SET G_FAVOR = G_FAVOR + P_MARCADOR_VISITANTE,
                          G_CONTRA = G_CONTRA + P_MARCADOR_LOCAL,
                          P_PERDIDOS = P_PERDIDOS  + 1,
                          P_JUGADOS = P_JUGADOS + 1
                      WHERE ID_EQUIPO = P_ID_VISITANTE;
               
          
      END CASE;    
      
end
//