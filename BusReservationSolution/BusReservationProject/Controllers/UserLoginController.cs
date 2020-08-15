using BusReservationProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace BusReservationProject.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class UserLoginController : ApiController
    {
        private BusReservationEntities db = new BusReservationEntities();
        // GET: api/Users
        public List<proc_UserLogin_Result> GettblUsers()
        {
            db.proc_UserLogin();
            List<proc_UserLogin_Result> login = new List<proc_UserLogin_Result>();
            foreach (var item in db.proc_UserLogin())
            {
                login.Add(item);
            }
            return login;
        }
        // GET: api/Users/5
        [HttpPost]
        public IHttpActionResult PosttblUser(proc_UserLogin_Result user)
        {
            string a = null;
            List<proc_UserLogin_Result> login = new List<proc_UserLogin_Result>();
            foreach (var item in db.proc_UserLogin())
            {
                login.Add(item);
            }
            foreach (var item in login)
            {
                if (item.Email == user.Email && item.Password == user.Password)
                {
                    FormsAuthentication.SetAuthCookie(item.Email, false);
                    a = "Logged in";
                }
            }

            //tblUser tblUser = db.tblUsers.Find(id);
            if (a == null)
            {
                return NotFound();
            }

            return Ok(a);
        }
    }
}
