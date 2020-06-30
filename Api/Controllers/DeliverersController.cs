using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using Implementation.Validators;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DeliverersController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public DeliverersController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }
        // GET: api/Deliverers
        [HttpGet]
        public IActionResult Get([FromQuery] DelivererSearch search,
            [FromServices] IReadDeliverersQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Deliverers/5
        [Authorize]
        [HttpGet("{id}", Name = "GetDeliverer")]
        public IActionResult Get(int id,
            [FromServices] IReadDelivererQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        // POST: api/Deliverers
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] DelivererDto dto,
            [FromServices] ICreateDelivererCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Deliverers/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id,[FromBody] DelivererDto dto,
            [FromServices] IUpdateDelivererCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteDelivererCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
