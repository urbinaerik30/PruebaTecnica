using BscAppTest.Components;
using BscAppTest.Server.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace BscAppTest
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddRazorComponents()
                .AddInteractiveServerComponents();

            builder.Services.AddDbContext<ApplicationDbContext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
            });

            builder.Services.AddSingleton<IConfiguration>(builder.Configuration);

            builder.Services.AddScoped<DataAccessService>();

            var app = builder.Build();

            using (var scope = app.Services.CreateScope())
            {
                var dataAccessService = scope.ServiceProvider.GetRequiredService<DataAccessService>();
                var isConnectionSuccessful = dataAccessService.TestConnection().GetAwaiter().GetResult();

                if (isConnectionSuccessful)
                {
                    Console.WriteLine("Conexión a la base de datos exitosa.");
                }
                else
                {
                    Console.WriteLine("Error al conectar con la base de datos.");
                }
            }

            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseAntiforgery();

            app.MapRazorComponents<App>()
                .AddInteractiveServerRenderMode();

            app.Run();
        }
    }
}
