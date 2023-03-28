## Azure storage explorer
### Aufgabenstellung
Anforderung

*Erstelle ein storage account in einer eigenen resourcegroup*.
- least privilege Ansatz

*Folgende settings muss dein storage account mind. enthalten*:

|Region|Performance|Redundancy|
|------|-----------|----------|
|Switzerland North|Standard|LRS|

*Erstelle zwei blob-container*

container1: Enthält nur Bilder
container2: Enthält nur Textfiles

*Damit der Zugriff auf dein Storage Account geschützt ist, erstelle zuerst ein Account SAS (Shared Access Signature)*

Services: Blob
Zugriff ist nur für einen Tag gültig
Signing key: Verwende für die Generierung key2
Konfiguriere die richtigen resource types!

### Connection zum Storage Account erstellen
Um eine Verbindung mit einem Storage Account herstellen zu können, gibt es verschiedene Wege. In diese Szenario wird der Storage Account mit einer SAS Token URL Verbunden.

1. SAS Token generieren
    Im Azure Portal wird unter "Shared access signature" für den Storage Account ein SAS Token URL erstellt.
    Wichtig! *Allowed resource types* muss *Service* eingestellt sein.
    ![Ressource](../../ressources/pictures/storage_account/Allowed_ressource.png)
    Für die Verbindung im Azure storage explorer muss der *Blob service SAS URL* kopiert werden.

2. Connection zwischen Azure Storage Explorer und dem Storage Account erstellen
    Damit mit Azure storage explorer gearbeitet werden kann, muss es auf den Client installiert werden.
    Im Azure storage exporer kann man nun eine Ressource auswählen.
    ![Ressource](../../ressources/pictures/storage_account/Ressource_ausw%C3%A4hlen.png)
    Verbindungsmethode wird *SAS-URL* verwendet.
    ![Ressource](../../ressources/pictures/storage_account/Verbindungsmethode.png)
    Im letzten Schritt wird der Kopierte *Blob service SAS URL* unter *Dienst-URL:* eingefügt und mit weiter bestätigt
    Nun kann man auf seine Blob Containers die gwünschten Dateien Hochladen

### Azure CLI oder Powershell


https://adamtheautomator.com/azure-sas-token/
SAS Token : ?sv=2021-10-04&ss=b&srt=s&se=2023-03-28T18%3A35%3A04Z&sp=rwdlacup&sig=%2BB477C%2FMhvzQtlrB8JIM5YPaSUiOb6fvMiIOrTN2Gjw%3D

Powershell Befehle:
connect-azuread

New-AzStorageAccountSASToken -Context $context -Service Blob -ResourceType Service -Permission racwdlup -ExpiryTime (Get-Date).AddDays(1)

azcopy copy "C:\local\path" "https://dennistestblobstorage.blob.core.windows.net/bildertest/?sv=2021-10-04&ss=b&srt=s&se=2023-03-28T18%3A35%3A04Z&sp=rwdlacup&sig=%2BB477C%2FMhvzQtlrB8JIM5YPaSUiOb6fvMiIOrTN2Gjw%3D" --recursive=true
