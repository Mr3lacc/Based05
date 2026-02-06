# SmartShell Application

class SmartShell:
    def __init__(self):
        self.history = []

    def execute_command(self, command):
        # Logic to execute shell command goes here
        self.history.append(command)
        return f"Executing: {command}"

    def get_history(self):
        return self.history

if __name__ == '__main__':
    shell = SmartShell()
    print(shell.execute_command('echo Hello World'))
    print(shell.get_history())