# Alacritty-themes

This is a script that lets you changing your Alacritty theme in the moment, updating automatically your configuration.

# Prerequisites

The indicated versions are the ones with which this script has been tested.

- docker v27.0.2
- alacritty v0.13.2.
- Themes have been obteined from [this repo](https://github.com/alacritty/alacritty-theme.git). You should clone it and place it in your alacritty configuration directory (`$HOME/.config/alacritty`)

## About Alacritty configuration file

- **Must** be a `.toml` file.
- **Must** have a line `### Colors ###` separating the theme configuration section at the end of the file. The script looks for the previous string to change everything after it with the new theme that you has chosen. Here is my personal config as an example:

```toml
# some config here
# ...
# ...

[window]
decorations = "full"
dynamic_padding = false
opacity = 1
startup_mode = "Windowed"
title = "Alacritty"

[window.class]
general = "Alacritty"
instance = "Alacritty"

[window.padding]
x = 12
y = 10

### Colors ###         <----  starts theme section
# Default colors
[colors.primary]
background = '#24273A' # base
foregrounDd = '#CAD3F5' # text
# Bright and dim foreground colors
dim_foreground = '#CAD3F5' # text
bright_foreground = '#CAD3F5' # text

# Cursor colors
[colors.cursor]
text = '#24273A' # base
cursor = '#F4DBD6' # rosewater

#  ...
#  ...
#  more theme config here
```

# How to use

## Using the script

- You must have [fzf](https://github.com/junegunn/fzf.git) installed. Just follow its installation instructions.

- Install the requirements.

```shell
pip install -r requirements.txt
```

- Tweak the script changing the `THEMES_DIR` and `CONFIG_FILE` variables.
    - The `THEMES_DIR` variable references the themes directory that you had to clone [before](#prerequisites) or created yourself.
    - The `CONFIG_FILE` variable references the `alacritty.toml` configuration file.

By this moment, you should be ready to run the script.

## Using the Docker image

I have pushed an [image to Docker Hub](https://hub.docker.com/r/vieitesss/alacritty-themes) with the script. Everything you should need to run it is Docker.

You can try it running the following command:

```shell
docker --rm -it -v $HOME/.config/alacritty:/app/alacritty vieitesss/alacritty-themes
```

It should download the image and run the script if you have everything well set up.

You can create a function in any sourced file or in your `.bashrc`/`.zshrc` with the previous command. Like this:

```bash
alacritty-themes() {
    docker --rm -it -v $HOME/.config/alacritty:/app/alacritty vieitesss/alacritty-themes
}
```

# TODO

- Improve Docker image so you don't have to have the themes locally.
