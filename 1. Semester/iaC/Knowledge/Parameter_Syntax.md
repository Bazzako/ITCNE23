## Allgemeines

### Bash

#### Editor: Nano

Um ein Bashskript oder ein Yamlfile erstellen zu können, muss man in der Commandozeile "nano <filename und endung>" eingeben z.B: nano inventory.yaml

#### Berechtigung anpassen

erstellte verzeichnisse oder files könenn nich von anfang an benutzt werden. teilweise muss die Berechtigung angepasst werden. mit "Chmod <File> berechtiungscode" werden berechtigungen angepasst z.B: chmod 0600 pornkey

#### Cat

Anzeigen eines Inhalts eines Files z.B: 
>Cat inventory.yaml

```virtualmachines:
  hosts:
    managenode1:
      ansible_host: 3.73.130.68
      ansible_user: ubuntu
    managenode2:
      ansible_host: 18.159.214.219
      ansible_user: ubuntu
    managenode3:
      ansible_host: 3.123.35.71
      ansible_user: ubuntu
    managenode4:
      ansible_host: 3.71.181.225
      ansible_user: ubuntu
```

#### ll

Auflisten der Berechtigunen für Files

>ll

```
total 56
drwxr-x--- 7 ubuntu ubuntu 4096 Jun  7 10:01 ./
drwxr-xr-x 3 root   root   4096 May 22 19:09 ../
drwxrwxr-x 4 ubuntu ubuntu 4096 Jun  7 09:37 .ansible/
-rw------- 1 ubuntu ubuntu   36 May 22 19:17 .bash_history
-rw-r--r-- 1 ubuntu ubuntu  220 Jan  6  2022 .bash_logout
-rw-r--r-- 1 ubuntu ubuntu 3771 Jan  6  2022 .bashrc
drwx------ 2 ubuntu ubuntu 4096 May 22 19:09 .cache/
drwxrwxr-x 3 ubuntu ubuntu 4096 Jun  7 09:18 .local/
-rw-r--r-- 1 ubuntu ubuntu  807 Jan  6  2022 .profile
drwx------ 2 ubuntu ubuntu 4096 Jun  7 09:36 .ssh/
drwxr-xr-x 3 root   root   4096 May 22 19:10 iac_ansible/
-rw-rw-r-- 1 ubuntu ubuntu  334 Jun  7 09:20 inventory.yaml
-rw-rw-r-- 1 ubuntu ubuntu  138 Jun  7 10:01 playbook.yaml
-rw------- 1 ubuntu ubuntu  525 Jun  7 09:33 pornkey
```

## Syntax

### Ansible

#### Ansible --help

Es werden alle Befehele angezeigt und erklärt

#### -i

wird für das einlesen eines inventory files gebraucht

#### -b

Ausführen des Ansiblebefehls als Sudo