# SDK importieren
import boto3
# EC2-Client initialisieren
client = boto3.client('ec2', region_name='us-east-1', aws_access_key_id="ASIAW3KIUXBAH6ELCZYV", aws_secret_access_key="XQPp7Y5TuEd31hYtRkbhyDCx5RQmUkCa8I/7c6tM", aws_session_token="FwoGZXIvYXdzEDEaDJ3ffquiMaa7xSb3NiLAATkf42lcoOVT9U0VaXiOvKvKYTALrhnMbuYNPYBeo0iWYtQ67EZWIhrXWVLNpFHlt0O++fXpF8dED4lw5NIepWpoSd4UGOthEdgu/1kRSc8VuZXF8ikhTmyjDhY32PboyzQchFxHXaE71cRn9A4lAls1txZVQfio0OQmXPecPU31HIPiA5YeNT7qdG9lpu2M5lA+zJBkgKXSakZYn7rhOGHci3S+JQHZfdEJICcLGitNukP6g/K3owiW/KpwOvf0bSju5LaoBjItMw1T+DjLSfx/OQVuIOtJY947oujdzH4Brjay+1D+VHLWV3UX+xx8wUM83ACD")
# Subnetze abfragen
response = client.describe_subnets()
# Die Antwort ausgeben
print(response)
