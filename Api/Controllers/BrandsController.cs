using System;
using System.Collections.Generic;
using System.Linq;
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
    [Route("api/[controller]")]
    [ApiController]
    public class BrandsController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public BrandsController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/Brands
        [HttpGet]
        public IActionResult Get([FromQuery] BrandSearch search,
            [FromServices] IReadBrandsQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Brands/5
        [HttpGet("{id}", Name = "GetBrand")]
        public IActionResult Get(int id,
            [FromServices] IReadBrandQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        // POST: api/Brands
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] BrandDto dto,
            [FromServices] ICreateBrandCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Brands/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] BrandDto dto,
            [FromServices] IUpdateBrandCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteBrandCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
