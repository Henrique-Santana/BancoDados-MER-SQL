using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using senai.filmes.webapi.Properties.Domains;
using senai.filmes.webapi.Properties.Interfaces;

namespace senai.filmes.webapi.Properties.Controllers
{
    [Produces("application/jason")]
    [Route("api/[controller]")]
    ///api/genero
    [ApiController]
    public class GenerosController : ControllerBase
    {
        private IGeneroRepository  _generoRepository { get; set; }

        public GenerosController()
        {
            _generoRepository = new GenerosRepository();
        }

        [HttpGet]
        public IEnumerable<GeneroDomain> Get()
        {
            return _generoRepository.Listar();
        }
    }
}