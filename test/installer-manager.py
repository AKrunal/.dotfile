packages = []
with open('/home/kishan/.zsh_history',errors='ignore') as f:
    a = f.readlines()
    for x in a:
        if "sudo apt install" in x:
            i = x.split(";")[-1]
            j = i.split("sudo apt install ")[-1]
            if j == ' ':
                continue
            packages.append(j.strip())

print(packages)

