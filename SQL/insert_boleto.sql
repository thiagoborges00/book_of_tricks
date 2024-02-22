-- base
INSERT INTO boleto.boleto 
(sg_loja,tp_contrato,tp_fin,nr_contrato,nr_prestacao,nr_parcela,
dt_boleto,dt_venc_boleto,dt_vencimento,dt_pagamento,dt_caixa,dt_cancel,
vl_boleto,vl_amortizacao,vl_juros,vl_juros_real,cd_regiao,cd_cliente,
sg_loja_pagto,cd_chave_pag,cd_chave_con,cd_chave_pre,cd_chave_por,cd_chave_cli,
id_origin,id_remote,dth_atualizacao,dth_criacao,fatura_vindi_id,fl_baixado,
dt_ini_boleto,vl_prestacao,fl_replicado,dth_reg_replicado,dth_reg_baixado,dt_expiracao,
vl_pagamento,fl_replicado_matriz,dth_reg_replicado_matriz,fl_baixado_matriz,dth_reg_baixado_matriz,cd_representante,
vl_juros_banco,cd_cartao,cd_metodo_pagto,tp_fin_rel,sq_imp_par,nr_recibo,
sg_loja_rec,cd_chave_rec,fl_adc) 
VALUES
	 ('TMA',2,4,1000562,1,0,
     '2023-12-28','2023-12-31','2023-12-21',NULL,NULL,NULL,
     347.70,340.00,7.70,7.70,10,160588,
     NULL,NULL,'TMA 2 4 1000562','TMA 2 4 1000562 1','TMA 2 4 1000562 1 0','10  160588',
     'BWE','TMA','2023-12-28 15:25:52.606434-03','2023-12-28 15:25:52.606454-03',510185,NULL,
     '2023-12-28',340.00,NULL,NULL,NULL,'2024-01-15',
     NULL,NULL,NULL,NULL,NULL,30,
     NULL,' 16564140081',1,4,NULL,NULL,
     NULL,NULL,false);




--versão 1
INSERT INTO boleto.boleto 
(sg_loja,tp_contrato,tp_fin,nr_contrato,nr_prestacao,nr_parcela,

dt_boleto,dt_venc_boleto,dt_vencimento,dt_pagamento,dt_caixa,dt_cancel,
vl_boleto,vl_amortizacao,vl_juros,vl_juros_real,cd_regiao,cd_cliente,
sg_loja_pagto,cd_chave_pag,cd_chave_con,cd_chave_pre,cd_chave_por,cd_chave_cli,--toda null
id_origin,id_remote,dth_atualizacao,dth_criacao,fatura_vindi_id,fl_baixado,
dt_ini_boleto,vl_prestacao,fl_replicado,dth_reg_replicado,dth_reg_baixado,dt_expiracao,
vl_pagamento,fl_replicado_matriz,dth_reg_replicado_matriz,fl_baixado_matriz,dth_reg_baixado_matriz,cd_representante,
vl_juros_banco,cd_cartao,cd_metodo_pagto,tp_fin_rel,sq_imp_par,nr_recibo,
sg_loja_rec,cd_chave_rec,fl_adc) 
VALUES
	 ('TMA',2,4,1000562,1,0,
     '2023-12-28','2023-12-31','2023-12-21',{dt_pagamento},NULL,NULL,
     {vl_boleto},{amortizacao},{juros},0,{regiao},{cd_cliente},
     NULL,NULL,'TMA 2 4 1000562','TMA 2 4 1000562 1','TMA 2 4 1000562 1 0','10  160588',
     'BWE','TMA','2023-12-28 15:25:52.606434-03','2023-12-28 15:25:52.606454-03',510185,NULL,
     '2023-12-28',340.00,NULL,NULL,NULL,'2024-01-15',
     NULL,NULL,NULL,NULL,NULL,30,
     NULL,' 16564140081',1,4,NULL,NULL,
     NULL,NULL,false);





-- boleto.boleto definition

-- Drop table

-- DROP TABLE boleto.boleto;

