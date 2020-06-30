using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.DataTransfer;
using Application.Queries;
using Application.Searches;
using EfDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoresController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public StoresController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Stores
        [HttpGet]
        public IActionResult Get([FromQuery] StoreSearch search,
            [FromServices] IReadStoresQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Stores/5
        [HttpGet("{id}", Name = "GetStore")]
        public IActionResult Get(int id,
            [FromServices] IReadStoreQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        // POST: api/Stores
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] StoreDto dto,
            [FromServices] ICreateStoreCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Stores/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] StoreDto dto,
            [FromServices] IUpdateStoreCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, 
            [FromServices] IDeleteStoreCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
