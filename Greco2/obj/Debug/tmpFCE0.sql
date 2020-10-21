CREATE PROCEDURE [GetMotivosDeReclamoPorServicio]
    @servicioId [int]
AS
BEGIN
     	
    Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts on
    tm.servicio_Id = ts.Id
    and ts.Id = @servicioId
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoPorNombre]
    @nombre [nvarchar](max)
AS
BEGIN
     	
    Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts on
    tm.servicio_Id = ts.Id
    where tm.Nombre like '%'+ @nombre +'%'
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoPorTipoDeProceso]
    @procesoId [int]
AS
BEGIN
     	
    Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts 
    on tm.servicio_Id = ts.Id
    and tm.tipoProceso_Id = @procesoId
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoPorId]
    @motivoId [int]
AS
BEGIN
     	                
    					Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts 
    					on tm.servicio_Id = ts.Id
    and tm.Id = @motivoId
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoWithAllParameters]
    @nombre [nvarchar](max),
    @servicioId [int],
    @procesoId [int]
AS
BEGIN
     	                
    					Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts 
    					on tm.servicio_Id = ts.Id
    where tm.Nombre like '%'+ @nombre +'%'
    				    and tm.tipoProceso_Id = @procesoId
    				    and tm.servicio_Id = @servicioId
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoPorProcesoyServicio]
    @servicioId [int],
    @procesoId [int]
AS
BEGIN
     	                
    					Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts 
    					on tm.servicio_Id = ts.Id
    				    and tm.tipoProceso_Id = @procesoId
    				    and tm.servicio_Id = @servicioId
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoPorNombreyServicio]
    @nombre [nvarchar](max),
    @servicioId [int]
AS
BEGIN
     	                
    					Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts 
    					on tm.servicio_Id = ts.Id
    where tm.Nombre like '%'+ @nombre +'%'
    				    and tm.servicio_Id = @servicioId
    
END
GO

CREATE PROCEDURE [GetMotivosDeReclamoPorNombreyProceso]
    @nombre [nvarchar](max),
    @procesoId [int]
AS
BEGIN
     	 
    Select tm.Id,tm.Nombre,tm.tipoProceso_Id,tm.Activo,ttp.Nombre as ProcesoDescripcion,ts.Nombre as SERVICIO 
    from tMotivoDeReclamo tm 
    					inner join
    					tTipoProceso ttp
    					on tm.tipoProceso_Id = ttp.Id
    inner join
    tServicios ts 
    					on tm.servicio_Id = ts.Id
    where tm.Nombre like '%'+ @nombre +'%'
    				    and tm.tipoProceso_Id = @procesoId
    
END
GO

CREATE PROCEDURE [GetOrganismosWithAllParameters]
    @nombre [nvarchar](max),
    @localidadId [int],
    @provinciaId [int],
    @regionId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    where tOrganismos.Nombre like '%'+ @nombre +'%'
    				and tOrganismos.Localidad_Id = @localidadId 
    				and tOrganismos.Provincia_Id = @provinciaId
    				and tOrganismos.Region_Id = @regionId
    
END
GO

CREATE PROCEDURE [GetOrganismosPorNombreyLocalidad]
    @nombre [nvarchar](max),
    @localidadId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    where tOrganismos.Nombre like '%'+ @nombre +'%'
    				and tOrganismos.Localidad_Id = @localidadId
    
END
GO

CREATE PROCEDURE [GetOrganismosPorNombreyProvincia]
    @nombre [nvarchar](max),
    @provinciaId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    where tOrganismos.Nombre like '%'+ @nombre +'%'				
    				and tOrganismos.Provincia_Id = @provinciaId
    				
    
END
GO

CREATE PROCEDURE [GetOrganismosPorNombreyRegion]
    @nombre [nvarchar](max),
    @regionId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    where tOrganismos.Nombre like '%'+ @nombre +'%'
    				and tOrganismos.Region_Id = @regionId
    
END
GO

CREATE PROCEDURE [GetOrganismosPorLocalidadyProvincia]
    @localidadId [int],
    @provinciaId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                               
    				and tOrganismos.Localidad_Id = @localidadId 
    				and tOrganismos.Provincia_Id = @provinciaId
    				
    
END
GO

