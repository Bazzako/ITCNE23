import mysql.connector

# Verbindung zur Datenbank herstellen
conn = mysql.connector.connect(
    host="127.0.0.1",
    port=3309,
    user="root",
    password="weinschlauchX10!",
    database="mitarbeiter"
)
cursor = conn.cursor()

# SQL-Befehl für das Update
sql_update = """
    UPDATE mitarbeiter
    SET name = 'Peter'
    WHERE mitarbeiter_id = 1
"""

try:
    # Update ausführen
    cursor.execute(sql_update)

    # Änderungen in der Datenbank speichern
    conn.commit()
    print("Update erfolgreich durchgeführt.")
except Exception as e:
    # Fehlerbehandlung, wenn das Update fehlschlägt
    print("Fehler beim Update:", e)
finally:
    # Verbindung schließen
    conn.close()