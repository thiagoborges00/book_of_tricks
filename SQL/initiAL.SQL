
-- cria tabela temporaria para fazer o relacionamento
create  temp table "pixset0309"(
dataEHora text, idOperacao text, txId text, origemDestinatario text, cpfCnpj text, valorTarifa numeric, valor numeric)

create  temp table "30outubro"(
cobranca_Id numeric, cobranca_Valor numeric, cobranca_DataDeEmissao text, cobranca_DataDeVencimento text, cobranca_DataDePagamento text, cobranca_IdDaFatura numeric)



#################################################   PIX

drop table "bol31ago"


select * from "pixset08" limit 1


select sum(valor::numeric) from "pixset08"

select * from boleto.boleto_pix bp order by id  desc limit 1

select sum(vl_boleto) from boleto.boleto b 
where cd_metodo_pagto =3 and dt_pagamento ='20230903'

--eliminando tabela 
drop table divergencia"pixset08"


-- relaciona tabela do csv, com boleto-pix pelo txid  e com boleto pelo id 
--=> retornando pix cancelados com valor igual no csv e no boleto  

select bp.txid, fv.valor, bp.boleto_id, c.cd_chave_con, c.dt_cancel, c.vl_pagamento
    FROM boleto.boleto_pix bp JOIN "pixset0309" fv ON bp.txid = fv.txId
   	                          join boleto.boleto c on c.id = bp.boleto_id and c.dt_cancel is not null  and fv.valor::numeric=c.vl_boleto ; 

   	                         
   -- teste	                         
select px.valor --bp.txid, fv.valor, bp.boleto_id, c.cd_chave_con, c.dt_cancel, c.vl_pagamento
    from  boleto.boleto_pix bp  JOIN pixset0309 px ON bp.txid = px.txId
   	                    left join boleto.boleto c on c.id = bp.boleto_id and px.valor <> c.vl_boleto ;
--   	                    where  px.valor <> c.vl_boleto ;

							   
-- pagamento do boleto maior que o do pix							   
Select * from boleto.boleto v where v.dt_pagamento='20230903'
and v.id not in (
    select bp.boleto_id  from boleto.boleto_pix bp  join pixset0309 px on px.txId=bp.txid
                                                 );							   
							  
                                                
-- retorna somatorio dos "pixset08" cancelados   	                         
select sum(fv.valor::numeric)
    FROM boleto.boleto_pix bp JOIN "pixset08" fv ON bp.txid = fv.txId
   	                          join boleto.boleto c on c.id = bp.boleto_id and c.dt_cancel is not null  and fv.valor::numeric=c.vl_boleto ;     	                         

   	                         
select * from boleto.boleto where dt_boleto ='2023-08-28' and cd_metodo_pagto =1

-- atualizando para baixa do boleto mediante um conjunto de ids 	                         
update boleto.boleto set vl_pagamento=vl_boleto, dt_pagamento='2023-09-13', dt_cancel=null  	
where id in (885497,1162471,1207294,1210389,1216120,1218869,1219433,1219653,1219711,1219737,1219817,1220061,1220299,1220488,1220527,1220554,1220890,1221016,
1221077,1221203,1221276,1221390,1221862,1168946,1211661,1214166,1218839,1219407,1219434,1219520,1219670,1219770,1219783,1220075,1220120,1220129,
1220285,1220352,1220475,1220755,1220756,1220760,1220905,1220951,1220981,1221281,1221339,1221582,1221756,1221777,1221851,1201078,1212294,1212446,
1217247,1217506,1217801,1217943,1218372,1218777,1218908,1219521,1219598,1219684,1219725,1220121,1220140,1220233,1220273,1220503,1220548,1220911,
1220919,1221131,1221138,1221187,1221199,1221225,1221311,1221408,1221427,1221473,1221498,1221569,1221704,1221803,1221835,1221887,1173859,1201940,
1202467,1212298,1215772,1219457,1219543,1219813,1219902,1220164,1220244,1220379,1220758,1221148,1221166,1221288,1221376,1221403,1221457,1221469,
1221853,1165579,1173861,1211568,1212447,1212997,1213839,1215742,1218501,1219363,1219365,1219436,1219482,1219599,1219654,1219675,1219890,1219974,
1220066,1220070,1220076,1220083,1220092,1220284,1220323,1220398,1220434,1220664,1221010,1221040,1221194,1221211,1221236,1221258,1221351,1221377,
1221631,1221720,1221828,1221881,1173858,1215263,1215269,1216155,1218000,1219183,1219578,1219754,1219776,1219969,1219997,1220087,1220384,1220543,
1220669,1220690,1221209,1221304,1221615,1221670,1221823,1180482,1199143,1209054,1213154,1214841,1214965,1215882,1217193,1217571,1219266,1219477,
1219539,1219568,1219592,1219600,1219609,1219666,1219696,1219915,1219967,1220103,1220540,1220873,1220925,1221191,1221232,1221280,1221315,1221393,
1221418,1221624,1221640,1221850,1221854,1177917,1212181,1213734,1214956,1218239,1218415,1218974,1219098,1219360,1219390,1219597,1219608,1219808,
1219891,1220014,1220162,1220327,1220382,1220698,1220778,1220982,1221128,1221260,1221399,1221463,1221611,1221645,1221707)