CREATE PROCEDURE [GetOrganismosPorLocalidadyRegion]
    @localidadId [int],
    @regionId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                              
    				and tOrganismos.Localidad_Id = @localidadId 				
    				and tOrganismos.Region_Id = @regionId
    
END
GO

CREATE PROCEDURE [GetOrganismosPorProvinciayRegion]
    @provinciaId [int],
    @regionId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    				and tOrganismos.Provincia_Id = @provinciaId
    				and tOrganismos.Region_Id = @regionId
    
END
GO

CREATE PROCEDURE [GetOrganismosPorNombreProvinciaylocalidad]
    @nombre [nvarchar](max),
    @localidadId [int],
    @provinciaId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    where tOrganismos.Nombre like '%'+ @nombre +'%'
    				and tOrganismos.Localidad_Id = @localidadId 
    				and tOrganismos.Provincia_Id = @provinciaId
    				
    
END
GO

CREATE PROCEDURE [GetOrganismosPorProvinciaLocalidadyRegion]
    @provinciaId [int],
    @localidadId [int],
    @regionId [int]
AS
BEGIN
     	
    Select tOrganismos.Id,tOrganismos.Nombre,tProvincias.Nombre AS Provincia, tLocalidades.Nombre AS Localidad,tRegiones.Nombre AS Region,tOrganismos.Activo
    from tOrganismos
    inner join tProvincias
    on tOrganismos.Provincia_Id = tProvincias.Id
    inner join tLocalidades
    on tOrganismos.Localidad_Id = tLocalidades.Id
    inner join tRegiones
    on tOrganismos.Region_Id = tRegiones.Id                
    and tOrganismos.Provincia_Id = @provinciaId
    				and tOrganismos.Localidad_Id = @localidadId 				
    				and tOrganismos.Region_Id = @regionId
    
