# Cloud Init

Cloud Init ist eine Software um eine reihe von Python skripte während der Aufsetzung einer Virtuellen-Maschine laufen zu lassen. Somit werden Virtuelle-Maschinen automatisiert bereitgestellt

## 5 Stages

### 1. Generator
Der cloud-init-Generator systemd wird gestartet. Dieser ermittelt dann, ob cloud-init in die Startziele einbezogen werden soll, und ist dies der Fall, aktiviert er cloud-init.
### 2. Local
Hier sucht cloud-init nach der lokalen Datenquelle „Azure“. Dadurch wird es cloud-init ermöglicht, eine Verbindung mit Azure herzustellen und eine Netzwerkkonfiguration, einschließlich Fallback, anzuwenden.
### 3. Network
Das Netzwerk muss funktionsbereit sein, und die NIC- und Routingtabelleninformationen müssen generiert werden. In dieser Phase werden die Module ausgeführt, die in „/etc/cloud/cloud.cfg“ in cloud_init_modules aufgeführt sind. Die VM wird in Azure eingebunden, der kurzlebige Datenträger wird formatiert, der Hostname wird festgelegt, und es werden weitere Aufgaben ausgeführt.
### 4. Config
In dieser Phase werden die Module in cloud_config_modules ausgeführt, die in „/etc/cloud/cloud.cfg“ definiert und aufgeführt sind.
### 5. Final
In dieser abschließenden Phase werden die Module ausgeführt, die in „/etc/cloud/cloud.cfg“ in cloud_final_modules aufgeführt sind. Hier werden Module ausgeführt, die spät im Startprozess ausgeführt werden müssen, z. B. Paketinstallationen, werden Skripts ausgeführt usw.

## Auslesen des Logfiles

Muss auf der Shell der Virtuellen-Maschine ausgeführt werden
- less /var/log/cloud-init.log
mit "/" nach schlagwörte suchen
mit "n" next
mit "p" previous
mit "q" quit

## Auslesen der angewendeten Konfigurationen auf der virtuellen Maschine

-  lsbk
Um die Blockdevices anzusehen.
Cloudprovider mounten mit einem Blockdevice z.B: ROM ein ISOFile unter die virtuelle Maschine
[LSBK](lsbk.png)
- mkdir /tmp/Test1
Eine Ordner anlegen
- sudo mount /dev/sr0 /tmp/test1
Mounten des ISO's auf den Ordner
- ls -lh /tmp/Test1
Listen vom Ordner
- less user-data
Auflisten der angewendete user-data Konfiguration
[userdata](user-data.png)


## Example Files
https://cloudinit.readthedocs.io/en/latest/reference/examples.html

## Quellen
https://learn.microsoft.com/de-de/azure/virtual-machines/linux/cloud-init-deep-dive