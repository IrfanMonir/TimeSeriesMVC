using Application.Readings;
using Application.Readings.Query;

using MediatR;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

using System;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly IMediator _mediator;
        private readonly IDropDownService _dropDown;
        public HomeController(IMediator mediator, IDropDownService dropDown)
        {
            _mediator = mediator;
            _dropDown = dropDown;
        }


        public async Task<IActionResult> Index()
        {
            var result = await _mediator.Send(new ReadingList());

            var model = await _dropDown.GetDropDown();
            ViewBag.Buildings = new SelectList(model.Buildings, "Id", "Name");
            ViewBag.Objects = new SelectList(model.Objects, "Id", "Name");
            ViewBag.DataFields = new SelectList(model.DataFields, "Id", "Name");

            return View(result);
        }

        public async Task<IActionResult> GetData()
        {
            var result = await _mediator.Send(new ReadingList());
            //result = result.Where(i => i.ObjectId == 2).ToList();

            var query = result.Select(g => new { name = g.TimeStamp, count = g.Value }).ToList();
            // for ( )
            return Json(query);
        }

        [HttpPost]
        public async Task<IActionResult> GetDatawithid(int BuildingId, int ObjectId,
            int DatafeildId, DateTime StartTime, DateTime EndTime)
        {
            var result = await _mediator.Send(new ReadingList(BuildingId, ObjectId,
                DatafeildId, StartTime, EndTime));
            //result = result.Where(i => i.ObjectId == 2).ToList();

            var query = result.Select(g => new { name = g.TimeStamp, count = g.Value }).ToList();
            // for ( )
            return Json(query);
        }


    }
}
