using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Cors.Internal;
using CommentsAPI.Models;

namespace CommentsAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            //Use SQL Server
			var connection = @"Data Source=USCITRDVDDD07\SQLEXPRESS;Initial Catalog=Prudb;Integrated Security=True;";
		    services.AddDbContext<CommentContext>(opt => opt.UseSqlServer(connection));

			//User In-memory database
			//services.AddDbContext<CommentContext>(opt => opt.UseInMemoryDatabase("Prudb"));

            //The below line will allow the API to be accessed from another machine on LAN.
            services.Configure<MvcOptions>(options =>
			{
				options.Filters.Add(new CorsAuthorizationFilterFactory("AllowSpecificOrigin"));
			});

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            //app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
