# ---------- Etapa de Build ----------
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copiar solo el csproj para aprovechar cache
COPY HolaMundoApp/*.csproj HolaMundoApp/
RUN dotnet restore HolaMundoApp/*.csproj

# Copiar todo el proyecto y publicar
COPY . .
RUN dotnet publish HolaMundoApp -c Release -o /app /p:UseAppHost=false

# ---------- Etapa de Runtime ----------
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app .

# Variables de entorno para contenedor
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV ASPNETCORE_URLS=http://+:8080

EXPOSE 8080
ENTRYPOINT ["dotnet", "HolaMundoApp.dll"]
