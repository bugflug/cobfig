```
                |\__/,|   (`\ 
              _.|o o  |_   ) )
    cobfig   -(((---(((--------
```

This is my personal TF2 configuration. While I've written it to be easily shareable, it is very opinionated. It's not flexible enough for it to be good for everyone, so if you want something more customizeable try [cfg.tf](https://cfg.tf) or [mastercomfig](https://mastercomfig.com/).

---

### `pl_installing`

1. Backup your existing `cfg` and `custom` folders if you have them.
2. Download the latest `.vpk` from the [releases](https://github.com/hirbird/cobfig/releases) tab. This should go in your TF2 install as `Team Fortress 2/tf/custom/cobfig.vpk`.
3. Download the `cfg` [folder template](https://downgit.github.io/#/home?url=https://github.com/hirbird/cobfig/tree/master/cfg), get the layout from the release source code, or make the files yourself. Your `Team Fortress 2/tf/cfg` folder should look like the [defaults](https://github.com/hirbird/cobfig/tree/master/cfg) in this repo's source code.
4. If you have an existing `autoexec.cfg`, split and move its contents to `settings.cfg`, `controls.cfg`, or `user.cfg` depending on what's most appropriate. The table below shows what all of the files are for.

| File name | Equivalent(s) in vanilla | Description |
| --------- | ------------------------ | ----------- |
| `user.cfg`  | `autoexec.cfg` | Any custom commands, binds, etc. that you didn't want to put in `settings.cfg` or `controls.cfg`. This file overrides the *entirety* of cobfig. |
| `settings.cfg` | | cobfig specific settings go here. Descriptions and defaults can be found [here](https://github.com/hirbird/cobfig/blob/master/cfg/settings.cfg).
| `controls.cfg` | | Any controls and binds should go here. cobfig comes with a lot of custom control aliases. Descriptions and defaults can be found [here](https://github.com/hirbird/cobfig/blob/master/cfg/controls.cfg).
| `settings_demoman.cfg`, `settings_engineer.cfg`, `settings_heavyweapons.cfg`, `settings_medic.cfg`, `settings_pyro.cfg`, `settings_scout.cfg`, `settings_sniper.cfg`, `settings_soldier.cfg`, `settings_spy.cfg` | `demoman.cfg`, `engineer.cfg`, `heavyweapons.cfg`, `medic.cfg`, `pyro.cfg`, `scout.cfg`, `sniper.cfg`, `soldier.cfg`, `spy.cfg` | Any class specific settings, controls, or commands should be put in their respective file. If you have existing class configs, you can rename them to their cobfig equivalent.

If you've installed correctly, you should see the cobfig cat from the top of this page in your console. If things aren't working, set `debug=true` in your `settings.cfg` to show more information in the console to help.

### `pl_updating`

1. Backup your existing `cfg` and `custom` folders if you have them.
2. Download the latest `.vpk` from the [releases](https://github.com/hirbird/cobfig/releases) tab. 
3. Replace your existing `Team Fortress 2/tf/custom/cobfig.vpk` with the new release you just downloaded.
4. Any documented changes to the `cfg` folder structure (if any) should be addressed.