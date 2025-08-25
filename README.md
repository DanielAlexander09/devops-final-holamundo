# DevOps Final: Hola Mundo (.NET 9, Docker, GitHub Actions, Render)

Proyecto base para la práctica final de DevOps con CI/CD:
- App web **.NET 9** (Minimal API)
- **Pruebas unitarias** con **xUnit**
- **Dockerfile** multi-stage
- **GitHub Actions**: build → test → push a Docker Hub → deploy a Render

## Estructura
```
devops-final-holamundo/
│── .github/workflows/ci-cd.yml
│── HolaMundoApp/
│   ├── Program.cs
│   ├── HolaMundoApp.csproj
│   └── appsettings.json
│── HolaMundoApp.Tests/
│   ├── UnitTest1.cs
│   └── HolaMundoApp.Tests.csproj
│── Dockerfile
│── .gitignore
│── README.md
```

## Requisitos locales
- .NET 9 SDK
- Docker

```bash
dotnet test
docker build -t tu_usuario/holamundoapp:latest .
docker run -d -p 8080:8080 tu_usuario/holamundoapp:latest
```

## Secrets en GitHub
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `RENDER_API_KEY`
- `RENDER_SERVICE_ID`

## Render
Crea un Web Service con Docker, apunta a tu repo y usa el workflow para disparar el deploy.