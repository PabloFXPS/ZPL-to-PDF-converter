FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY *.sln ./
COPY ZPL-to-PDF-converter/ZPL-to-PDF-converter.csproj ./ZPL-to-PDF-converter/
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app/out


FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app
RUN apk add --no-cache libgdiplus
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "ZPL-to-PDF-converter.dll"]