--update com juros
update boleto.boleto set vl_pagamento=vl_boleto,vl_juros =x+y dt_pagamento='2023-08-31', dt_cancel=null  	
where id in(581325,769022,919744,920622,924613,1148103,1152769,1159719,1161010,1165224,
1165626,1165813,1167736,1169071,1169542,1169571,1171537,1173003,1173163)


select cd_chave_pre ,vl_boleto ,vl_pagamento,vl_juros,vl_juros_banco  ,dt_pagamento ,* from boleto.boleto b 
where b.id in(1151909,1160348,1173491,1155155,490280,931746,957225,954752,1163591,1163240,1163237,1157553,1160688,1105793,1148579,1053779,1161999,1158142)
order by cd_chave_pre 



--verificando baixa 
select id, cd_chave_con, vl_pagamento,vl_boleto, vl_amortizacao, dt_cancel, dt_pagamento from boleto.boleto where id in 
(1106714,1106713,1106710,1106700,1106696,1106682,1106672,1106642,1106631,1106626,1106627,1106625,1106624,1106618,1106606,
1106565,1106562,1106561,1106559,1106540,1106520,1106518,1106510,1106507,1106505,1106487,1106485,1106482,1106479,1106477,
1106476,1106473,1106469,1106459,1106457,1106435,1106425,1106414,1106422,1106416,1106412,1106407,1106389,1106381,1106380,
1106373,1106361,1106356,1106307,1106300,1106282,1106268,1106277,1106262,1106258,1106253,1106227,1106207,1106197,1106183,
1106178,1106173,1106172,1106170,1106138,1106105,1106090,1106081,1106076,1106052,1105985)


--update de prestacoes com juros
update boleto.boleto set vl_pagamento=vl_boleto, dt_pagamento='2023-08-28', dt_cancel=null  	
where id in (931746,954752,957225,1053779,1105793,1148579,1151909,1155155,1157553,1158142,1160348,1160688,1161999,1163237,1163240,1163591)





_______________________________________#################################  boletos

--somatorio de boletos com data fixa em um dia
select sum(vl_pagamento) from boleto.boleto b 
where dt_pagamento ='20231030'
and cd_metodo_pagto =1
 


select sum(cobranca_Valor) from boleto28agosto


-- left join para boletos div
Select * from "30outubro" v where v.cobranca_iddafatura::numeric not in (
    select fv.id_vindi from boleto.fatura_vindi fv join boleto.fatura_vindi_item fvi on fvi.fatura_id = fv.id
                                                   left join boleto.boleto b on b.fatura_vindi_id != fvi.id
                       where b.dt_pagamento ='20231030'
                       order by fv.id_vindi 
);

-- join para boletos divergentes
Select * from "30outubro" v where v.cobranca_iddafatura::numeric not in (
    select fv.id_vindi from boleto.fatura_vindi fv join boleto.fatura_vindi_item fvi on fvi.fatura_id::integer = fv.id
                                                   join boleto.boleto b on b.fatura_vindi_id = fvi.id
                       where b.dt_pagamento ='20231030'
--                       order by fv.id_vindi
)
order by v.cobranca_valor
;


