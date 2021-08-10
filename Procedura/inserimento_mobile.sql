/*Procedura che permette di inserire un rifornimento di mobili*/

CREATE OR REPLACE PROCEDURE INSERIMENTO_MOBILI (COD_BARRA_MOBILE CHAR ,NOME VARCHAR,MATERIALE VARCHAR,COLORE VARCHAR,PREZZO NUMBER,LUNGHEZZA NUMBER,ALTEZZA NUMBER,P_IVA NUMBER,QUANTITA NUMBER,ID_M NUMBER,ID_PROMO NUMBER)
IS

DECLARE
SCONTO_DA_APPLICARE NUMBER;

BEGIN
SELECT SCONTO INTO SCONTO_DA_APPLICARE FROM PROMOZIONE NATURAL JOIN MOBILE WHERE COD_BARRA_M=:COD_BARRA_MOBILE;
INSERT INTO MOBILE  VALUES (COD_BARRA_MOBILE, NOME, MATERIALE, COLORE, PREZZO,PREZZO-SCONTO_DA_APPLICARE, LUNGHEZZA, ALTEZZA, P_IVA, QUANTITA, ID_M, ID_PROMO, sysdate, sysdate+30);

END;
/