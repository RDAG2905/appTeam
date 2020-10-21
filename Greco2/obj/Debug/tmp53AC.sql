CREATE PROCEDURE [GetDenunciasPorFechasDeNotificacion]
    @fechaDesde [nvarchar](max),
    @fechaHasta [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                where td.FSELLOCIA >= @fechaDesde
    						and td.FSELLOCIA <= @fechaHasta                    
    
END
GO

CREATE PROCEDURE [GetDenunciasPorFechaDeNotificacionDesde]
    @fechaDesde [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                where td.FSELLOCIA >= @fechaDesde	                  
    
END
GO

CREATE PROCEDURE [GetDenunciasPorFechaDeNotificacionHasta]
    @fechaHasta [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    where td.FSELLOCIA >= @fechaHasta                  
    
END
GO

CREATE PROCEDURE [GetDenunciasPorFechasDeNotificacionGcia]
    @fechaDesde [nvarchar](max),
    @fechaHasta [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                where td.FSELLOGCIADC >= @fechaDesde
    						and td.FSELLOGCIADC <= @fechaHasta 
    
    
END
GO

CREATE PROCEDURE [GetDenunciasPorFechaDeNotificacionGciaDesde]
    @fechaDesde [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                where td.FSELLOGCIADC >= @fechaDesde	                  
    
END
GO

CREATE PROCEDURE [GetDenunciasPorFechaDeNotificacionGciaHasta]
    @fechaHasta [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                where td.FSELLOGCIADC >= @fechaHasta                  
    
END
GO

CREATE PROCEDURE [GetDenunciasPorNombreDenunciante]
    @nombre [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    and tden.nombre like ''+ @nombre +'%'
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                                  
    
END
GO

CREATE PROCEDURE [GetDenunciasPorTramiteCRM]
    @tramiteCRM [nvarchar](max)
AS
BEGIN
     	
    Select td.DenunciaId,td.EXPEDIENTE_ID,td.FCREACION,tor.Nombre as Organismo,ts.Nombre as Servicio,
    testu.Nombre as Estudio,tden.apellido as Apellido,tden.nombre as Nombre,tsub.Nombre as EstadoActual ,ttp.Nombre TipoProceso
    ,td.FSELLOCIA,td.FSELLOGCIADC,
    	                td.ETAPA_ID,td.ORGANISMO_ID,tor.Region_Id,
    	                tor.Provincia_Id,tor.Localidad_Id,
    	                td.SERV_DEN_ID,td.ESTUDIO_ID,
    	                td.TIPO_PRO_ID,tden.apellido,tden.nombre,tden.NroDocumento,
    	                td.CONCILIACION_ID,td.RECLAMO_ID,td.TRAMITECRM,
    	                td.RESP_INT_ID,td.PARENTDENUNCIAID
    from  tDenuncias td
    inner join tOrganismos tor
    on td.ORGANISMO_ID = tor.Id
    inner join tServicios ts
    on td.SERV_DEN_ID = ts.Id
    left join tEstudios testu
    on td.ESTUDIO_ID = testu.Id
    inner join tDenunciantes tden
    on td.DENUNCIANTE_ID = tden.DenuncianteId
    	                inner join tSubEstados tsub
    on td.CONCILIACION_ID = tsub.Id
    inner join tTipoProceso ttp
    on td.TIPO_PRO_ID = ttp.Id
    	                WHERE td.TRAMITECRM = @tramiteCRM                  
    
END
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201911221516391_createSPFiltrosPorEntidad2daParte', N'Greco2.Models.NuevoDbContext',  0x1F8B0800000000000400ED5D5B6F1B4B727E0F90FF40F029599CA5649F5D2031A45DD024EDC38D2432247570DE84113996272167743843C346905F95C73CE4213F287F213DB79EAABE4C77F5CC50944D1830C4BE7CDD5D557DEFF9EAFFFEFB7FAEFEFA75B7ED7DF1F7711085D7FD3783CB7ECF0FD7D126089FAEFB87E4D31FFFA9FFD7BFFCFDDF5D4D36BBAFBD5FCB743FA7E958CE30BEEE7F4E92E7771717F1FAB3BFF3E2C12E58EFA338FA940CD6D1EEC2DB44176F2F2FFFF9E2CD9B0B9F41F41956AF77B5388449B0F3B31FECE7280AD7FE7372F0B6B7D1C6DFC645388B5966A8BD3B6FE7C7CFDEDABFEE7FDCFBEBE8ED204BD8EF0DB781C7EAB0F4B79FFA3D2F0CA3C44B580DDFDDC7FE32D947E1D3F2990578DBD5B7679FA5FBE46D63BFA8F9BB2AB96D232EDFA68DB8A8329650EB439C443B22E09B9F0BA95C88D99D64DBE75263729B30F926DFD25667B2BBEE0FF7EBCFC197689C44FD9E58DCBBD1769F26C5C28D07633F3C84EBC01B54997FEAE5497EE2B6C04C26FDF7536F74D82687BD7F1DFA8764EF6D7FEACD0F8FDB60FD2FFEB755F4EF7E781D1EB65B5847564B16870258D07C1F3DFBFBE4DBC2FF54D47CBAE9F72E70BE0B3123CF06F2142D3A04ECEF3B56B6F7B8F5B9055CD466FFE4AF3F7BA3BDEFAD3365E448632FF157CC68C96877D1EE71EF9730CC2C59DFEAF76EBDAF377EF8947C66BDEE92F5A60FC1577F538614B8F761C0BA22CB94EC0FF472275F133F8C410B1445FFA98B82C77EBCF6F64F5E5C163C0D939FDF1A60AE2E2A9BADB564A687281E45CFCC0E69D65CE51B608C5767D43A7902212C9368EF7FF4437FCFCC7633F792C4DF8729869FC9D3A4C25FA230DA7BFB208A6B8C87FD69653E86EEB18F3EFA71526FA7ED14F521EDD74561720B9D3BF86D1426D1701DED376C48EEBC11C3BDC766CBED51852594E92CA97246319BB2DBD050C08789EF34D1B17C038CF1024303A880CB2821643FD6809104CF1128BA73EBDC044C2FEB630C1A6CE51574DFDBBC677FBB0D6A878F3F77B24AD806A1EF75DEBCD0B406EAA6716C6E196D031F1864D1138CD9C6D1FAB063192352C6D963ECEFBF64CB46BFFB9973E56FFD4F6C1AEBBCA0AC738B02E9ACB4E9E6E3FEF04C13FC9889820D5B659EF751B4F5BDD06C2F77DE97E0291B0005C0AC0A4C850B7F9B45C79F83E77C9F39C8A2D8DCF0F094FD510D7A2CF9877DB45B44DB124099EA61C516C77EC2EA1A19932EA3C37EED3A1D96B8F61361968337F0BC2E569405D433671D601D3C7BDB7A53D5DA981AAACEE2D4391446A74AC88D49B23B65EAD24A6D5BA3E80D5D741E6D23F4FDACD15AD2EDC404E47EC1256493F5E3317BD5683119AEA6B3BBF1703569BCC728C1E693C57276D7F96C359EDCDDDF8DA6C3BBD5E4613AA66C6B14559F31A49BE970C4AA2F831946A6DBF9FDCA29E77278E7926DB25CDD8FA7336AB60FA97ED2F2BADFC02E273737B38F4C37E35163ABCAC1185663A4E9DD87D9E276D279F36F67E3E1CD743C1C7F649A02F2B65B012F6643A6DDC91D68B16DC6D1703923E7B91F2E56B329EB444C34CCAA68ABEEF7CBC9E2D7CCA826CBCEE53A5B7C1CDE4D97B764CB5F4C4693795AC9D57031AEC4DA59451793E5FC61F2DB8A5E4F968FA9823C8E30253CB0E1909A6F359DCF1EE60BB23C97F7EF5DB33255DC0CE91A9CFC369FA49D020DF5DD1D8CA65DE96F43A6C1C9E28EDEA358D6AC3F11B37EB89BADA61F980DCC6E8E30772E478B69D62746B3E56AD87DE7BD65BD6F86CBB292CA7CF8D1251B13E3FDCD6A38265BDA787233594D781EBE9F35D8E76A381F528BCA44325B2D66B4A665D9D24991B58E9E9109923CAFCCDEDF4C68996E9929FF3A7B3F5B2C4025BB9B18DEFF6DB29A15434BF7AB9BC9E89721B7AFCE8B9BB3B2EE56E562976C62991ED888449E1B16C3DBE96A325ADC76DEC2D16CCE74F73064EBD3F174357CF8E5084B5450E62A2DF318436051E6119BC7FE3B56518BC9FC58451D435793D12DB1C364A720D2DEDD7038CF4FC9475198B02D7CF767BC3B7F13789B684FACE926DA05EB601B44B76EF9F7FE7AEBEDA2F45C2A3DA33FC6756DB0018F0D6A2A6B7F3025CA80744255661AA860CE07BEF242AC14530B86427D56A0B37122CE709D045F226929E97C3552D64B79BE0BACE981F75674B6AB4E215D8A689235BA1069D663CE1DA5D12BB7965EBFB46CCCD046DB3467F19AC260F54EE63C8913064932E63CCB80E73C1BF2F762C8F1E131D7AADA90B9C61F60C2CA8C55F192112B133532E16589E362C530F3D990E5CD43269BA6AB87D3EE0EE2D62CF0F77BAFBCC26CAF73E5A26CAF63898B9DDADEE73A371C3601B95BA579F81FE76EF5FA3A84D68467FB272F0CE29D667EE0D1A911968600ED589940326475AA46960C21ED6D99E7422D3B9BF34B99F34DB4F6B6C1C6DB3C108F6CD8CF2FE993248F9A71E13F31F15073B5DDEDAAAED45EA7139765F55DD36DFAF8923EF5A4CD1E599601CFF9027D2D2FDBA5C755398F76B0E4F429841EE797204E88B69E7DE1D1FDB558699DF40E1C4FBED2F3B074C44CE0D576F757DE9A87CA16977DE2C329E71748F3C56499BDECB9215643FDB4CEF15472395DAED0FBA20E1FC2FCEBFD6431BD4D5F6ECC84E7576E955FCE6EEE535550EFBE47B3BBD564092F6C5D773AE993FC7CD0EAE44B2A3E5D93A6009E6B00F39F175DDD2DBAA83D5FBF987AE14B055E33E54289C7A62B9C6D695BF8CDB82E8DB447D1266CB44D81A8F63D86E7424D3CF798EF65D78D6CB56DC316F701C61EE07669166D72A0E25B60DAE519CAFCBFFF150E147067733F8EB913549EF682B1FFDEFB37DA7006330E0494B3965FD3A046B69545FEB4C6C95C8ABCE2EFB3D1746A34C4155FBA470ED81EB9F1D231DDBAB0A0B51F37C7EAD4B4F313449245E759063CE7D97EBFCB416FE1FF3E0D3F45FB1D8D67A4CA364008672B39B105D0B218EB48DA2D330D40EEB3665FAAFF230E89D739CA2CA3EDA178A64C33C42ADF00639CCDF1D4069AC3E3AA5A0E91B40CF20D2498B3A24F4CD12B7E5E4F567271B18A10CEFA3D997DD128DA044F4798699EFC709356ABE9CDD1348C5979C7E14EEB747A6C63E03C8F9AA7346A0EE3385A0759BDE12A4ECB7C846B3E09373D120D52DE24C84AC45AC6F41C3C33CDB2EA5DF7FF2089C7B6107EE9541522B253E2A22E078337A294803C2CC524B32A19AB5F43B1D492806A18D06CA5F30767D168BEE0D055DAF439475561F43111AEED9B1AA9983E7F0212517EE867923F1B5AFC7DDAB7BDED284A877A2F0813791C2AECD4AAD5426ECB712CD5122F478C19FBCF6C3A63D5B4928A4D05E0D77272457879C2506B9216C1D0940FC1755650FFB9456503E0E308D1C4C436CEC2FC6D512F9D74530AFA9117AFBD8D3C47B3C17743AA97C236F1771B9DD8649D888E60917592B029BEFAFAE245AC51FDB454A776C33BD34AEFF831B6FD5C60783D8E0C9E7FB7D0D614A0BD64D7D5D67CE35E5518BFFB384A2735BF74A9AA871F7275D2514DD23A42673549C4A60AF86DD4113A6DBE064E2917580E7F5F2EB80FFE9768FC9806FB5F13C5AEE63EF68B8D4D5CACAD453B4961977E52EEC172E71D71BF572DBA0BE3804E41A4AE8B511089810424FA64308121DA4F194D580A1AD04AAA5E09A75AB45AD6A7AE3256387CE552AE46D4ED532EEC0CD8B5881420FE8D9A8402667403C6127CEA26C1E0B581B936C5570FAAEAF0A9C080023F6E9270F09C65AA4F79C2A6943338C133E0DCC0B75C120E1E950D507C605221E1E9C76443E5DB2B3F1EFBDCE9866C4DAA175F46E8F4A427CE5FFB2831852745B678C55B901A48F8F2C4809ADFCB2B55022EFB8D20BFC7C5DDAD12075D0D9B3A527155A8EC47F012D284535DF328A1849B2473F74E0FC698F48BB331752F170FE00CA80564DE8754B514CEC8EDE0F43534540FCCCAC25CA23D6FEA813C56D4DCE222827A44C5DB5CCD72D2C2847A220530F13C2CAE40B18028C253707BD748CE7066453DB5729499FE90AA3B81E9D8456461D99C6251CEB1409BE0C2A2465086732B2824E52AA8B1B0D41FDACBA2329FC3D89FC48056F1126B64547B7A02B0E0F2A9B15C341F91CA82B13812201C0A80E6C0D5578D74EACF00B0A88B4634168EFE7DBD2C1FBB6302DA410168155CC6D548C9B8B907906891692DABF2F685EF3C79DCD545EE6FB308B8BAD038E6BCBAF59E9F83F00938EA2C427ACBDC4BE7E88F4BBA13CB5D8E71B1462217F7C9BCA424DA7B4FBE109BDDC7FA1F827D9CB04DA9F7E8A55751A3CD4E4A26ECB3356B8DB230612B2DABAF5C7B9419D2BFCB59B1BA7C843B6EF94CA2C8FB81352BF5B493B5D007EAAECBDC4B7DA57A5B6FAFB82B1CB1D5DF2ED41FB4E8730B8E30219010658F59DE2842B032CC1E0538B7844020D81E0BF8AB84582058C6BABA10B4259D174936211DF0611BB3B240780CE36C84C2690DDD104D00DD1823F4D808516038C10C81DB49648A20DC1E4DE7591222EBD2D89722389A84E042943D2677ED08D178A09B049498CA04944E5AF125E05EAAF3759361BD5037ADDFCDD8F6537C0EEAD04F0D002659173E2455E2567AA7ACC3941C44425429D21E173882848820D81EAB70F508718A207B8CCA912384A942ED910ACF8C10A608B2C70815936D489E6CA11B4561ACE4E12434E04C50C00331F68882DB45082944D96356CE15215C154AB47C758385287B4CEE23114FA7452065542DE848701F2F024F663C2D0E729C47527E13441F43F559BB59E5E83C0C6244759A93D15775A1D678F26B36F3394D7BB425860E0D3BB5837838868E58D2EFA830CB38C2102038B0432D17E20875155DD9A1CA8A9184EE81DDDCA15E81A3EC31A1033C0808C3093B53E0170F6D4D413861595DB13EA1C574154CC0420EF1101C8AA122661C4E325C164CD06C49CC84745A0612364992DF3BB44F9262090B17E4140F2D5C500C0931F7962780E581341CC9839E882925202CB0B0873DB4C0C251044CE4470F41A2187B44C9C11E04952229B8C0911EC6041144BCD2C19E84574610C62FE8780F0D603082B0F4855EF5D0EA174610EA2738EA435514E248DAE63EFC0445F370C2A88D5DFBA1811B47117B3770E0277572104746E5BEFD14A83C8E309243B77F682C8711945585E4DA0F2F2CA468CA080F9CF8E1C11D44D8E341E77E100E86937A37F0F927746F10439165E10C104BB00824D838770F88CC9B87123550F80C9414508413D1B82B41098FC71011731F83125C1E4CEA6F85E741A1A715A1945A217784B866288A323323A7837866465184B140702D888603218ED2CB440F82B8AF89B164B996EE0515722DA3087320703C88A640104ED90D297C0BE21D912281137EE54750835F2520E3EBAAED56DBCC2DA0022D0B27A3659EFF14685938194D2740A2DC0AFF7D68B8CD83EC31B8473F88C2030947C10A2F7FE85858116F8F0E1DFA41D45DCD67597A34A59F3F74BCAF4A608FAFF20308E155F1F6E882CB3F082C449DCE819DEACD96FBD99DEA81BBC3219E154C37C7B0C0EF1F5A7555C184F94963C46EB65B7E538FEE6B8BB093B1A736ACA899F1BC80CDB4F3B2E555E857FFAED252B9D5172274D5D6E43D2BB6A16297756F662D758B3E00A2ABB73E7B371AAEBED6456B35ED37BCA7652BDAC5ACE00E0D2D6885B893B1C09A97C9F6634BF9E198D3E0A2CD7C1E5D1AEA16BC1477D62EFA9C8FAEDFFAECA7AC61EC420B62E118C2910CFAE4191DC7D47E0CAD47044EB7D0C96715FC9D5934FC5ED47DC0E21FBD398C57FABCDAC98E3BBB42939DC679561D52BB2F264457562AC4328EF83055F1149574CA8A7C58A143561443E92885732BDC4D8A40124EE1F04A002A429D1ED1699FD075F9B4ACF6345AF30A024711063EE0010B0D7B20FCA5DFE5400759680804E1945B29950F2C7C3BA54A41B8E5853EB1D0152F8C20BD20E2BEB284C7433C9CF608B3F49725BEC02CC34F6652B9A9FDF8CC7252411C03F479A53EFB29AF93DA5FD5BC8A95C8BCFABED0D966E6904D826E33F5D94FD9665E858695F41DEEC7AB0A960F8763561B9453D0FC8BE90CF2A2345016A64F71519401E11494F4CABBA74059D358DB80D9C65DE17520A7AC73E46F0842A108DA0A700EDC0E89AB4018F79D5926A73D72B6C88A1D896E8835794FD9FE5E89662B2EAA06CA8594552E0AAECD7F0A4A7EA9DB344EEFE57E990658C01CEED2EA729F826274288ACF1BC91F37BE8A1E8C98DBDCAD2442046F0E86620038055B79B92B71816BCE5D4D12699E83A6CC183FB0B2049241674D612E42BA960CF94F4143DA83D7C2A10D3A742DC208836FE5AF068DBF5530E1D340E8B2068907467C6713435B634EE301E73CDA88E4720A72023D67A881924093CB968620658E532D9D4C34A0B2046BAF64EB99602A74033D4C466B5F16D1B4255A7A79676BACADDE280A3741E655601AA70E97B8A3A366421189FADCCD4FC1BA6AB23D45169DE1D57309D5294F4BD5EAA8390EDCA68569E95F5BED28822DD31AD0D852344CA116EFAC40EABAF754FAB7730AD1D7D28B3A9A06C26CC13C6A294B1DEB5809895843B3FE25664F31099F268B10FE9B337B16AC9A88EE336B594ADE99B5282E183E459ACD3C49BF975D026E528ACDE5B738F17729DDA03758FEBECDBF2EAA12DC32D17EF2E32477A0D77F7BF9E66DBF37DC065E9C13B21604A2EF440F18568CA26F7E4E1945FDCDEE42CC4EE7254D51E27883E8BC6577843A76CE63F8013C84C1EF073FC87CFA7D0AFC3DD929A4C0E699A36EBCC44F821DDD2526761A187EF19868BC3D721BF8E6F2920C0BC83D6B90FF44C605449F396E909A693B4E2A45CF28923B9769B8F1BF5EF7FFA3F79FC7379BAC9D4607914469426A4BACA67FD8795FFF11E2D9B810857C9C2DC0E948381B5AFC2DA6DF6CA1A29C22B3E5460BB8CE2D864F3CDBEF358207A0967B8D61416EEA4042F60EFB92C48BD982310066CC16D00A7ECC16902A8ACC9AC1FDCFF459A3E0CC6CA186A1795A73A81F24D1547624CB5112F0483AC3086C992DC8AC22CC6C014CA0CB6C019153663A8B8CBF68CE111E83D606C1CA7DD9F7BF68D0315A36508BF9200680EB259CC2BDEB4D7F539F4121C49F7AB33DDBD7BCEB5D32BDD4D6973C1176390B3699023B360BCC94D970C5223EC56F61F810F9316D17428ACA899498CE962FD0603AE340F64B6710487AE90C02C82EDB580C23AECB863605982E1B22F12F2E5A68A24C72E9BEB040CC964D60724ECB46081283A5FB4207B356B620734C5AE95C3189A6B285AA219ACA063503E494EEA30AA4A47446419491EE7511B8279B288D534EBA0F959866B28DA3138163B259EF05B492EE233924936C65FE9568245B193E018DA4735B217B64934E072823DD57C32559A4729362659D9C25D2B912901CB2190867846C0693334136E915050564836A20DAC736A6214CFAD8C67A49607C6C0152267B6C2AC192E0D17D4601BC8E2DB450C9E7D82E6EC5E3D81E6ECBD5CC981CDB83CBA81CDB836B4B7605A3A3B3E9712E4767041575630B0D83DC8DCE755332353AA3A988195B68A940CB68593DFB531C1591E10F70AA07D8120D4AB2BB64535B90C5D95D95537746675581F28D68EB47BD3F985DA8DF07B85D9376A5928A82EEAC90935008A205FC017452910FD2C6BA325FA391EE050D42B15E13A80ABBE8EBE5BBC51FC0B05E4367472C7D679D507482C900DD8FAF10578EFB0156C5FCE78CD1DD1CCF3FD06ADBC474647A6643AB7276B9307778BCA5472939F9DC8F85733EBE368EBF101D5F03AB2D88F89A20140C7C6D3CC669E7B0BCF6A58AF551A07819EB7CE309C9F69CABA4BED477B166C8ABD7CAA59B8A4ECFBD7A8845CFD9A620799EFB820C92E6D9B6C87A5046C473E7A99FD6A57493B6C5BE01E63DCD539239A4973B5BC6492CA154FC6F67D5B470662CF2B59D857A22F62EB1AA9D3543C242F46DEEEB2191B2ADC1C2AF2B5BA988CFCE2672129D1713959D95D2C2340509C6CE02A55839FAF0E434FB8B400A76D66F1B1D46A2EF3A8BB505B162BEADB34869176C05BB571B6351C5EFE57EBE8468BD4E79803CF7E4F67BB20DE1909DF8EA8982E4F414A21EB32250E9B4A33890B5D1495C7D836875AAC32254D2E90658C72B646706665220C5FD5D1D498F59F7529134590BD91BD980D012F25B922A730B5A060446622F517EFF8B5B360937BD45B4950CBB6C554A1A3410A36E0FDB2478DEB23D4AF2EDBA7F3918BC912456E1569F5C03C42A1063FD410262F6E3EFD381D5DB8EA2740EF302998990B74EDD1621B969A0525348F132C498B1FFCCE6E794E5516830B15802E31F2F52E843266121BA2B4B23B2A39A7355F81B89D56C16E697AABD74859132538DBC78ED6DE44E99927A99EA5063D4BA249D1824C9265AB23F874E60A0017C59B35351C4B5317EFD202678126362B34A58513D1EC148C1D3F207FE2D46ACB54CF4121DA81F858B36A99F50D55F3E40735726E8C4A860094718DA942DB329177EE6F02226C39F593FC41A6FF040C3E04D36502B083DCA00861F87838AE0884EECAACED77DEB5685DA63539EDE87FD516CC99EE5156813BFFE05DAC41147B12CCD3E54572B98A4136B33B83F6FDDE0ECF87D1D37DE2F678186059A46D37AEDFE20D647B48097B33D23CBF2112C0FBE577BD8EA7CFA026DE3076E40C738E22896879F6182BAE0884EAC6C5EEF86B6753B33B84A96CB9BD73A12EEC0B8045EEFEADE0673704B9655D0B497F720154575AF3AA02BF40A23732EEFEBFEE631D57D71A45F248815CB7D5C8CC8792C152526501687BEC83695286C4AE5128504EA129123044391D52191545815A52C268BB69022A4FED336C8DC1A8B92947B30B948653275D962520B81D6176E2E935014D811480581386531E57EC85406DE7848C5E0686549CB6AF365D1203EEFAB5AC423754D2A9C3B188AC1CB6FA9201CAD2C8A27B16853759B2F37A98A53B7A870FF652A03CF655231385A59D20D98D64DA5E1595C2A0D472B4B9B573EDE8DDD49F5305BEE56AA54EAEE25A4B4A880F0805951B890425330F4A06D5B2A7C9FAB2D1826AA29BBF2E86C2A1DBCF8940A0571CAB2B8935E7321E815A3A22014AF29AC4C631EC8E00B3F791C83B1EA618CFB403596243C37930B1312A8CBAB12D90CD2E2130ED5482DA6D10DD7209DB168E1C19254AC10AF2C7205BEC3B228AEB699566DA434507761A05D2ED9ACD13E8A372D8BD4950161DAAA9D2975090D5359397FAAEA825DF6585D7AF7401E414416B7E4B5F74C5C327294B489515D9282FC55A0B8A9C44DA688437B7D5B27125BF762AE0DB2BA2853E0D40BB85D3115A7593431A9DD5875663D2F2132CDE597424E36D764FA8B32D016145E2396BA4D572E626582C622515EEE280462BE04D25D03813680D01A51A8B64AA5AB632D8243D36BEF221422A078A8D3DE5E80E6E0881A81D44F58756EF7BA12927E80A1B8C8D31CB06383D134E56404A43DD55508C7EE04B8E60C18340847D40847B5A9CD107084B52024AF823CEEEA225F191501ECA7E43DF0EA627108537A88FCD7D88F83A70A2275AA1AFA6B74DAC9D3A41B94F2E855A851994478EB78EBB3C1C24BBCE13E093E79EB245FAAC641F8D4EFFDEA6D0FA9DDED1EFDCD349C1D92E743C29AECEF1EB7DFA030D2C3DBBAF2AF2EA43A5FCD9ED35F711B4DF835D350E2CFC2F78760BBE1F5FEA07864A981484F858B17DFA92E533E50FFE91B47BA639B4C3BA0427CFC307BE5EF9EB70C2C9E854BEF8BEF52B7FBD8BFF19FBCF5B779E104520F62560416FBD538F09EF6DE2E2E30AAFCEC27B3E1CDEEEB5FFE1F87B09B94F23A0100 , N'6.2.0-61023')

