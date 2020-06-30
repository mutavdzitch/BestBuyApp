using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserUseCasesController : ControllerBase
    {
        private readonly UseCaseExecutor executor;
        private readonly IApplicationActor actor;

        public UserUseCasesController(UseCaseExecutor executor, IApplicationActor actor)
        {
            this.executor = executor;
            this.actor = actor;
        }

        // GET: api/UserUseCases
        [HttpGet]
        public IActionResult Get([FromQuery] UserUseCaseSearch search,
            [FromServices] IReadUserUseCasesQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // POST: api/UserUseCases
        [HttpPost]
        public IActionResult Post([FromBody] UserUseCaseDto dto,
            [FromServices] ICreateUserUseCaseCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/UserUseCases/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserUseCaseDto dto,
            [FromServices] IUpdateUserUseCaseCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteUserUseCaseCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
