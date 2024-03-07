using DataAccess.DataContext;
using DataAccess.ViewModel;
using DataAccess.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Net.Http.Headers;
using DataAccess.DataModels;
using BusinessLogic.IRepository;
using System.Web.Helpers;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Security.Claims;
using IAuthorizationFilter = Microsoft.AspNetCore.Mvc.Filters.IAuthorizationFilter;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Routing;
using System.IdentityModel.Tokens.Jwt;

namespace BusinessLogic.Repository
{
    [AttributeUsage(AttributeTargets.All)]
    public class CustomAuthorize : Attribute, IAuthorizationFilter
    {
        private readonly string _role;
        private readonly ApplicationDbContext _context;
        public CustomAuthorize(string role = "")
        {
            this._role = role;

        }
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            //var email = context.HttpContext.Session.GetString("Email");
            //var role = context.HttpContext.Session.GetString("Role");

            //if (email == null)
            //{
            //    context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", Action = "Login" }));
            //    return;
            //}
            //if (!string.IsNullOrEmpty(_role))
            //{
            //    if (!(role == _role))
            //    {
            //        context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Home", Action = "AccessDenied" }));
            //    }
            //}
            var jwtService = context.HttpContext.RequestServices.GetService<IJwtService>();
            
            if(jwtService == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", Action = "Login" }));
                return;
            }

            var request = context.HttpContext.Request;
            var token = request.Cookies["jwt"];

            if(token== null || !jwtService.ValidateToken(token , out JwtSecurityToken jwtToken)) {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", Action = "Login" }));
                return;
            }

            var roleClaim = jwtToken.Claims.FirstOrDefault(claim=>claim.Type == ClaimTypes.Role);

            if(roleClaim == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", Action = "Login" }));
                return;
            }

            if(string.IsNullOrWhiteSpace(_role) || roleClaim.Value != _role)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Home", Action = "AccessDenied" }));
                return;
            }
        }
    }

}
