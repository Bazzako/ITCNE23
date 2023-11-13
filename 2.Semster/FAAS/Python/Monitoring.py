class Instanzchecker:
    def __init__(self, instanzid, notifier, schwellwert):
    self.instanz = instanzid
    self.notifier = notifier
    self.schwellwert = schwellwert
    self.value = dict()

    def getrealvalue(self):
        # Holt normalerweise AWS Informationen, testhalber wird der Wert hier aber festgelegt
        for indicator in self.schwellwert.keys():
            self.value[indicator] = 66

    def check(self):
        # Überprüft den Schwellwert der AWS Information
        self.getrealvalue()

        for indicator in self.schwellwert.keys():
            if self.schwellwert[0] < self.value[indicator] < self.schwellwert[1]
                return False
            else:
                return True

    def notify(self):
        self.notifier.send()

    def check_and_notify(self):
        do_notify = self.check()
        if do_notify
            self.notify()


class Notifier:

    def notify(self, subject, message):
        print('Subject ist %s' % subject)
        print('Message ist %s' % message)


class Smsnotifier(Notifier):
    pass

class Emailnotifier(Notifier):
    pass

class Multinotifier(Notifier):
    pass



#Main Code kommt hier
smsNotifier_armin = SmsNotifier('0764908190')
emailNotifier_roger = EmailNotifier('roger.mueller@edu.tbz.ch')

instanzes = [
    InstanzChecker(
        instanzid='i-1235134123',
        notifier=smsNotifier_armin,
        schwellwerte={'cpu': [0, 60], 'memory': [0, 90]}),
    InstanzChecker(
        instanzid='i-1235134542',
        notifier=emailNotifier_roger,
        schwellwerte={'cpu': [0, 50], 'memory': [0, 95]}
    ),
    InstanzChecker(
        instanzid='i-3435134123',
        notifier=MultiNotifier(
            [smsNotifier_armin, emailNotifier_roger]),
        schwellwerte={'cpu': [0, 100], 'memory': [10, 60]})
]

for instanz in instanzes:
    instanz.check_and_notify()
