var builder = WebApplication.CreateBuilder(args);

// Optional: read configuration, logging, etc.

var app = builder.Build();

app.MapGet("/", () => "¡Hola Mundo desde DevOps CI/CD con GitHub Actions y .NET 9!");

app.Run();

// Necesario para WebApplicationFactory en pruebas
public partial class Program { }
