for linux user, if found error like this :

```sh
/usr/local/lib/node_modules/bower/lib/node_modules/configstore/index.js:54
throw err;
^

Error: EACCES: permission denied, open '/Users/[username]/.config/configstore/bower-github.json'
You don't have access to this file.
```

try to fix with this command :

```sh
sudo chown -R $USER:$GROUP ~/.npm
sudo chown -R $USER:$GROUP ~/.config
```