--descobrindo boletos não pagos pelo conjunto de ids de fatura da vindi
-- select fv.id_vindi,b.cd_chave_pre ,b.vl_pagamento ,b.vl_boleto , b.id  
select sum(b.vl_boleto)
 from boleto.fatura_vindi fv join boleto.fatura_vindi_item fvi on fvi.fatura_id = fv.id
                             join boleto.boleto b on b.fatura_vindi_id = fvi.id
 where fv.id_vindi in(239623993,239623607,239540449,238343915,239622114,239613218,239460122,239622332,239642961,239599802,239548372,239539180,239603116,239603035,
239334070,239559551,239460929,236272700,238467397,239551124,239485121,239639054,239602599,239625909,239612241,239533474,239630624,239614937,
239608073,239496677,239596899,239187882,239637828,239345314,238945067,239636946,239533026,239575571,239608098,239627035,220242691,239635907,
239542574,239562576,239599844,235716783,239608796,239607073,239492345,239584101,239530961,239181191,239568568,239578399,239494025,239351011,
239611024,239614158,239576237,239629071,239600746,239498297,239259340,236880020,239315161,236322910,238341671,239630974,239540116,239328829,
239611609,239639944,239631492,239479260,239307783,239638966,239643570,239630358,239464699,239620512,239544541,239627349,238143779,239527918,
239629863,239640279,239570230,239575213,233651457,239625238,239619155,239636182,239580865,239598885,239590253,239632977,239642919,239486321,
236564459,239526003,235693633,239499477,239525955,239642077,227337110,239593832,239582211,239342718,238812324,238933294,239178489,239621782,
239577291,239633366,239490800,239548871,239594898,239606365,239468452,238446771,239619362,239616827,239499373,239505757,239645346,238951432,
239532953,239551407)
--order by b.vl_boleto 



Select * from "relatorio-28-08" v where v.cobranca_iddafatura::numeric not in (
    select fv.id_vindi from boleto.fatura_vindi fv join boleto.fatura_vindi_item fvi on fvi.fatura_id::integer = fv.id
                                                   join boleto.boleto b on b.fatura_vindi_id = fvi.id
                       where b.dt_pagamento ='20230828'
                       order by fv.id_vindi
);

--select *from boleto.boleto b2 
Select * from "30outubro" v where v.cobranca_iddafatura::numeric not in (
    select fv.id_vindi from boleto.fatura_vindi fv join boleto.fatura_vindi_item fvi on fvi.fatura_id::integer = fv.id
                                                   join boleto.boleto b on b.fatura_vindi_id = fvi.id
                       where b.dt_pagamento ='20231030'
                       order by fv.id_vindi
);


-- descobrindo id dos boletos com pag a mais no  postgres

Select * from boleto.boleto v where v.dt_pagamento='20231030' and cd_metodo_pagto =1
and v.id not in (
    select b.id  from "30outubro" rf join boleto.fatura_vindi fv on (rf.cobranca_iddafatura::numeric = fv.id_vindi)
    						  	 join boleto.fatura_vindi_item fvi on fv.id = fvi.fatura_id
                              	 join  boleto.boleto b  on b.fatura_vindi_id = fvi.id
                 );	
                                                


-- descobrindo boletos com pag na vindi e sem no postgres
select b.id, rf.cobranca_iddafatura::numeric, fv.id_vindi, rf.cobranca_datadepagamento, rf.cobranca_datadevencimento,b.dt_vencimento, rf.cobranca_valor::numeric, b.vl_boleto,b.cd_chave_pre, (rf.cobranca_valor::numeric - b.vl_boleto) as diferenca 
    from "30outubro" rf join boleto.fatura_vindi fv on (rf.cobranca_iddafatura::numeric = fv.id_vindi)
    						  join boleto.fatura_vindi_item fvi on fv.id = fvi.fatura_id
                              left join  boleto.boleto b  on b.fatura_vindi_id = fvi.id
    where rf.cobranca_valor::numeric <> b.vl_boleto
    order by b.cd_chave_pre    
    
 -- somatorio deles  
 select sum(b.vl_boleto), sum(rf.cobranca_valor) 
    from boleto0913 rf join boleto.fatura_vindi fv on (rf.cobranca_iddafatura::numeric = fv.id_vindi)
    						  join boleto.fatura_vindi_item fvi on fv.id = fvi.fatura_id
                              left join  boleto.boleto b  on b.fatura_vindi_id = fvi.id
--    where rf.cobranca_valor::numeric = b.vl_boleto
    
    
    
select  b.id,rf.cobranca_iddafatura,b.cd_chave_pre,sum( rf.cobranca_valor::numeric),sum( b.vl_boleto), sum( rf.cobranca_valor::numeric)-sum( b.vl_boleto)
    from "30outubro" rf join boleto.fatura_vindi fv on (rf.cobranca_iddafatura::numeric = fv.id_vindi)
    						  join boleto.fatura_vindi_item fvi on fv.id = fvi.fatura_id
                              left join  boleto.boleto b  on b.fatura_vindi_id = fvi.id
    group by b.id,rf.cobranca_iddafatura,b.cd_chave_pre 
    having sum( rf.cobranca_valor::numeric) <> sum( b.vl_boleto)
    order by b.cd_chave_pre 
    
    
  
