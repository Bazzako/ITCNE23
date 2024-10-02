FROM mcr.microsoft.com/windows/servercore:ltsc2022-amd64

WORKDIR /azp/

COPY ./start.ps1 ./

CMD powershell .\start.ps1