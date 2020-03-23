Configure `dconf` to sync the plain text `user.txt` with the binary database by
replacing the `user-db:user` line in `/etc/dconf/profile` with this:

```
service-db:keyfile/user
```

Reference:
https://unix.stackexchange.com/questions/426322/how-do-i-use-the-plain-text-mode-of-dconf
