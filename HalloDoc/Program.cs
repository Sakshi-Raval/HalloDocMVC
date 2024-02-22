using BusinessLogic.IRepository;
using BusinessLogic.Repository;
using DataAccess.DataContext;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.(dependency injections)
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<ApplicationDbContext>();
builder.Services.AddScoped<IPatientRequest, PatientRequestRepo>();
builder.Services.AddScoped<IOtherRequest, OtherRequestRepo>();
builder.Services.AddScoped<IPatient, PatientRepo>();
builder.Services.AddScoped<IAdmin, AdminRepo>();
builder.Services.AddTransient<IEmailService, EmailServiceRepo>();
builder.Services.AddSession();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run(); 