END
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201909091452275_201908190017127_cambio2IdMotivoDeBaja', N'Greco2.Models.NuevoDbContext',  0x1F8B0800000000000400ED5D5D6FE33C76BE2FD0FF60F8AA5DCCDAC9BCBB403B4876E1B19579BD4D6CD77606EF5DA0D84C46AD2C7925394850F497F5A23F69FFC252DFE79014455292E3CC1A030C627E3C24CF39FCE679F4B7FFFBFFAB3FBFEEDCDE0B0942C7F7AEFB97838B7E8F781B7FEB78CFD7FD43F4F4FB7FEBFFF94FFFFC4F57D676F7DAFB9EA7FB254E47737AE175FF4714EDBF0C87E1E607D9D9E160E76C023FF49FA2C1C6DF0DEDAD3FFC7C71F1EFC3CBCB21A1107D8AD5EB5D2D0F5EE4EC48F283FE1CFBDE86ECA383EDDEF95BE28659388D5925A8BD99BD23E1DEDE90EBFEB7806CFCCF832461BF37721D9BD66145DCA77ECFF63C3FB2235AC32FF721594581EF3DAFF634C076D76F7B42D33DD96E48B29A7F2993AB36E2E273DC8861993187DA1CC2C8DF69025EFE924965C86637926DBF901A959B45E51BBDC5AD4E6477DD1F059B1FCE8B3F89FC7E8F2DEECBD80DE2A458B8E16042BC83B771EC4199F9532F4DF2A9B0056A32F1BF4FBDF1C18D0E01B9F6C8210A6CF7536F7178749DCD7F90B7B5FFDFC4BBF60EAE0BEB486B49E350000D5A04FE9E04D1DB923C65359F6EFBBD21CE37643316D9409EAC450787FE3DA365DB8F2E292C6028CDFE44363FEC7140EC4DA28C14696247644D8D561B6DE6EF1E0392C350B3A47DABDFBBB35F6F89F71CFDA0BDEE82F6A61BE7956CF3900CF7DE736857A499A2E0A05FAEF51A112F042D1014FD872E0A9E90706307CF7698173CF5A25F3ED7C05C0D4B9B955A726E955E448CAC99E61B608C77306A500113FB66B2CBA50C44B38AFC807C231E09A8316F17761491C08BBB0B49A45CA7D8C8D9FBA068895DD13F952C4B5EDED6A17AD9C82DB89D92E8F0EAB89D9762EF89EB3A5B5F52D01F3B190A5CC72376E7CDF3EA06BA6E1A370BFCB1EB106090594FA8CD36F137871DCDE86B659C3F86247849E60612762ED43571C993EFC96CA69D8292CECD0AA4B3D2A6DB6FC161AF27F80915051DB6F23C5F7DDF25B6D7F6BC62B64402B9DF713A6932971C7322192FADD17A3A9F4D466BABF1FA2A075B58CBD57CD6B9E54EACD9FD6C3C1DCDD6D6C374A2B3C411547D4E916EA7A331AD3E0F56D383EE16F76BA39CABD1CC249BB55ADF4FA673DD6C37B17EE2F23AD7CCCDCABABD9D7FA3BA998C8F54182DABFBA17276335FDE599D9773379F8C6EA793D1E41BD534D097DA6CBA9C8FA87558332011D58CE3D16AAE9DE77EB45CCFA7B41352D150ABD49BC1BFAEACE5F7C428AD55E7729D2FBF8D66D3D59D76CF595A636B1157723D5A4E8E60684B6BB578B07E5BEBD793E6A3AAD01E87A8121EE870AA9B6F3D5DCC1F164B6D79AEEEBF9A66A5AAB81DE96BD0FA6D61C59D42345528748BBF8CA836ACE54CBF77D0AC49DFD0CC7A339BAFA737549FF3DB23CCA3ABF1729AD8F778BE5A8FBAEF8877B427CD71594A52598CBE9964A362BCBF5D8F26DA5633B16EADB555E429D6B935B6B61E2D46BA45252299AF9773BDA625D9E20990B64E3F2315A4F61C31FF7A6BE965BAA3A6FC7DFE75BE5C824A7637C87FFD8BB59E67C344F78B0F6BFCEBA8B0AFCE8B5BD0B266EB7CE1AB6D62891EE888A43DCE2F4777D3B5355EDE75DEC2F17C4175F730A26BD5C9743D7AF8F508CB5550E63A2EF318436056E6119B47FF3B56514B6B71ACA28EA12B6B7C27ED30EA271BFECED938AEE3DF91AD636FFD40EB8823CF3410C17CB8FBA0EECF360A31B560209AC709B962EA9B2BC7196D22E7C5E7D61F752833FBC5794E645851AF7E6F49DC2441F8C3D9A7D7B603604D0FDB5C7621154FE0EF96BE0BB2E3140F6B3B782611ADA52F4DB6F20FC1C6F450B0598F39779446F7A2ED0CA36D1B33B4D136CD39B7D31A73CEADDEC89CAD30A2905AC69C66191439CF86FCB3187278784CB52A36E442E30F306169C6A278CE8885891A99F02AC731B16298F96CC8FC8A33914DD3D5C3697707763DEF9020B0F33BB0F63A572ACAF63A16BBD891F63ED3B9E1B075B4BB559CA7F8E3DCAD3E5E87A834E179F06C7B4EB8AB981F8AE8D808734380762C4CC019B23855234B8690EAB65CE4422D3B9BF37B99F3ADBFB15D676B6F1FB8C6D59C5606FE8B138FE6BA1997E4998A473757DBDDAEEC4AED753A765926EF9A66D3C74BFC6E486FF648B20C8A9CEFD0D7D2B24D7A5C99F368074BCA0F75D4707E75C248D3D66FE287D1DDDFA5E4D6A9DF8143EB553F0F4DA799093C01ECFE9EB4E2D59BC20D11FBF2C6F889D56269AD92A71DB79AD510BFCD323C955C4D576BF4C0A4C39710FF796F2DA777F1D5FD9C797F6356F9D5FCF63E5605B8AE5315E17CB6B6566BFD8CF183CE7494EAE41D7E313F6B8DF945AE01CC7F5E6575B7CAD2EDEAD5ABA777BE45286A265C1915B1F192C6CD6D8BA0C551551A6E535299B0D1BE04A2AAF79822176AE2B9C7FC2CDB6C64AB6D1B36BBF0AFED0166B7647E2C9209F96AFF979E6DC38C0306E56CE11FC9C2B56D654936AEAD7944C3E4657F9F8DA653A3D19CFEE31D924377488DD711F13A96066D48D81CAB53D34ECF8FB42C3ACD3228729EEDF7A71CF456595FD0B28D3CD300E43EDBC77BD9077257FC9856B82E0E04B4ECB0CC364008675B3C99B976EC6F9DE72358E733F1B671B59ADEBA4FBD9096771CD7FECEBB54B636D1EE5359BE01C638F7AAE38CF0552A1E85A14FF7C771BDF937A0F0451FAEB2E56D7B6ACFFBD246304F056973A8729D3D5527ADD375FF9293496D01C519565980F8E1372EE9775C49D43048106BC676C77EDC516DC78B782B8A8F11F6B6ABD46A26B7A215C64A2ACA616326644F07235A4D25A9A85400BE9EE62B5294C774943A695D0D8145C90D4DF830A8CA0AE4CFEF4A1B008FE5581363DB38F7D2BBA65E3C64C62456633BDCD85B7E84A55D67AB552F816DE2777C9DD8A44C4447B0489924548A2F5FE3BD8B358A9F1A54A9BDE6DD41A977FC38A74EEF7505080C0BBE6393C26BC8A2F20CB6AAB6F507B26585F1B5C0513A69FD4548593D7CCFD74947AD93D6113A6B9D4454AA80AFCE8ED069D3150CCD13D11C24C8974B07F2E24F1EE360F21A09D6A4F721C996A561B63262ED24865D91285F41A7F47F61BF572E9932E380B4825CD7C52880384C84C4D2BA29A2C9A094708AA5423EFD8B6B275C49D5604B1175808A47C21C0A98426B3056E0AD31078327E3FADA64CFCE44D529C6DE1A14F8BA94C3C193445D7DF20309A19CC181470DCE2DBC5BE370F0305803558C0422243CDED7D95072C511A6B762223362AFDE54F1B23B130924BCA1A9414DCFAF85720387E275169A1D730A0D141EA0D6E0C4FB69DAC054F12230E61C4C0D2EDBA157C0C13300060F8CDDFCD0C07A8981C4727F32767251DE7F16CDC3E313375B29EF3701A0783065D72558200AC2123B4CF0A2AADF3FA9EFA040AB8A12253292EE7A00161C851BCBA5E231302F1885A5BCC6621E34070EE212E9C8D7EE58D459231A0BA7FAD9042F1FB5E5BDDE021FB40ACE061229D52ECA01249AAB9465959F79152BC622EE6A98326D670157C30A4AEEAB3B7BBF77BC6740D19D85F456293FF7F8F72B7DFAEA5D8A31DC2091B3EBDBA2A4C80FEC67C2C426A7E0E4C609C2686247F6A31D1F008EB73B2E19B33EAE18FDF3C2982530AFBE7C36C833C47FE75746E5912F5C29F37B892CEF0D6D564CBF99B4900075CB32F7629674DBB503C109EDD8770F3BAF7A83549D9BA1C086404C943A667E8E0BC1F2307514406B0D8140B03A1660AA86582098C7BA1A32DAE2F6799C4D701B736C634A1688B64FC656C8ECB2F42DB10EA05AD288B11A4B5BC2852DC3E4E8A8212A17A98E0B68A721220856C7CA88A5214E16A48E51D246439832541D29E381863059903A8627E8C59E762F86A4CD683C00E15A6880BA98C10331EA880CC9338464A2D4314B2A670857866A5ABEB8C14C943A66C1C88C278D2C50674CCDFC55701FCF024F6E3C6D61306D36921A0DA35563A8DE008A6998211E8ED147CCFD7D4498799C86493194CBA8E54C9C465D59F26554593652A323616266D49D70943A26A46C8680305C630905989CD11A0A84ABA301826708068235B0108533824331BA8889D3180F97046B6836F704433ACD03D57178A66508C8C76A4C848886194D8428460B31E56766C0D2403D1C8EB399C5E412684CD898D3194DD8384A03133137234814A38EC8513A43502E5207175037634C10A18997533A73787984C6F805A99ED100062334965290C719ADA6608446FD186A685445264E4BDB056B34A3E8225C63D4C664D268E0C6519ABD1BD04C739D1CC469A3160CD402D4224E632487E4D4682C87113AAB0A8E801A2F2CB8689D111E504DE3C11D44A8E3410A6A0807C3B57A3760A666BA3788D1916546598D2598056AD87841628DCCBB08D5D440C66CCD29200BD7442B08AF39BC2246133165C2E6E0D260ADFE96F163333D2D0BD5A91522CDC63543513A3333A2C6C633338AD2180B18026C341C30713ABD8CE5B9C67D8D8DD5966B4E822D906B1EA53107027A6C340582709DDD9080011BEF8804098CF04BB6EB0AFC3281367E55B5CD6A9B90570BD092706DB4849F5A8096846BA3550950536E19CB341A6ED3A0D339AA115D2B9B9FDA889EF2181CDF28C17473390328A6D17C5B066B8C4CE0D5331A9624AFA1ABD172670B8894879D8C3DB56145CD8CE71D6CA69DCBB70FA1DFEAA71F8ACA2DDFC2E9AB5692F7ACD8868A5DC99EF528EA163D75D457AF3C7B371A2E1D01D02C5DE91E705AB652B98C619877D15286893B190B943C9E521F5BF227B246834B65E6F3E8D250B7E0319BB176D1C3657DFDCAB39FB286315B2BC4C2311A9B71E44D8136E2523F8B6A44C0EF8ACEBCCAE09FCCA2E1CB78F301AB78296D305E55E7AD9CEC0A5E5534D955F0B4CA90DABD2B6759534588799CC639564AA88A8EAFD2208DF33544978A8ED7508C4E47C978547137C902B570326E5506280B357A8E53F918A7CB472AD273C88AFB6F1CA531F001B25534EC81F0F77E9101B958D11008C275EE234474ABF85E429442E37E0FD2AFA2CB3D18A1F576A42065659E8D14E17ACFB972A656F62D571E7E3293CAADF47DBCE2A482BCA9F4E71579F6535E27B5BFAAF9102B11E002616C33D03FC2C066E4D94FD9663E8486B1A3A2F9B92AE3CF6870B65A877056755BAACE7D481B6B1BB89A9A2B5C0672CA3A474499100A45E8AD2616802F935D51C0B89FCC320B3F64638B2CDD95F50D5192F794EDEF4368B6740E373FF9073EE40607FFB2DCA7AC5E815787B64FC7873011C6EFDFD84E303D80BEA5D4E43F655BC97924D196360BD3B096922612194C19ACF1E41E324522F1C0889FD392B389BA99252F4A660A335396019C822D77AD23EC4D5F7165841918142E87406AD92550F5855F4C1C5075102CA26DE0E5A6A4398429A6B5021531AD6325C996521D4B2169D690A54AE0F5CF3126B0490AEBCB428ADF056342C6568068149296C5A408498BC28C3981A52F4893F47BC9C9C536A62E58BD8511D90DE20483D55FDDD453B64C704745FB44C228A583ED7FBEB8FCDCEF8D5CC70E53A28B8C98E10BCB08A6C4D470F94BCCD440B6BB219B5D9FEF214609C32D62ABE5C975AB580F8EC16A7BF09CBF1E889330D43E3924D0A63866581252D4AD1D91C8E4036C9802D77BB1A968EC0091E05E5E5C68C302D20409F21F0C3E3118E6040A29AE139B693B94CB2C511C476F37F5B6E4F5BAFF3FBDFF35311B291B41BD0531D941EB6B49900D3E8B81080EB006FF6567BFFE2B0455E1CA0614072DA06544072D20955C071233FDA3BEFD67E4072DD4D0ABEFA006F5836C08C28EA452354C81600CC3D01EB420B392F9A0053086F7A005C482FBC05864CCA73B1F9DD607C12E47C026C35FC7631FA6276838B78ABF51DAC874585202D5495050399687C0D81819EE01631C4839600C0299068C416ED8EFDB36D2192618680D107CAEB6D96884BF42DB088B6718309F5C10AD4013989450A01102471F603ED961CA8016648E19038C2BC67104B45035C411D0A0668019C07C74817C00C628C85FDFBC2E8CE37F13A515FEFEE64326F6F16FD6D5805B7F53A0C293DF7C1C87FEFBADCCBE9CE77E2B8326F0DC376E2B74D86FD2D58097BEF9F234F7CF172E4F956CB270CC37AE04F4C76F065238E13783499DEF9BF48ACCEBBE413590A77D1B930FF6B36F6371C338D9B700C9FBD7379560EE536F3E8F0057FA165A2874A16F17B7749D6F0FB7E56A26CEF3EDC125DEF3EDC1B525BBCC895ED1F4D437FEC20F51B47C02D0ECE8BC931D3FF06DAF518E121CF46E07B5AE96639CED4B6FFADB4399F3536F1E6C49F0A57741A5DCEC43C42D9E0CFD83D985F862C4A8C776A612F06995B3424E4121F873373FBF4E4A5771BDB12ECFD768A47B4783104CF28C6379177DBDF802D2CF6F581FA1B3E36F499D75A2A113ECBA6D7EE6813C9BCC4F3D4A3F6D638CEEE678C977D59B995895EB73BDA19539BB5C988B6FFC0C51720F6AF3B3C4D47BBA8D3313E43CDDC06A33B7E9260899BF741B77F7ED9CB04A2FB695CF8FD8FB3BE32B5CE81A6D5C25F13DB08935432FE856EE6744CECFE6D5433ECFE6E202AECEC620D0C3B9F59762F8938DE7995FAB4755CDD90ADB0698F7340F4916E8139C67CB38851514F725D3B35A4E492DF06BB067CDE86021375EF3599B75DD6DB03CE9CA56C0B77ECF26720A9D177D36F9AC120D95A0A7BFA7A95CE633D667F56A1D04675EAD6D28B8F46B353F9846EEACA76E750BF0B5F3B3D935BFD457F1F854135FBDBBA6E08051E63E592F7DAE48BDCD2293BDD17E916989F665579959A31A555A06AEA5FCD5FCC3B6F8A601F701EAFC7BE0E8263F6D4BF2B572147E7770E9C2D0A558D1DB75FF92935009277E390270C5097001BFE30AA0764482B867D9EED88F0731DBE15DB01741BCDBDEDBAEA0694C5AC55121967B81CAC64CC89E0EC9B143BBA4E92AE5CA3E8270352C8A617A4C9D4890DBB1DC648A6BEA87B082FB1C6818DC6903B58250D658D816CDBDF460B717CF1EB15BF0D80E37F696EF77B14775552DF0E53AA8088EE8C4AE64CCEEAD5B550D93BC70A0AD606C3F8A2DA9D303006DE2DB53A04D1C7114CBAA9826AB6A059374626D3564DFAD1B9C1A3184E1BAE0FD2C5044FE80473591A6ABB5FB0F627D9A16F07EB6574BCF7104CB8307FE0F6E15832DD036BE21003AC61147B13C7C8F05EA82233AB1B2859C74B5753BAB2106E6CB5B4869733B302E8610A63C4FC0E42D9C6565FC3EF9FEBCE436E995FB874CAF30322581B9EE6F1F63DD675BCD2C412858EEE36258B20CAE283681B0389048BD487979F585299424DCB0F0450A9389CB66932AB4575E787D991A4581E5335710881316936F1EEACAC0AB74AE181C2D2C097CA549A141C524296A511159D5A48C42ABA618BC56E50AC2D1C2A2C0B7616ADB541EC9F24D2AE3C42DCAB80BEBCAC0033F570C8E16960459DCEB4AC3531E571A8E1696B628E9BF6BBB137B0DCC77293685B85B213E6AD552E12D6765C13091A4EC921FB9AE74706FC6150AE284651594B7B51D1BDE05F1FD1AC68ABB75C1C05A57127331C195C5C40B4B5B577EFA40581C3C911696071354169825D21A4FA4435855C29A31261FD896C4E5EA8219EBE4278B3D90989F8F2ACF20AB4F210B4130E1DCB2ABEED811008913B0CB63DC6C0591084FCE0402A93F61AB3A63036D00A1125188A656FEA382CD9B2E3DE81188408737B2F26808340747480422EF473232CCAE84949D45280B494C5C59717A810DA6A2292723A0CA2DB340386ADB6BC9061B3408474884235A04F15F87511704C7F559C45D0DD3013B0BA03F394E4FBAA13C78F1DBE5F4D78484CE73097145313DB2415BC922CDD47BF2F37D2D53A33C09E7BD4A070BBACF1C0591F3646FA274DE0A1DEFB9DFFB6EBB87D8EE768F643BF5E687687F886893C9EED17D83C28877C6B2F2AF865C9DAFE6FBF857D84613BE271A8AC8DCFB7A70DC6D51EF1BC1055B0544BCE5CEAE79635D46F175EFF35B8134A3AB2235A04C7CC549C19AECF62E050BE7DECA7E212675BB0FC92D79B6376F8B8C9AB51AA45E1158EC5713C77E0EEC5D986194F9E94F6AC3DBDDEB9FFE0E2398145FDAF30000 , N'6.2.0-61023')

