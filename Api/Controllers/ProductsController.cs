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
    public class ProductsController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;

        public ProductsController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Products
        [HttpGet]
        public IActionResult Get([FromQuery] ProductSearch search,
            [FromServices] IReadProductsQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Products/5
        [HttpGet("{id}", Name = "GetProduct")]
        public IActionResult Get(int id,
            [FromServices] IReadProductQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        // POST: api/Products
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromForm] ProductDto dto,
            [FromServices] ICreateProductCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Products/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] ProductDto dto,
            [FromServices] IUpdateProductCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteProductCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