CREATE TABLE boleto.boleto (
	id serial4 NOT NULL,
	sg_loja varchar(3) NOT NULL,
	tp_contrato numeric(2) NOT NULL,
	tp_fin numeric(2) NOT NULL,
	nr_contrato numeric(8) NOT NULL,
	nr_prestacao numeric(2) NOT NULL,
	nr_parcela numeric(2) NULL,
	dt_boleto date NOT NULL,
	dt_venc_boleto date NOT NULL,
	dt_vencimento date NOT NULL,
	dt_pagamento date NULL,
	dt_caixa date NULL,
	dt_cancel date NULL,
	vl_boleto numeric(15, 2) NOT NULL,
	vl_amortizacao numeric(15, 2) NOT NULL,
	vl_juros numeric(15, 2) NOT NULL,
	vl_juros_real numeric(15, 2) NOT NULL,
	cd_regiao numeric(2) NOT NULL,
	cd_cliente numeric(8) NOT NULL,
	sg_loja_pagto varchar(3) NULL,
	cd_chave_pag varchar(9) NULL,
	cd_chave_con varchar(15) NOT NULL,
	cd_chave_pre varchar(17) NOT NULL,
	cd_chave_por varchar(19) NOT NULL,
	cd_chave_cli varchar(10) NOT NULL,
	id_origin varchar(3) NOT NULL,
	id_remote varchar(3) NOT NULL,
	dth_atualizacao timestamptz NOT NULL,
	dth_criacao timestamptz NOT NULL,
	fatura_vindi_id int8 NULL,
	fl_baixado bool NULL,
	dt_ini_boleto date NULL,
	vl_prestacao numeric(15, 2) NOT NULL,
	fl_replicado bool NULL,
	dth_reg_replicado timestamp NULL,
	dth_reg_baixado timestamp NULL,
	dt_expiracao date NOT NULL,
	vl_pagamento numeric(15, 2) NULL,
	fl_replicado_matriz bool NULL,
	dth_reg_replicado_matriz timestamp NULL,
	fl_baixado_matriz bool NULL,
	dth_reg_baixado_matriz timestamp NULL,
	cd_representante numeric(3) NULL,
	vl_juros_banco numeric(15, 2) NULL,
	cd_cartao varchar(12) NULL,
	cd_metodo_pagto numeric(1) NOT NULL DEFAULT 0,
	tp_fin_rel numeric(2) NULL,
	sq_imp_par varchar(1) NULL,
	nr_recibo numeric(10) NULL,
	sg_loja_rec varchar(3) NULL,
	cd_chave_rec varchar(14) NULL,
	fl_adc bool NULL DEFAULT false,
	CONSTRAINT boleto_pkey PRIMARY KEY (id)
)
WITH (
	autovacuum_enabled=on,
	autovacuum_analyze_scale_factor=0.001,
	autovacuum_vacuum_scale_factor=0.001,
	autovacuum_vacuum_cost_delay=5
);


sg_loja varchar(3)   ok
tp_fin numeric(2)    ok
nr_contrato numeric(8) ok
nr_prestacao numeric(2) ok
dt_boleto date ok
dt_venc_boleto date 
dt_vencimento date 
vl_boleto numeric(15, 2) 
vl_amortizacao numeric(15, 2) 
vl_juros numeric(15, 2) 
vl_juros_real numeric(15, 2) 
cd_regiao numeric(2) 
cd_cliente numeric(8) 
-- cd_chave_con varchar(15) 
-- cd_chave_pre varchar(17) 
-- cd_chave_por varchar(19) 
-- cd_chave_cli varchar(10) 
id_origin varchar(3) {sigla contrato}
id_remote varchar(3) 
dth_atualizacao timestamptz 
dth_criacao timestamptz 
vl_prestacao numeric(15, 2) 
dt_expiracao date {currentate+1}
cd_metodo_pagto numeric(1) {1} 


--basico
INSERT INTO boleto.boleto 
(sg_loja,tp_contrato,tp_fin,nr_contrato,nr_prestacao,nr_parcela,

dt_boleto,dt_venc_boleto,dt_vencimento,dt_pagamento,dt_caixa,dt_cancel,
vl_boleto,vl_amortizacao,vl_juros,vl_juros_real,cd_regiao,cd_cliente,
sg_loja_pagto,cd_chave_pag,cd_chave_con,cd_chave_pre,cd_chave_por,cd_chave_cli,

id_origin,id_remote,dth_atualizacao,dth_criacao,fatura_vindi_id,fl_baixado,

dt_ini_boleto,vl_prestacao,fl_replicado,dth_reg_replicado,dth_reg_baixado,dt_expiracao,
vl_pagamento,fl_replicado_matriz,dth_reg_replicado_matriz,fl_baixado_matriz,dth_reg_baixado_matriz,cd_representante,
vl_juros_banco,cd_cartao,cd_metodo_pagto,tp_fin_rel,sq_imp_par,nr_recibo,
sg_loja_rec,cd_chave_rec,fl_adc) 
VALUES
	 ('OOO',2,4,1000562,1,NULL,
     '2023-12-28','2023-12-31','2023-12-21',NULL,NULL,NULL,
     12.10,12.10,0,0,10,123123,
     NULL,NULL,NULL,NULL,NULL,NULL,

     'BWE',NULL,'2023-12-28 15:25:52.606434-03','2023-12-28 15:25:52.606454-03',510185,NULL,
     '2023-12-28',340.00,NULL,NULL,NULL,'2024-01-15',
     NULL,NULL,NULL,NULL,NULL,30,
     NULL,' 16564140081',1,4,NULL,NULL,
     NULL,NULL,false);



{
    nr_parcela,

}


VALUES
	 ('OOO',2,4,1000562,1,NULL,
     '2023-12-28','2023-12-31','2023-12-21',NULL,NULL,NULL,
     {vl_boleto},{amortizacao},{juros},0,{regiao},{cd_cliente},
     NULL,NULL,'TMA 2 4 1000562','TMA 2 4 1000562 1','TMA 2 4 1000562 1 0','10  160588',
     'BWE','TMA','2023-12-28 15:25:52.606434-03','2023-12-28 15:25:52.606454-03',510185,NULL,
     '2023-12-28',340.00,NULL,NULL,NULL,'2024-01-15',
     NULL,NULL,NULL,NULL,NULL,30,
     NULL,' 16564140081',1,4,NULL,NULL,
     NULL,NULL,false);





sg_loja ,tp_fin ,nr_contrato ,nr_prestacao ,
dt_boleto ,dt_venc_boleto ,dt_vencimento,vl_boleto,vl_amortizacao ,
vl_juros ,vl_juros_real ,cd_regiao ,cd_cliente ,id_origin ,id_remote  ,
dth_atualizacao ,dth_criacao ,vl_prestacao ,dt_expiracao ,cd_metodo_pagto  