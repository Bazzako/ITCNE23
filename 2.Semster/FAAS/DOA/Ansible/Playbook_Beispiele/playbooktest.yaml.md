
```yaml
- name: Ping-Test gegen virtuelle Maschine
  hosts: all
  gather_facts: no  # Deaktiviert das Sammeln von Fakten, da wir nur einen Ping-Test durchführen

  tasks:
    - name: Führe einen Ping-Test durch
      ping:
```