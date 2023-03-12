# Ansible Test

Per prima cosa installare ansible. Per farlo eseguire il comando:
```
sudo pacman -Sy ansible
```

Fare il clone dei propri ruoli nella cartella `roles` e aggiungere il nome dei ruoli in `local.conf`
 
Per installare la configurazione eseguire il comando:
```
sudo ansible-playbook local.yml
```