select vl_boleto,cd_chave_pre, * from boleto.boleto
where id = 602504














*****************************************************************************************************************
-- verificando total de "pixset08" em uma data
select sum (vl_pagamento) from boleto.boleto where dt_pagamento = '2023-07-31' and cd_metodo_pagto = 3



--chamado dia 28
select id, cd_chave_pre,cd_metodo_pagto, vl_pagamento,vl_boleto, vl_juros, vl_juros_banco, vl_amortizacao, dt_pagamento, dt_cancel, dt_boleto 
from boleto.boleto 
where id in (1151909,1160348,1173491,1155155,490280,931746,957225,954752,1163591,1163240,1163237,1157553,1160688,1105793,1148579,1053779,1161999,1158142)
and vl_boleto <> vl_pagamento  
order by cd_chave_pre 

select id,cd_cliente, cd_chave_pre,cd_metodo_pagto, vl_pagamento,vl_boleto,vl_juros,vl_juros_banco,vl_amortizacao,dt_pagamento,dt_cancel,dt_boleto
from boleto.boleto 
where cd_chave_con='CAM 271   22684'
--where cd_chave_con = 'PAM 215    5714'

select * from boleto.boleto where cd_chave_con='PER 213   23577'


select cd_chave_pre,cd_metodo_pagto,fatura_vindi_id ,vl_boleto ,dt_pagamento ,dt_cancel ,* 
from boleto.boleto
--where cd_chave_con='RAS 215      36'
where cd_chave_con = 'PIO 277    4604'


select * from boleto.boleto b
where cd_chave_con='RAS 215      36'
--where cd_chave_con = 'PIO 277    4604'

--baixa boleto LOGS
select * from boleto.log_baixa_boleto lbb 
where lbb.id_boleto =1208299

select * from boleto.boleto b where dt_pagamento  ='2023-08-28' and cd_metodo_pagto =3

select sum(vl_pagamento) from boleto.boleto b where dt_pagamento ='2023-08-26' and cd_metodo_pagto =1

-- de onde e a loja
select * from dbatez.caixa_loja where sg_loja = 'RAS '

SELECT sg_loja, no_loja, sg_loja_pagto, sg_loja_base, pk_caixa_loja
FROM dbatez.caixa_loja
where sg_loja = 'RAS';



select
	*
from
	boleto.fatura_vindi fv 
where
	fv.id_vindi  = 456562





select count(*)  --bp.txid, fv.valor, bp.boleto_id --, c.cd_chave_con, c.dt_cancel, c.vl_pagamento
    FROM boleto.boleto_"pixset08" bp JOIN "divergencia_"pixset08"" fv ON bp.txid = fv.txId as mocoto

select * from boleto.boleto_"pixset08" bp limit 1

select * from "divergencia_"pixset08"" bp limit 1

update 
"divergencia_"pixset08"" csva 
full outer JOIN 
boleto.boleto_"pixset08" "pixset08"
on csva.txid = "pixset08".txid 
set lancamento=null

-- left join 
select * 
from "divergencia_"pixset08"" csva left join boleto.boleto_"pixset08" "pixset08"  on csva.txid = "pixset08".txid
where  "pixset08".txid is null 



select * from boleto.boleto_"pixset08" bp 
--where txid in ('E18236120202308031944s16c2684d68','E0000000020230803193819946515380')
where dth_criacao > ''



with caiope as (
select * from dblink('user=usr_aplicacao password=aplicacao host=172.31.1.10 port=5432 dbname=dbatez',
$a$ select replace(cd_chave_pre,'NCP','EXT'), sum(vl_movimento) from cai_ope where dt_caixa='2023-09-19' and cd_caixa=936 group by cd_chave_pre $a$) as t(cd_chave_pre varchar,vl_movimento_caiope numeric)
)
select a.*,b.cd_chave_pre,b.id,b.vl_amortizacao,b.vl_pagamento from caiope a left join boleto.boleto b on (a.cd_chave_pre=b.cd_chave_pre and b.dt_pagamento='2023-09-19')
 
 
 
