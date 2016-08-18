Simple docker based environment for WordPress plugins and themes development.

## Requirements

- docker (native, no boot2docker)
- docker-compose

## Launch the environment

**Be sure you have nothing running on port 80, and also that you are using the native version of Docker.**

```
$ ./restart.sh
```

You should now be able to access the WordPress instance on `http://localhost` and the admin panel on `http://localhost/wp-admin/`.

**If you get a lot of errors like the following, simply restart docker:**
```
Warning: copy(/var/www/html//wp-content/themes/twentyfourteen/category.php): failed to open stream: No such file or directory in phar:///bin/wp/php/commands/core.php on line 220
```

## Launch environment without loosing database state

If at some point you containers stopped and you don't want to loose your database state, simply run:
```bash
$ docker-composer up
```

## Connect to the WordPress admin UI

Go to [http://localhost/wp-admin/](http://localhost/wp-admin/)

Admin user credentials:
- login: admin
- password: admin


In the admin panel, you can now go to `plugins` and enable the `Algolia Search` plugin.

## Debugging

The whole WordPress dir is mounted as a volume so that you can edit anything on the fly in `./wordpress`.

## Developing WordPress plugins and themes

Simply drop your plugins in the `wordpress/wp-content/plugins` directory or your themes in the `wordpress/wp-content/themes` directory.

As an alternative you could also directly upload zip archives via the admin UI.

You should now be able to enable the themes and plugins from the WordPress backoffice.

**No need to `restart` the docker container as the whole WordPress directory is mounted as a volume. You can modify any file on the fly.**

**Also note that when you restart your container, plugin and theme files are kept, only core files and database will be reset.**
