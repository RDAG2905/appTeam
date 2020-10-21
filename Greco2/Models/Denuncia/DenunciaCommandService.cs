using Greco2.Model;
using Greco2.Models.Helper;
using Greco2.Models.Log;
using Greco2.Models.Reclamo;
using Greco2.Models.Validators;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Greco2.Models.Denuncia
{
    public class DenunciaCommandService
    {
        public DenunciaDto updateDenuncia(DenunciaDto denunciaDto,string expediente,int? motivoDeReclamoIdDenunciaEditada)
        {

            using (NuevoDbContext context = new NuevoDbContext())
            {
                
                DenunciaDto denuncia = context.getDenuncias(true).Where(t => t.DenunciaId == denunciaDto.DenunciaId).FirstOrDefault();
                
                int? expedienteId = null;
                int? reclamoDenunciaId = null;

                if (denuncia != null) {
                    expedienteId = denuncia.EXPEDIENTE_ID;
                    reclamoDenunciaId = denuncia.RECLAMO_ID;
                }

                if (expedienteId.HasValue)
                {
                    var numeroExpedienteExistente = "";
                    ExpedienteDto expedienteDenuncia = context.Expedientes.Where(unExpediente => unExpediente.Id == denuncia.EXPEDIENTE_ID).FirstOrDefault();
                    
                    if (expedienteDenuncia != null) {
                        numeroExpedienteExistente = expedienteDenuncia.Numero;
                    }

                    if (expediente != numeroExpedienteExistente)
                    {
                        ExpedienteDto nuevoExpediente = new ExpedienteDto();
                        nuevoExpediente.Numero = expediente;
                        context.Add(nuevoExpediente);
                        context.SaveChanges();
                        denunciaDto.EXPEDIENTE_ID = nuevoExpediente.Id;
                    }
                    else
                    {
                        denunciaDto.EXPEDIENTE_ID = expedienteDenuncia.Id;
                    }
                }
                else
                if (expedienteId == null)
                {
                    if (!String.IsNullOrEmpty(expediente))
                    {
                        ExpedienteDto nuevoExpediente = new ExpedienteDto();
                        nuevoExpediente.Numero = expediente;
                        context.Add(nuevoExpediente);
                        context.SaveChanges();
                        denunciaDto.EXPEDIENTE_ID = nuevoExpediente.Id;
                       

                    }
                }
                //if (denuncia.RECLAMO_ID > 0)
                //if (denuncia.RECLAMO_ID.HasValue) reclamoDenunciaId
                if (reclamoDenunciaId.HasValue) 
                    {
                    var reclamoDenuncia = context.Reclamos.Where(unReclamo => unReclamo.Id == reclamoDenunciaId).FirstOrDefault();
                    if (reclamoDenuncia.Id_Motivo_Reclamo != motivoDeReclamoIdDenunciaEditada)
                    {

                        ReclamoDto nuevoReclamo = new ReclamoDto();
                        nuevoReclamo.Id_Motivo_Reclamo = motivoDeReclamoIdDenunciaEditada;
                        context.Add(nuevoReclamo);
                                               
                        context.SaveChanges();
                        denunciaDto.RECLAMO_ID = nuevoReclamo.Id;
                        
                    }
                    else {
                        denunciaDto.RECLAMO_ID = reclamoDenuncia.Id;
                    }
                }
                else {
                    if (motivoDeReclamoIdDenunciaEditada.HasValue) {

                        ReclamoDto nuevoReclamo = new ReclamoDto();
                        nuevoReclamo.Id_Motivo_Reclamo = motivoDeReclamoIdDenunciaEditada;
                        context.Add(nuevoReclamo);
                        context.SaveChanges();
                        denunciaDto.RECLAMO_ID = nuevoReclamo.Id;

                    }

                }
                
                var usuario = HttpContext.Current.User.Identity.Name;
                var denChValidator = new DenunciasChangeValidator(denuncia,denunciaDto,usuario);
               
                copyData(denuncia,denunciaDto);
               
                context.SaveChanges();
                denChValidator.registrarCambios(context);              
                return denuncia;
                
            }

        }

        public ConciliacionHelperClass updateEstadoConciliacion(int? id,int? conciliacionId)
        {

            using (NuevoDbContext context = new NuevoDbContext())
            {
                var subestado =context.SubEstados.Where(x => x.Id == conciliacionId).FirstOrDefault();
                var helper = new ConciliacionHelperClass();
                helper.ConciliacionId = subestado.Id;
                helper.CierraDenuncia = subestado.CierraDenuncia;
                DenunciaDto denuncia = context.getDenuncias(true).Where(t => t.DenunciaId == id).FirstOrDefault();
                denuncia.CONCILIACION_ID = subestado.Id;
                //save changes to database
                context.SaveChanges();
                return helper;

            }

        }

        private void copyData(DenunciaDto denuncia,DenunciaDto denunciaDto) {
            denuncia.ETAPA_ID = denunciaDto.ETAPA_ID;
            denuncia.TIPO_PRO_ID = denunciaDto.TIPO_PRO_ID;
            denuncia.CREATIONPERSON = denunciaDto.CREATIONPERSON;
            denuncia.CREATIONDATE = denunciaDto.CREATIONDATE;
            denuncia.DENUNCIANTE_ID = denunciaDto.DENUNCIANTE_ID;
            denuncia.TRAMITECRM = denunciaDto.TRAMITECRM;
            denuncia.OBJETORECLAMO = denunciaDto.OBJETORECLAMO;
            denuncia.FSELLOCIA = denunciaDto.FSELLOCIA;
            denuncia.FSELLOGCIADC = denunciaDto.FSELLOGCIADC;
            denuncia.EXPEDIENTE_ID = denunciaDto.EXPEDIENTE_ID;
            denuncia.ORGANISMO_ID = denunciaDto.ORGANISMO_ID;
            denuncia.ESTUDIO_ID = denunciaDto.ESTUDIO_ID;
            denuncia.MODALIDADGESTION = denunciaDto.MODALIDADGESTION;
            denuncia.SUBTIPO_PRO_ID = denunciaDto.SUBTIPO_PRO_ID;
            denuncia.SERV_DEN_ID = denunciaDto.SERV_DEN_ID;
            denuncia.RECLAMO_ID = denunciaDto.RECLAMO_ID;
            denuncia.CONCILIACION_ID = denunciaDto.CONCILIACION_ID;
            denuncia.FECHARESULTADO = denunciaDto.FECHARESULTADO;
            denuncia.RESP_INT_ID = denunciaDto.RESP_INT_ID;
            denuncia.grupoId = denunciaDto.grupoId;
            denuncia.nroClienteContrato = denunciaDto.nroClienteContrato;
            denuncia.mediadorId = denunciaDto.mediadorId;
            denuncia.domicilioMediadorId = denunciaDto.domicilioMediadorId;
            denuncia.reclamoRelacionado = denunciaDto.reclamoRelacionado;
            //denuncia.idDatosCoprec = denunciaDto.idDatosCoprec;
            denuncia.fechaHomologacion = denunciaDto.fechaHomologacion;
            denuncia.nroGestionCoprec = denunciaDto.nroGestionCoprec;
            denuncia.honorariosCoprec = denunciaDto.honorariosCoprec;
            denuncia.fechaGestionHonorarios = denunciaDto.fechaGestionHonorarios;
            denuncia.montoAcordado = denunciaDto.montoAcordado;
            denuncia.arancel = denunciaDto.arancel;
            denuncia.fechaGestionArancel = denunciaDto.fechaGestionArancel;
            denuncia.OBSERVACIONES = denunciaDto.OBSERVACIONES;
            denuncia.DELETED = denunciaDto.DELETED;
            denuncia.ECMID = denunciaDto.ECMID;
            denuncia.agendaCoprec = denunciaDto.agendaCoprec;
            denuncia.INACTIVO = denunciaDto.INACTIVO;
            denuncia.PARENTDENUNCIAID = denunciaDto.PARENTDENUNCIAID;
        }

        public void loguearModificaciones(NuevoDbContext context,DateTime fechaCambio,
            string objetoModificado,string valorAnterior,string valorActual,
            string descripcion,string usuario,int objetoId) {
                        context.Database
                        .ExecuteSqlCommand("Insert into tDenChLogger values(@fechaCambio,@objetoModificado,@descripcion,@valorAnterior,@valorActual,@usuario,@objetoId)"
                        , new SqlParameter("@fechaCambio", fechaCambio)
                        , new SqlParameter("@objetoModificado", objetoModificado)
                        , new SqlParameter("@descripcion", descripcion)
                        , new SqlParameter("@valorAnterior", valorAnterior)
                        , new SqlParameter("@valorActual", valorActual)
                        , new SqlParameter("@usuario", usuario)
                        , new SqlParameter("@objetoId", objetoId)
                    );
        }

        public void deleteDenuncia(DenunciaDto DenunciaDto)
        {
            using (NuevoDbContext context = new NuevoDbContext())
            {
                //load task from database
                DenunciaDto denunciaDto= context.getDenuncias(true)
                                              .Where(t => t.DenunciaId == DenunciaDto.DenunciaId)
                                              .FirstOrDefault();

                context.Remove(denunciaDto);
                context.SaveChanges();
            }
        }

        public void EliminarDenuncia(int id,int? motivoBajaId)
        {
            using (NuevoDbContext context = new NuevoDbContext())
            {
                //load task from database
                DenunciaDto denunciaDto = context.getDenuncias(true)
                                              .Where(t => t.DenunciaId == id)
                                              .FirstOrDefault();

                denunciaDto.DELETED = true;
                denunciaDto.MOTIVOBAJA_ID = motivoBajaId;
                context.SaveChanges();
                this.loguearModificaciones(context,DateTime.Now,"DENUNCIA","EXISTENTE","ELIMINADA","Se ha eliminado la Denuncia","",id);
            }
        }



        public DenunciaDto CreateDenuncia(DenunciaDto denuncia)
        {
            var usuario = HttpContext.Current.User.Identity.Name;
            
                using (NuevoDbContext context = new NuevoDbContext())
                {
                    context.Add(denuncia);
                    context.SaveChanges();
                    var accion = new CommonChangeLoggerDto(DateTime.Now, "DENUNCIA", "Se ha creado La Denuncia con id:  " + denuncia.DenunciaId.ToString(), null, "ACTIVA", usuario, denuncia.DenunciaId);
                    context.Add(accion);
                    context.SaveChanges();
                    return denuncia;
                }
            
        }

        public int formalizarDenuncia(DenunciaDto preventiva,string usuario) {
            DenunciaDto nuevaDenuncia = new DenunciaDto();
            copyData(nuevaDenuncia,preventiva);
            using (NuevoDbContext context = new NuevoDbContext()) {                
                nuevaDenuncia.CREATIONDATE = DateTime.Now;
                nuevaDenuncia.CREATIONPERSON = usuario ;
                nuevaDenuncia.TIPO_PRO_ID = context.TiposDeProceso.Where(x => x.Nombre.Trim() == "DENUNCIA").FirstOrDefault().Id;
               
                 if(nuevaDenuncia.TIPO_PRO_ID != null) {
                    nuevaDenuncia.SUBTIPO_PRO_ID = context.SubTiposDeProceso.Where(x => x.Tipo_Id == nuevaDenuncia.TIPO_PRO_ID).FirstOrDefault().Id;
                };
                var nombreMotivoReclamo = "";
                if (nuevaDenuncia.RECLAMO_ID.HasValue) {                    
                    var unReclamo = context.Reclamos.Where(x => x.Id == nuevaDenuncia.RECLAMO_ID.Value).FirstOrDefault();

                    if (unReclamo != null) {
                        var unMotivo = context.MotivosDeReclamo.Where(x => x.Id == unReclamo.Id_Motivo_Reclamo).FirstOrDefault();

                        if (unMotivo != null) {
                            nombreMotivoReclamo = unMotivo.Nombre;
                        }
                        
                    }
                    
                }
               
              
                nuevaDenuncia.FECHARESULTADO = null;
                nuevaDenuncia.PARENTDENUNCIAID = preventiva.DenunciaId;
                ReclamoDto nuevoReclamo = new ReclamoDto();

                if (context.MotivosDeReclamo.Any(x => x.Nombre.Trim() == nombreMotivoReclamo &&
                                                         x.servicioId == nuevaDenuncia.SERV_DEN_ID &&
                                                         x.tipoProcesoId == nuevaDenuncia.TIPO_PRO_ID)) {

                    var xReclamo = context.MotivosDeReclamo
                                          .Where(x => x.Nombre.Trim() == nombreMotivoReclamo &&
                                            x.servicioId == nuevaDenuncia.SERV_DEN_ID &&
                                            x.tipoProcesoId == nuevaDenuncia.TIPO_PRO_ID)
                                            .FirstOrDefault();

                    if (xReclamo != null) {
                        nuevoReclamo.Id_Motivo_Reclamo = xReclamo.Id;
                    }
                    
                    

                }
               
                context.Add(nuevoReclamo);
                context.SaveChanges();
                nuevaDenuncia.RECLAMO_ID = nuevoReclamo.Id;
                //nuevaDenuncia.RECLAMO_ID = context.MotivosDeReclamo
                //                                   .Where(x =>x.Nombre == nombreMotivoReclamo &&
                //                                          x.servicioId == nuevaDenuncia.SERV_DEN_ID &&
                //                                          x.tipoProcesoId == nuevaDenuncia.TIPO_PRO_ID)
                //                                           .FirstOrDefault()
                //                                           .Id;
                context.Add(nuevaDenuncia);
                context.SaveChanges();
                context.Database.ExecuteSqlCommand("update tDenuncias set PARENTDENUNCIAID = @parentId,INACTIVO = 1 where DenunciaId = @denunciaId",
                    new SqlParameter("@parentId", nuevaDenuncia.DenunciaId), new SqlParameter("@denunciaId",preventiva.DenunciaId));
                loguearModificaciones(context,DateTime.Now,"DENUNCIA","Denuncia Preventiva","Denuncia Inactiva","Se ha formalizado la Denuncia",usuario,preventiva.DenunciaId);
                loguearModificaciones(context, DateTime.Now, "DENUNCIA", "", "", "Se crea la Denuncia " + nuevaDenuncia.DenunciaId.ToString() + " a partir de la Denuncia Preventiva " + preventiva.DenunciaId.ToString(), usuario, nuevaDenuncia.DenunciaId);

            }
            return nuevaDenuncia.DenunciaId;
        }

       
    }
}