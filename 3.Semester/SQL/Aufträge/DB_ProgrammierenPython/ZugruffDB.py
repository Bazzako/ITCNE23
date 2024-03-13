import mysql.connector

# Verbindungsinformationen
config = {
    'user': 'root',  # Mit MySQL-Benutzernamen ersetzen
    'password': 'weinschlauchX10!',  # Passwort ersetzen
    'host': '127.0.0.1',         # IP-Adresse/Hostname des DB-Servers
    'port': '3309',
    'database': 'Challenges',  # Namen der Datenbank angeben
    'raise_on_warnings': True
}

Table_Name = "Kunden"
try:
    # Verbindung zur Datenbank herstellen mit obigen Vorgaben
    conn = mysql.connector.connect(**config)

    # Cursor erstellen
    cursor = conn.cursor()

    # SQL-Anfrage ausführen mittels Cursor
    cursor.execute(f"SELECT * FROM {Table_Name}")

    for row in cursor.fetchall():
        print(row)

except mysql.connector.Error as err:
    print(f"Fehler: {err}")

finally:
    # Verbindung schließen
    if conn.is_connected():
        cursor.close()
        conn.close()
        print("Verbindung zur Datenbank wurde geschlossen.")

