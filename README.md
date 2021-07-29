**what is cobfig good for?** performance enhancements, quality-of-life features, simplistic code, and keeping the charm of tf2. if you're just starting tf2 or want a simple config you won't have to mess with much, cobfig could work for you!

**what is cobfig NOT good for?** flexability, toaster/competitive performance, visual quality, and polish. cobfig is tailored around what *i want*. if you want something that'll give you insane performance, great graphics, or offer you tons of customization, you should check out *mastercomfig* or *cfg.tf*.

---

**installation**

1. download this repo as a `.zip`.
2. create a folder in `tf/custom`, e.g. `tf/custom/cobfig`.
3. extract everything out of the `.zip` into `tf/custom/cobfig`.

---

**customization**

cobfig offers some toggle-able and tune-able settings in the `cfg/custom` folder. in `custom/settings.cfg` you'll find global settings you can either remove (to use the defaults) or change to the options listed alongside it. typos and misformatted settings won't be recognized and will show an error in the console.

custom binds, stuff you need not found in cobfig, or commands you want to change that aren't in the settings files can be written in `custom/custom.cfg`. this file loads last and takes precendence over everything else in cobfig.

class-specific settings can be entered in class files, e.g. `custom/settings_scout.cfg`. these settings will load every time you pick the respective class. you can also write custom console commands that are specific to each class if you need to.
