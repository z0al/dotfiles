Cross platform keyboard shortcuts nix

```
shortcuts = {
	"test" = {
		keys = "<Super>p";
		cmd = "test -t";
	}
}
```

That should generate dconf settings on Linux

```
examples:
	CTRL+SHIFT+S
		<Primary><Shift>s
	ALT+F
		<Alt>f
	LEFT_CTRL+f
		<Primary>f

/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding
  '<Super>p'
/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command
  'test -t'
/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name
  'test'

/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
  ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']
```

```

```