with caiope as (
select * from dblink('user=usr_aplicacao password=aplicacao host=172.31.1.10 port=5432 dbname=dbatez',
$a$ select replace(cd_chave_pre,'NCP','EXT'), sum(vl_movimento) from cai_ope where dt_caixa='2023-09-19' and cd_caixa=936 group by cd_chave_pre $a$) as t(cd_chave_pre varchar,vl_movimento_caiope numeric)
)
select sum(vl_movimento_caiope),sum(b.vl_pagamento) from caiope a left join boleto.boleto b on (a.cd_chave_pre=b.cd_chave_pre and b.dt_pagamento='2023-09-19' and b.cd_metodo_pagto=1)
  



 with caiope as (
select * from dblink('user=usr_aplicacao password=aplicacao host=172.31.1.10 port=5432 dbname=dbatez',
$a$ select replace(cd_chave_pre,'NCP','EXT'), sum(vl_movimento) from cai_ope where dt_caixa='2023-09-19' and cd_caixa=936 group by cd_chave_pre $a$) as t(cd_chave_pre varchar,vl_movimento_caiope numeric)
)
select a.*,b.cd_chave_pre,b.id,b.vl_amortizacao,b.vl_pagamento from caiope a left join boleto.boleto b on (a.cd_chave_pre=b.cd_chave_pre and b.dt_pagamento='2023-09-19')
 where a.vl_movimento_caiope<>b.vl_pagamento

 
 
 -- webhooks de faturas pagas que não constam no postgres
 SELECT
    (wv.evento->'event'->'data'->'bill'->>'id')::numeric
FROM boleto.webhook_vindi wv
JOIN boleto.fatura_vindi fv
    on (wv.evento->'event'->'data'->'bill'->>'id')::numeric = fv.id_vindi
WHERE wv.evento->'event'->>'type' = 'bill_paid'
    and fv.status != 'paid';
 
   --- faturas sem emissão
SELECT
    (wv.evento->'event'->'data'->'bill'->>'id')::numeric
FROM boleto.webhook_vindi wv
LEFT JOIN boleto.fatura_vindi fv
    on (wv.evento->'event'->'data'->'bill'->>'id')::numeric = fv.id_vindi
WHERE wv.evento->'event'->>'type' = 'bill_paid'
  and fv.id is null;
  
   
 
 
 select * from boleto.boleto b 
 where dt_expiracao = current_date  
 and dt_pagamento isnull 
 and dt_cancel is not null
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ###################################################################
 INSERT INTO "30outubro" (cobranca_Id,cobranca_Valor,cobranca_DataDeEmissao,cobranca_DataDeVencimento,cobranca_DataDePagamento,cobranca_IdDaFatura) VALUES
	 ('263030559','88.5','2023-10-30T19:22:22-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922055'),
	 ('263030565','139.8','2023-10-30T19:22:27-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922061'),
	 ('263030823','135.9','2023-10-30T19:28:39-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922323'),
	 ('263030838','160.7','2023-10-30T19:28:54-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922338'),
	 ('263031246','216.9','2023-10-30T19:38:08-03:00','2023-11-08T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922759'),
	 ('263031360','120.0','2023-10-30T19:40:35-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922875'),
	 ('263031409','55.5','2023-10-30T19:41:36-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922925'),
	 ('263031480','81.3','2023-10-30T19:43:18-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247922996'),
	 ('263031582','182.9','2023-10-30T19:45:16-03:00','2023-11-06T23:59:59-03:00','2023-10-30T00:00:00-03:00','247923098'),
	 ('263032339','3.11','2023-10-30T20:01:21-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247923867');
INSERT INTO "30outubro" (cobranca_Id,cobranca_Valor,cobranca_DataDeEmissao,cobranca_DataDeVencimento,cobranca_DataDePagamento,cobranca_IdDaFatura) VALUES
	 ('263032377','60.6','2023-10-30T20:02:00-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247923907'),
	 ('263032399','231.7','2023-10-30T20:02:24-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247923929'),
	 ('263032447','282.5','2023-10-30T20:03:25-03:00','2023-11-09T23:59:59-03:00','2023-10-30T00:00:00-03:00','247923975'),
	 ('263032489','55.7','2023-10-30T20:04:19-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247924018'),
	 ('263033616','73.7','2023-10-30T20:29:57-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247925179'),
	 ('263033920','31.4','2023-10-30T20:37:25-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247925475'),
	 ('263033998','31.8','2023-10-30T20:39:21-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247925550'),
	 ('263034923','202.9','2023-10-30T21:04:31-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247926556'),
	 ('263036153','336.9','2023-10-30T21:39:35-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247927819'),
	 ('263036669','56.0','2023-10-30T21:55:57-03:00','2023-11-02T23:59:59-03:00','2023-10-30T00:00:00-03:00','247928325');