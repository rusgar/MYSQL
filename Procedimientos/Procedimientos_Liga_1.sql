use liga;
DELIMITER // 
DROP PROCEDURE IF EXISTS ACTUALIZAR_RESULTADO_1// 
CREATE PROCEDURE ACTUALIZAR_RESULTADO_1(IN P_ID_LOCAL INT,
                                      IN P_ID_VISITANTE INT,
									  IN P_MARCADOR_LOCAL INT,
                                      IN P_MARCADOR_VISITANTE INT)
begin
-- ------------------------------- COMPROBACION QUE NO SE HAYA DISPUTADO EL PARTIDO---------------------------------
SELECT RESULTADO
	FROM PARTIDOS
    WHERE ID_LOCAL= P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE
    INTO @RESULTADO;
 
IF @RESULTADO <> 'E' AND @RESULTADO <> 'L' AND @RESULTADO <> 'V' THEN 

--  ------------ PRIMER PASO QUE DAMOS ES ACTUALIZAR LOS MARCADORES, DE AMBOS EQUIPOS, TANTO LOCAL COMO VISITANTES, CON LOS DATOS INGRESADOS-------------------
     UPDATE PARTIDOS
            SET MARCADOR_LOCAL = P_MARCADOR_LOCAL,
                MARCADOR_VISITANTE= P_MARCADOR_VISITANTE
            WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;
            
-- ------------------- SEGUNDO PASO ACTUALIZAR EL CAMPO RESULTADO --------------------------------------------------------------------------------------------
      CASE 
          WHEN P_MARCADOR_LOCAL = P_MARCADOR_VISITANTE THEN
               UPDATE PARTIDOS
                      SET RESULTADO = 'E'
                      WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;
                        
                
          WHEN P_MARCADOR_LOCAL < P_MARCADOR_VISITANTE THEN
               UPDATE PARTIDOS
                      SET RESULTADO = 'V'
                      WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;                      
                    
          
          WHEN P_MARCADOR_LOCAL > P_MARCADOR_VISITANTE THEN
               UPDATE PARTIDOS
                      SET RESULTADO = 'L'
                      WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;                 
               
               
          
      END CASE; 
      -- -------------------------------- EMPATE---------------------------------
      CASE 
      WHEN P_MARCADOR_LOCAL = P_MARCADOR_VISITANTE THEN
      UPDATE EQUIPOS    
             SET 
                 P_GANADOS = P_GANADOS + 0,
                 P_EMPATADOS = P_EMPATADOS + 1,
                 P_PERDIDOS = P_PERDIDOS + 0,
                 G_FAVOR = G_FAVOR + P_MARCADOR_LOCAL,
                 G_CONTRA = G_CONTRA + P_MARCADOR_VISITANTE, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +1
                 WHERE ID_EQUIPO = P_ID_LOCAL;
        UPDATE EQUIPOS    
             SET P_GANADOS = P_GANADOS + 0,
                 P_EMPATADOS = P_EMPATADOS + 1,
                 P_PERDIDOS = P_PERDIDOS + 0,
                 G_FAVOR = G_FAVOR + P_MARCADOR_VISITANTE,
                 G_CONTRA = G_CONTRA + P_MARCADOR_LOCAL, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +1 
                 WHERE ID_EQUIPO = P_ID_VISITANTE;    
                 
                 -- -------------------------------- LOCAL--------------------------------
       
      WHEN P_MARCADOR_LOCAL > P_MARCADOR_VISITANTE THEN
      UPDATE EQUIPOS    
             SET 
                 P_GANADOS = P_GANADOS + 1,
                 P_EMPATADOS = P_EMPATADOS + 0,
                 P_PERDIDOS = P_PERDIDOS + 0,
                 G_FAVOR = G_FAVOR + P_MARCADOR_LOCAL,
                 G_CONTRA = G_CONTRA + P_MARCADOR_VISITANTE, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +3
                 WHERE ID_EQUIPO = P_ID_LOCAL;
        UPDATE EQUIPOS    
             SET P_GANADOS = P_GANADOS + 0,
                 P_EMPATADOS = P_EMPATADOS + 0,
                 P_PERDIDOS = P_PERDIDOS + 1,               
                 G_FAVOR = G_FAVOR + P_MARCADOR_VISITANTE,
                 G_CONTRA = G_CONTRA + P_MARCADOR_LOCAL, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +0 
                 WHERE ID_EQUIPO = P_ID_VISITANTE; 
                 
                 -- -------------------------------- VISITANTE---------------------------------
      
      WHEN P_MARCADOR_LOCAL < P_MARCADOR_VISITANTE THEN
      UPDATE EQUIPOS    
             SET 
                 P_GANADOS = P_GANADOS + 0,
                 P_EMPATADOS = P_EMPATADOS + 0,
                 P_PERDIDOS = P_PERDIDOS + 1,
                 G_FAVOR = G_FAVOR + P_MARCADOR_LOCAL,
                 G_CONTRA = G_CONTRA + P_MARCADOR_VISITANTE, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS + 0
                 WHERE ID_EQUIPO = P_ID_LOCAL;
        UPDATE EQUIPOS    
             SET P_GANADOS = P_GANADOS + 1,
                 P_EMPATADOS = P_EMPATADOS + 0,
                 P_PERDIDOS = P_PERDIDOS + 0,
                 G_FAVOR = G_FAVOR + P_MARCADOR_VISITANTE,
                 G_CONTRA = G_CONTRA + P_MARCADOR_LOCAL, 
                 P_JUGADOS = P_JUGADOS + 1,
                 PUNTOS = PUNTOS +3
                 WHERE ID_EQUIPO = P_ID_VISITANTE; 
                 
         END CASE; 
         
         ELSE
          SELECT
                'NO SE PUEDE JUGAR ESTE PARIDO' AS 'YA SE HA JUGADO';
         
          END IF;
          
      
end
//