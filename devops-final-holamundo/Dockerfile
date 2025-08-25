# ---------- Build Stage ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Restore con archivos mínimos para cache óptimo
COPY HolaMundoApp/HolaMundoApp.csproj HolaMundoApp/
RUN dotnet restore HolaMundoApp/HolaMundoApp.csproj

# Copiar todo y publicar
COPY . .
WORKDIR /src/HolaMundoApp
RUN dotnet publish -c Release -o /app /p:UseAppHost=false

# ---------- Runtime Stage ----------
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# ASP.NET 9 por defecto usa puertos dinámicos; exponemos 8080
EXPOSE 8080
# Kestrel en puerto 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "HolaMundoApp.dll"]
