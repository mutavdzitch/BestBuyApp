using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using Domain;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public OrdersController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Orders
        [HttpGet]
        public IActionResult Get([FromQuery] OrderSearch search,
            [FromServices] IReadOrdersQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET: api/Orders/5
        [HttpGet("{id}", Name = "GetOrder")]
        public IActionResult Get(int id,
            [FromServices] IReadOrderQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST: api/Orders
        [HttpPost]
        public IActionResult Post([FromBody] OrderDto dto,
            [FromServices] ICreateOrderCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Orders/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] OrderDto dto,
            [FromServices] IUpdateOrderCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteOrderCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }

        //Change Status
        [HttpPatch ("changestatus")]
        public IActionResult ChangeStatus([FromBody] ChangeOrderStatusDto dto,
            [FromServices] IChangeOrderStatusCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }
    }
}
