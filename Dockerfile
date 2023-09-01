FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="demo"
COPY nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll"]
