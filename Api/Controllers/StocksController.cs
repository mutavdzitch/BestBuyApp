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
    public class StocksController : ControllerBase
    {
        private readonly UseCaseExecutor executor;
        private readonly IApplicationActor actor;

        public StocksController(UseCaseExecutor executor, IApplicationActor actor)
        {
            this.executor = executor;
            this.actor = actor;
        }

        // GET: api/Stocks
        [HttpGet]
        public IActionResult Get([FromQuery] StockSearch search,
            [FromServices] IReadStocksQuery query)
        {
            var objects = executor.ExecuteQuery(query, search);
            return Ok(objects);
        }

        // GET: api/Stocks/5
        [HttpGet("{id}", Name = "GetStock")]
        public IActionResult Get(int id, 
            [FromServices] IReadStockQuery query)
        {
            var dto = executor.ExecuteQuery(query, id);
            return Ok(dto);
        }

        // POST: api/Stocks
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] StockDto dto,
            [FromServices] ICreateStockCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Stocks/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] StockDto dto,
            [FromServices] IUpdateStockCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeleteStockCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
