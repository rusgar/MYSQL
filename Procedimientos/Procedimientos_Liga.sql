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

-- ------------------------------- COMPROBACION QUE NO SE HAYA DISPUTADO EL PARTIDO---------------------------------
    
    CALL COMPROBAR_RESULTADO (P_ID_LOCAL,
                            P_ID_VISITANTE,
                            @RESULTADO );
    IF @RESULTADO IS NULL THEN 
    
    
--  ------------ PRIMER PASO QUE DAMOS ES ACTUALIZAR LOS MARCADORES, DE AMBOS EQUIPOS, TANTO LOCAL COMO VISITANTES, CON LOS DATOS INGRESADOS-------------------

    CALL INFORMAR_MARCADOR(P_ID_LOCAL,
						   P_ID_VISITANTE,
                           P_MARCADOR_LOCAL,
                           P_MARCADOR_VISITANTE);
            
-- ------------------- SEGUNDO PASO ACTUALIZAR EL CAMPO RESULTADO --------------------------------------------------------------------------------------------
      CASE 
          WHEN P_MARCADOR_LOCAL = P_MARCADOR_VISITANTE THEN
          CALL INFORMAR_RESULTADO(P_ID_LOCAL,
						         P_ID_VISITANTE,
                                 'E');
               
                        
                
          WHEN P_MARCADOR_LOCAL < P_MARCADOR_VISITANTE THEN
               CALL INFORMAR_RESULTADO(P_ID_LOCAL,
						         P_ID_VISITANTE,
                                 'V');                      
                    
          
          WHEN P_MARCADOR_LOCAL > P_MARCADOR_VISITANTE THEN
              CALL INFORMAR_RESULTADO(P_ID_LOCAL,
						         P_ID_VISITANTE,
                                 'L');                                       
               
               
          
      END CASE; 
      
      
      -- -------------------------------- EMPATE---------------------------------------------------------
      CASE 
      WHEN P_MARCADOR_LOCAL = P_MARCADOR_VISITANTE THEN
      
      CALL ACTUALIZAR_EQUIPOS(0,                    -- IN PE_GANADOS INT
                              1,                    -- IN PE_EMPATADOS INT
                              0,                   --  IN PE_PERDIDOS INT
                              P_MARCADOR_LOCAL,    -- IN PE_FAVOR INT
                              P_MARCADOR_VISITANTE, -- IN PE_CONTRA INT
                              1,                    -- IN PE_JUGADOS INT
                              1,                   -- IN PE_PUNTOS INT
                              P_ID_LOCAL);       --  IN PE_ID_EQUIPO INT
       
        CALL ACTUALIZAR_EQUIPOS(0,                   -- IN PE_GANADOS INT
                                1,                   -- IN PE_EMPATADOS INT
                                0,                   --  IN PE_PERDIDOS INT
                                P_MARCADOR_VISITANTE, -- IN PE_FAVOR INT
                                P_MARCADOR_LOCAL,     -- IN PE_CONTRA INT
                                1,                    -- IN PE_JUGADOS INT
                                1,                    -- IN PE_PUNTOS INT
                                P_ID_VISITANTE );    --  IN PE_ID_EQUIPO INT);
          
                 
    -- ------------------------------- LOCAL-------------------------------------------------------
       
      WHEN P_MARCADOR_LOCAL > P_MARCADOR_VISITANTE THEN
      
      CALL ACTUALIZAR_EQUIPOS(1,                    -- IN PE_GANADOS INT
                              0,                    -- IN PE_EMPATADOS INT
                              0,                   --  IN PE_PERDIDOS INT
                              P_MARCADOR_LOCAL,    -- IN PE_FAVOR INT
                              P_MARCADOR_VISITANTE, -- IN PE_CONTRA INT
                              1,                    -- IN PE_JUGADOS INT
                              3,                   -- IN PE_PUNTOS INT
                              P_ID_LOCAL);       --  IN PE_ID_EQUIPO INT
                              
        CALL ACTUALIZAR_EQUIPOS(0,                   -- IN PE_GANADOS INT
                                0,                   -- IN PE_EMPATADOS INT
                                1,                   --  IN PE_PERDIDOS INT
                                P_MARCADOR_VISITANTE, -- IN PE_FAVOR INT
                                P_MARCADOR_LOCAL,     -- IN PE_CONTRA INT
                                1,                    -- IN PE_JUGADOS INT
                                0,                    -- IN PE_PUNTOS INT
                                P_ID_VISITANTE );    --  IN PE_ID_EQUIPO INT);
      
    
                 
   -- -------------------------------- VISITANTE------------------------------------------------------
      
      WHEN P_MARCADOR_LOCAL < P_MARCADOR_VISITANTE THEN
      
      CALL ACTUALIZAR_EQUIPOS(0,                    -- IN PE_GANADOS INT
                              0,                    -- IN PE_EMPATADOS INT
                              1,                   --  IN PE_PERDIDOS INT
                              P_MARCADOR_LOCAL,    -- IN PE_FAVOR INT
                              P_MARCADOR_VISITANTE, -- IN PE_CONTRA INT
                              1,                    -- IN PE_JUGADOS INT
                              0,                   -- IN PE_PUNTOS INT
                              P_ID_LOCAL);       --  IN PE_ID_EQUIPO INT
                              
        CALL ACTUALIZAR_EQUIPOS(1,                   -- IN PE_GANADOS INT
                                0,                   -- IN PE_EMPATADOS INT
                                0,                   --  IN PE_PERDIDOS INT
                                P_MARCADOR_VISITANTE, -- IN PE_FAVOR INT
                                P_MARCADOR_LOCAL,     -- IN PE_CONTRA INT
                                1,                    -- IN PE_JUGADOS INT
                                3,                    -- IN PE_PUNTOS INT
                                P_ID_VISITANTE );    --  IN PE_ID_EQUIPO INT);                     
     
      
                 
 END CASE; 
         
         
         ELSE
          SELECT
                'NO SE PUEDE JUGAR ESTE PARIDO' AS 'YA SE HA JUGADO';         
         END IF;   
      
end
//