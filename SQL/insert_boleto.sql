--id origin vai ser sempre(bwe e o remote '')
--colocar tp_finrel, e datas corretas

select sg_loja ,tp_contrato,tp_fin ,nr_contrato ,nr_prestacao ,nr_parcela,
dt_boleto ,dt_venc_boleto ,dt_vencimento,vl_boleto,vl_amortizacao ,
vl_juros ,vl_juros_real ,cd_regiao ,cd_cliente ,id_origin ,id_remote  ,
dth_atualizacao ,dth_criacao ,vl_prestacao ,dt_expiracao ,cd_metodo_pagto,
dt_pagamento,vl_pagamento,cd_representante, tp_fin_rel, fatura_vindi_id 
from BOLETO.BOLETO where ID =1668849; --1519994;


--insert PORCONTA
insert into boleto.boleto(
sg_loja ,tp_contrato,tp_fin ,nr_contrato ,nr_prestacao ,nr_parcela,
dt_boleto ,dt_venc_boleto ,dt_vencimento,vl_boleto,vl_amortizacao ,
vl_juros ,vl_juros_real ,cd_regiao ,cd_cliente ,id_origin ,id_remote  ,
dth_atualizacao ,dth_criacao ,vl_prestacao ,dt_expiracao ,cd_metodo_pagto,
dt_pagamento,vl_pagamento,cd_representante, tp_fin_rel,fatura_vindi_id)
VALUES(
'RPI',2,15,70297,2,0,
CURRENT_DATE,'2024-03-18','2024-03-15',361.4,63.3,
0,0,6,416074,'BWE','',
NOW(),CURRENT_DATE,361.4,'2024-04-02',1,
'2024-02-02',63.30,60,15,null);




--insert sem juros pagamento completo
insert into boleto.boleto(
sg_loja ,tp_contrato,tp_fin ,nr_contrato ,nr_prestacao ,nr_parcela,
dt_boleto ,dt_venc_boleto ,dt_vencimento,vl_boleto,vl_amortizacao ,
vl_juros ,vl_juros_real ,cd_regiao ,cd_cliente ,id_origin ,id_remote  ,
dth_atualizacao ,dth_criacao ,vl_prestacao ,dt_expiracao ,cd_metodo_pagto,
dt_pagamento,vl_pagamento,cd_representante, tp_fin_rel,fatura_vindi_id)
VALUES(
'BOJ',2,15,121687,4,0,
CURRENT_DATE,'2024-04-13','2024-04-10',672.8,8.70,
0,0,9,444680,'BWE','',
NOW(),CURRENT_DATE,672.8,'2024-04-03',1,
'2024-02-14',8.7,1,15,530547);

--quando já tem um porconta colocar nr_parcela = qtd_porcontas_existentes
-- vl_prestacao é o q vem do lerpre
-- campos cd_chave e id_remote são calculados
-- colocar o futura id da prestacao que foi retirado o credito