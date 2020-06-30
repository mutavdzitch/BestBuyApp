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
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;

        public CategoriesController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Categories
        [HttpGet]
        public IActionResult Get([FromQuery] CategorySearch search,
            [FromServices] IReadCategoriesQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Categories/5
        [HttpGet("{id}", Name = "GetCategory")]
        public IActionResult Get(int id,
            [FromServices] IReadCategoryQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        // POST: api/Categories
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CategoryDto dto,
            [FromServices] ICreateCategoryCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Categories/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CategoryDto dto,
            [FromServices] IUpdateCategoryCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteCategoryCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
