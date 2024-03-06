import etcd3

# Verbindung zum etcd-Server herstellen
etcd = etcd3.client(host='ec2-54-226-108-39.compute-1.amazonaws.com', prt=2379)

# Beispiel: Wert setzen
etcd.put('/path/to/key', 'value')

# Beispiel: Wert abrufen
result = etcd.get('/path/to/key')
print(result)