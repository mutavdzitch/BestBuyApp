using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Commands;
using Application.DataTransfer;
using Application.Exceptions;
using Application.Searches;
using Implementation.Validators;
using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using Application.Queries;
using Application;
using Microsoft.AspNetCore.Authorization;

namespace Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class CitiesController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public CitiesController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Cities
        [HttpGet]
        public IActionResult Get([FromQuery] CitySearch search,
            [FromServices] IReadCitiesQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Cities/5
        [Authorize]
        [HttpGet("{id}", Name = "GetCity")]
        public IActionResult Get(int id,
            [FromServices] IReadCityQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        //INSERT
        // POST: api/Cities
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CityDto dto,
            [FromServices] ICreateCityCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // PUT: api/Cities/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody]CityDto dto,
            [FromServices] IUpdateCityCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,[FromServices] IDeleteCityCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
