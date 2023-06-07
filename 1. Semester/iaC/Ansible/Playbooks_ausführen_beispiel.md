Damit Ansible funktioniert, muss auf Windows mit z.B. Multipass eine virtuelle maschine erstellt und diese dann per Powershell angesteuert werden
Es wird ein Privatekey von Armin verwendet, welcher benötigt wird um per ssh direkt auf die virtuellen server zugreiffen zu können. Der SSH key wurde geöffnet und der inhalt per "nano" in das file "pornkey" kopiert


ansible-playbook --private-key pornkey  -i inventory.yaml playbook.yaml -b