## SSH Key's

- Für die Beispiele wurde eine Azure VM aufgesetzt, auf welche Ubuntu betrieben wird. Der Public Key von der Maschine wurde lokal heruntergeladen
- Damit von der Multipass Maschine auf die Azure Maschine verbunden werden konnte, musste der hinterlegte SSH Key in das *authorized_keys* hinterlegt werden
```ubuntu
cd .ssh/
vim authorized_keys
```
- Den Public Key kann man wie folgt aus der Multipass Maschine extrahieren, falls noch keiner existiert, muss einer erstellt werden
```Ubuntu
ssh-keygen
cd .ssh/
cat cat id_rsa.pub
```
- Jetzt kann man per ssh auf die Azure Maschine zugreifen (von der Multipass maschine)
```Ubunut
ssh azureuser@51.107.202.247
```

## Syntax
mit "cat" können fileinhalte direkt angezeigt werden
mit "vim" können files für das bearbeiten geöffnet werden
mit "i" -> für Insert kann das File bearbeitet werden
mit "escape" kann der bearbeitungsmodus verlassen werden
mit ":wq" wird die änderung gespeichert und das File geschlossen
mit "ls" kann die Ordnerstruktur angezeigt werden