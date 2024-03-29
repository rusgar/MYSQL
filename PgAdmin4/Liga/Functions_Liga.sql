SET SEARCH_PATH TO LIGA, '$USER';

CREATE OR REPLACE FUNCTION INFORMAR_RESULTADO(P_ID_LOCAL INT,
                                               P_ID_VISITANTE INT,
											   P_MARCADOR_LOCAL INT,
											   P_MARCADOR_VISITANTE INT,
											   P_FINALIZADO BOOLEAN)
											   
											   
RETURNS TEXT AS $$         
BEGIN
	CASE WHEN  P_FINALIZADO = 1 THEN
	     UPDATE PARTIDOS
		 SET MARCADOR_LOCAL = P_MARCADOR_LOCAL,
             MARCADOR_VISITANTE= P_MARCADOR_VISITANTE,
			 FINALIZADO = 'S'
                WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;
	
	     WHEN  P_FINALIZADO = 0 THEN
		 UPDATE PARTIDOS
		 SET MARCADOR_LOCAL = P_MARCADOR_LOCAL,
             MARCADOR_VISITANTE= P_MARCADOR_VISITANTE
                WHERE ID_LOCAL = P_ID_LOCAL AND ID_VISITANTE = P_ID_VISITANTE;
		 
    END CASE;



END;
$$
LANGUAGE PLPGSQL;

select  INFORMAR_RESULTADO(2.1,4,4,'x');