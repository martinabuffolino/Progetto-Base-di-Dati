-- 1. Trigger che impedisce di inserire 3 dipendenti con lo stesso nome
CREATE OR REPLACE TRIGGER NOME_DIPENDENTI
BEFORE INSERT ON DIPENTENDE
FOR EACH ROW	--per ogni riga deve essere fatto il controllo

DECLARE
CONTA NUMBER;
TN EXCEPTION;

BEGIN
SELECT COUNT(*) INTO CONTA
FROM DIPENTENDE
WHERE upper(NOME)=:NEW.NOME;
IF CONTA>2 THEN--se si verifica questo lanciamo eccezione
	RAISE TN;
END IF;

EXCEPTION
WHEN TN THEN
	RAISE_APPLICATION_ERROR(-20001, 'TROPPI DIPENDENTI CON LO STESSO NOME')
END;